#include <algorithm>
#include <stdexcept>
#include <iostream>
#include <sstream>
#include <memory>

#include <map>
#include <vector>

#include <stdlib.h>
#include <signal.h>
#include <stdio.h>

#include "TROOT.h"
#include "TApplication.h"

#include "TFile.h"
#include "TObjArray.h"
#include "TStopwatch.h"
#include "TDatabasePDG.h"
#include "TParticlePDG.h"
#include "TLorentzVector.h"

#include "modules/Delphes.h"
#include "classes/DelphesStream.h"
#include "classes/DelphesClasses.h"
#include "classes/DelphesFactory.h"

#include "ExRootAnalysis/ExRootTreeWriter.h"
#include "ExRootAnalysis/ExRootTreeBranch.h"
#include "ExRootAnalysis/ExRootProgressBar.h"

#include "FWCore/FWLite/interface/AutoLibraryLoader.h"

#include "DataFormats/FWLite/interface/Event.h"
#include "DataFormats/FWLite/interface/Handle.h"
#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"
#include "SimDataFormats/PileupSummaryInfo/interface/PileupSummaryInfo.h"

using namespace std;

//---------------------------------------------------------------------------

void ConvertInput(fwlite::Event &event, DelphesFactory *factory, TObjArray *allParticleOutputArray, TObjArray *stableParticleOutputArray, TObjArray *stableParticleNoNuOutputArray, TObjArray *partonOutputArray, TObjArray *vbfQuarkOutputArray)
{
  fwlite::Handle< vector< reco::GenParticle > > handleParticle;
  vector< reco::GenParticle >::const_iterator itParticle;

  vector< const reco::Candidate * > vectorCandidate;
  vector< const reco::Candidate * >::iterator itCandidate;

  //cout << "In ConvertInput()" << endl ; 

  handleParticle.getByLabel(event, "genParticles");

  // cout << "handle: " << handleParticle.isValid() << endl ; 

  Candidate *candidate;
  TDatabasePDG *pdg;
  TParticlePDG *pdgParticle;
  Int_t pdgCode;

  Int_t pid, status;
  Double_t px, py, pz, e, mass;
  Double_t x, y, z;
  Double_t d0, dz, p, pt, ctgTheta, phi;

  pdg = TDatabasePDG::Instance();

  // cout << "Particle loop 1" << endl ; 
  for(itParticle = handleParticle->begin(); itParticle != handleParticle->end(); ++itParticle)
  {
    vectorCandidate.push_back(&*itParticle);
  }

  unsigned nVBFQuarks = 0;
  // cout << "Particle loop 2" << endl ; 
  for(itParticle = handleParticle->begin(); itParticle != handleParticle->end(); ++itParticle)
  {
    const reco::GenParticle &particle = *itParticle;

    pid = particle.pdgId();
    status = particle.status();
    px = particle.px(); py = particle.py(); pz = particle.pz(); e = particle.energy(); mass = particle.mass();
    x = particle.vx (); // particle.vx () - ((particle.px () * particle.vx () + particle.py () * particle.vy () + particle.pz () * particle.vz ()) / (particle.p () * particle.p ())) * particle.px ();
    y = particle.vy (); // particle.vy () - ((particle.px () * particle.vx () + particle.py () * particle.vy () + particle.pz () * particle.vz ()) / (particle.p () * particle.p ())) * particle.py ();
    z = particle.vz (); // particle.vz () - ((particle.px () * particle.vx () + particle.py () * particle.vy () + particle.pz () * particle.vz ()) / (particle.p () * particle.p ())) * particle.pz ();
    d0 = (x * particle.py () - y * particle.px ()) / particle.pt ();
    dz = z - (x * particle.px () + y * particle.py ()) / particle.pt () * (particle.pz () / particle.pt ());
    p = particle.p ();
    pt = particle.pt ();
    ctgTheta = 1.0 / tan (particle.theta ());
    phi = particle.phi ();

    candidate = factory->NewCandidate();

    // BMD additions: VBF 
    bool isVBFquark = false ; 
    // cout << "Checking VBF status: " << pid << endl ; 
    if ( status == 3 && abs(pid) < 10 && particle.numberOfMothers() > 0 ) { 
      for (unsigned int j=0; !isVBFquark && j<particle.numberOfMothers(); j++) {
	for (unsigned int k=0; k<particle.mother(j)->numberOfDaughters(); k++) {
	  if ( abs(particle.mother(j)->daughter(k)->pdgId()) == 25 ) {
	    isVBFquark = true ; break ;
	  }
	}
      }
    }
    isVBFquark && nVBFQuarks++;
    // if ( isVBFquark ) cout << "Found one!!!" << endl ; 

    candidate->PID = pid;
    pdgCode = TMath::Abs(candidate->PID);

    candidate->Status = status;


    //M1
    if(particle.mother()){
      itCandidate = find(vectorCandidate.begin(), vectorCandidate.end(), particle.mother());
      if(itCandidate != vectorCandidate.end()) candidate->M1 = distance(vectorCandidate.begin(), itCandidate);
    }

    //D1
    itCandidate = find(vectorCandidate.begin(), vectorCandidate.end(), particle.daughter(0));
    if(itCandidate != vectorCandidate.end()) candidate->D1 = distance(vectorCandidate.begin(), itCandidate);

    //D2
    if(particle.numberOfDaughters() > 1)
      itCandidate = find(vectorCandidate.begin(), vectorCandidate.end(), particle.daughter(1));
    else
      itCandidate = find(vectorCandidate.begin(), vectorCandidate.end(), particle.daughter(particle.numberOfDaughters() - 1));

    if(itCandidate != vectorCandidate.end()) candidate->D2 = distance(vectorCandidate.begin(), itCandidate);

    pdgParticle = pdg->GetParticle(pid);
    candidate->Charge = pdgParticle ? Int_t(pdgParticle->Charge()/3.0) : -999;
    candidate->Mass = mass;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    candidate->D0 = d0 * 10.0;
    candidate->DZ = dz * 10.0;
    candidate->P = p;
    candidate->PT = pt;
    candidate->CtgTheta = ctgTheta;
    candidate->Phi = phi;

    //if (candidate->Charge != 0 && sqrt (x * x + y * y) > 7.0)
    //  continue;

    allParticleOutputArray->Add(candidate);

    if(!pdgParticle) continue;

    if(status == 1)
    {
      stableParticleOutputArray->Add(candidate);
      if ( pdgCode != 12 && pdgCode != 14 && pdgCode != 16 )
	stableParticleNoNuOutputArray->Add(candidate);
    }
    else if(pdgCode <= 5 || pdgCode == 21 || pdgCode == 15)
    {
      if ( status != 3 ) partonOutputArray->Add(candidate);
      if ( isVBFquark ) vbfQuarkOutputArray->Add(candidate);
    }
    // cout << "Moving on..." << endl ; 
  }
  if (nVBFQuarks != 0 && nVBFQuarks != 2)
    cout << "  WARNING: found " << nVBFQuarks << " VBF quarks." << endl;
  // cout << "Done!" << endl ; 
}

void ConvertPUInput(fwlite::Event &event, DelphesFactory *factory, TObjArray *puGoodTrackOutputArray, TObjArray *primaryGoodTrackOutputArray, TObjArray *puBadTrackOutputArray, TObjArray *primaryBadTrackOutputArray, TObjArray *puNeutralOutputArray, TObjArray *primaryNeutralOutputArray, TObjArray *status3OutputArray)
{
  fwlite::Handle< vector< reco::Track > > handleTrack;
  vector< reco::Track >::const_iterator itTrack;
  fwlite::Handle< vector< reco::PFCandidate > > handlePFCandidate;
  vector< reco::PFCandidate >::const_iterator itPFCandidate;
  fwlite::Handle< vector< reco::Track > > handlePrimaryTrack;
  vector< reco::Track >::const_iterator itPrimaryTrack;
  fwlite::Handle< vector< reco::PFCandidate > > handlePrimaryPFCandidate;
  vector< reco::PFCandidate >::const_iterator itPrimaryPFCandidate;
  fwlite::Handle< vector< reco::GenParticle > > handleStatus3;
  vector< reco::GenParticle >::const_iterator itStatus3;

  handleTrack.getByLabel(event, "PileupProducer", "pileupTracks");
  handlePFCandidate.getByLabel(event, "PileupProducer", "pileupNeutrals");
  handlePrimaryTrack.getByLabel(event, "PileupProducer", "primaryTracks");
  handlePrimaryPFCandidate.getByLabel(event, "PileupProducer", "primaryNeutrals");
  handleStatus3.getByLabel(event, "PileupProducer", "status3");

  Candidate *candidate;
  TDatabasePDG *pdg;
  TParticlePDG *pdgParticle;

  Int_t pid, status;
  Double_t px, py, pz, e, mass;
  Double_t x, y, z;
  Double_t d0, dz, p, pt, ctgTheta, phi;
  Double_t d0Error, dzError, pError, ptError, ctgThetaError, phiError;
  Double_t normalizedChi2, chi2, ndf;
  Int_t pixelLayersWithMeasurement, trackerLayersWithMeasurement;

  pdg = TDatabasePDG::Instance();

  for(itTrack = handleTrack->begin(); itTrack != handleTrack->end(); ++itTrack)
  {
    const reco::Track &track = *itTrack;

    pid = 211;
    status = 1;
    px = track.px(); py = track.py(); pz = track.pz();
    x = track.vx(); y = track.vy(); z = track.vz();
    normalizedChi2 = track.normalizedChi2 ();
    chi2 = track.chi2 ();
    ndf = track.ndof ();
    pixelLayersWithMeasurement = track.hitPattern ().pixelLayersWithMeasurement ();
    trackerLayersWithMeasurement = track.hitPattern ().trackerLayersWithMeasurement ();
    d0 = track.d0 ();
    dz = track.dz ();
    p = track.p ();
    pt = track.pt ();
    ctgTheta = 1.0 / tan (track.theta ());
    phi = track.phi ();
    d0Error = track.d0Error ();
    dzError = track.dzError ();
    pError = sqrt (track.thetaError () * track.thetaError () * track.pt () * track.pt () * (1.0 / tan (track.theta ())) * (1.0 / tan (track.theta ()))
                 + track.ptError () * track.ptError ()) * (1.0 / sin (track.theta ()));
    ptError = track.ptError ();
    ctgThetaError = track.thetaError () * fabs (1.0 / tan (track.theta ())) * (1.0 / sin (track.theta ()));
    phiError = track.phiError ();

    pdgParticle = pdg->GetParticle(pid);
    mass = pdgParticle->Mass();
    e = sqrt (px * px + py * py + pz * pz + mass * mass);

    candidate = factory->NewCandidate();
    candidate->PID = pid;
    candidate->Status = status;
    candidate->M1 = -999;
    candidate->D1 = -999;
    candidate->D2 = -999;
    candidate->Charge = track.charge();
    candidate->Mass = mass;
    candidate->IsPU = 1;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    candidate->D0 = d0 * 10.0;
    candidate->DZ = dz * 10.0;
    candidate->P = p;
    candidate->PT = pt;
    candidate->CtgTheta = ctgTheta;
    candidate->Phi = phi;

    candidate->ErrorD0 = d0Error;
    candidate->ErrorDZ = dzError;
    candidate->ErrorP = pError;
    candidate->ErrorPT = ptError;
    candidate->ErrorCtgTheta = ctgThetaError;
    candidate->ErrorPhi = phiError;

    candidate->Chi2 = chi2;
    candidate->NDF = ndf;

    if (normalizedChi2 < 20.0
     && pixelLayersWithMeasurement >= 2
     && trackerLayersWithMeasurement >= 5
     && fabs (d0 / d0Error) < 5.0)
      puGoodTrackOutputArray->Add(candidate);
    else
      puBadTrackOutputArray->Add(candidate);
  }
  for(itPrimaryTrack = handlePrimaryTrack->begin(); itPrimaryTrack != handlePrimaryTrack->end(); ++itPrimaryTrack)
  {
    const reco::Track &track = *itPrimaryTrack;

    pid = 211;
    status = 1;
    px = track.px(); py = track.py(); pz = track.pz();
    x = track.vx(); y = track.vy(); z = track.dz();
    normalizedChi2 = track.normalizedChi2 ();
    chi2 = track.chi2 ();
    ndf = track.ndof ();
    pixelLayersWithMeasurement = track.hitPattern ().pixelLayersWithMeasurement ();
    trackerLayersWithMeasurement = track.hitPattern ().trackerLayersWithMeasurement ();
    d0 = track.d0 ();
    dz = track.dz ();
    p = track.p ();
    pt = track.pt ();
    ctgTheta = 1.0 / tan (track.theta ());
    phi = track.phi ();
    d0Error = track.d0Error ();
    dzError = track.dzError ();
    pError = sqrt (track.thetaError () * track.thetaError () * track.pt () * track.pt () * (1.0 / tan (track.theta ())) * (1.0 / tan (track.theta ()))
                 + track.ptError () * track.ptError ()) * (1.0 / sin (track.theta ()));
    ptError = track.ptError ();
    ctgThetaError = track.thetaError () * fabs (1.0 / tan (track.theta ())) * (1.0 / sin (track.theta ()));
    phiError = track.phiError ();

    pdgParticle = pdg->GetParticle(pid);
    mass = pdgParticle->Mass();
    e = sqrt (px * px + py * py + pz * pz + mass * mass);

    candidate = factory->NewCandidate();
    candidate->PID = pid;
    candidate->Status = status;
    candidate->M1 = -999;
    candidate->D1 = -999;
    candidate->D2 = -999;
    candidate->Charge = track.charge();
    candidate->Mass = mass;
    candidate->IsPU = 0;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    candidate->D0 = d0 * 10.0;
    candidate->DZ = dz * 10.0;
    candidate->P = p;
    candidate->PT = pt;
    candidate->CtgTheta = ctgTheta;
    candidate->Phi = phi;

    candidate->ErrorD0 = d0Error;
    candidate->ErrorDZ = dzError;
    candidate->ErrorP = pError;
    candidate->ErrorPT = ptError;
    candidate->ErrorCtgTheta = ctgThetaError;
    candidate->ErrorPhi = phiError;

    candidate->Chi2 = chi2;
    candidate->NDF = ndf;

    if (normalizedChi2 < 20.0
     && pixelLayersWithMeasurement >= 2
     && trackerLayersWithMeasurement >= 5
     && fabs (d0 / d0Error) < 5.0)
      primaryGoodTrackOutputArray->Add(candidate);
    else
      primaryBadTrackOutputArray->Add(candidate);
  }
  for(itPFCandidate = handlePFCandidate->begin(); itPFCandidate != handlePFCandidate->end(); ++itPFCandidate)
  {
    const reco::PFCandidate &pfCandidate = *itPFCandidate;

    pid = 111;
    status = 1;
    px = pfCandidate.px(); py = pfCandidate.py(); pz = pfCandidate.pz();
    x = pfCandidate.vx(); y = pfCandidate.vy(); z = pfCandidate.vz();

    pdgParticle = pdg->GetParticle(pid);
    mass = pdgParticle->Mass();
    e = sqrt (px * px + py * py + pz * pz + mass * mass);

    candidate = factory->NewCandidate();
    candidate->PID = pid;
    candidate->Status = status;
    candidate->M1 = -999;
    candidate->D1 = -999;
    candidate->D2 = -999;
    candidate->Charge = pfCandidate.charge();
    candidate->Mass = mass;
    candidate->IsPU = 1;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    puNeutralOutputArray->Add(candidate);
  }
  for(itPrimaryPFCandidate = handlePrimaryPFCandidate->begin(); itPrimaryPFCandidate != handlePrimaryPFCandidate->end(); ++itPrimaryPFCandidate)
  {
    const reco::PFCandidate &pfCandidate = *itPrimaryPFCandidate;

    pid = 111;
    status = 1;
    px = pfCandidate.px(); py = pfCandidate.py(); pz = pfCandidate.pz();
    x = pfCandidate.vx(); y = pfCandidate.vy(); z = pfCandidate.vz();

    pdgParticle = pdg->GetParticle(pid);
    mass = pdgParticle->Mass();
    e = sqrt (px * px + py * py + pz * pz + mass * mass);

    candidate = factory->NewCandidate();
    candidate->PID = pid;
    candidate->Status = status;
    candidate->M1 = -999;
    candidate->D1 = -999;
    candidate->D2 = -999;
    candidate->Charge = pfCandidate.charge();
    candidate->Mass = mass;
    candidate->IsPU = 0;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    primaryNeutralOutputArray->Add(candidate);
  }
  for(itStatus3 = handleStatus3->begin(); itStatus3 != handleStatus3->end(); ++itStatus3)
  {
    const reco::GenParticle &genParticle = *itStatus3;
    if (fabs (genParticle.eta ()) > 1000.0)
      continue;

    pid = genParticle.pdgId ();
    status = genParticle.status ();
    px = genParticle.px(); py = genParticle.py(); pz = genParticle.pz(); e = genParticle.energy(); mass = genParticle.mass();
    x = genParticle.vx () - ((genParticle.px () * genParticle.vx () + genParticle.py () * genParticle.vy () + genParticle.pz () * genParticle.vz ()) / (genParticle.p () * genParticle.p ())) * genParticle.px ();
    y = genParticle.vy () - ((genParticle.px () * genParticle.vx () + genParticle.py () * genParticle.vy () + genParticle.pz () * genParticle.vz ()) / (genParticle.p () * genParticle.p ())) * genParticle.py ();
    z = genParticle.vz () - ((genParticle.px () * genParticle.vx () + genParticle.py () * genParticle.vy () + genParticle.pz () * genParticle.vz ()) / (genParticle.p () * genParticle.p ())) * genParticle.pz ();
    d0 = (x * genParticle.py () - y * genParticle.px ()) / genParticle.pt ();
    dz = z - (x * genParticle.px () + y * genParticle.py ()) / genParticle.pt () * (genParticle.pz () / genParticle.pt ());
    p = genParticle.p ();
    pt = genParticle.pt ();
    ctgTheta = 1.0 / tan (genParticle.theta ());
    phi = genParticle.phi ();

    pdgParticle = pdg->GetParticle(pid);

    candidate = factory->NewCandidate();
    candidate->PID = pid;
    candidate->Status = status;
    candidate->M1 = -999;
    candidate->D1 = -999;
    candidate->D2 = -999;
    candidate->Charge = pdgParticle ? Int_t(pdgParticle->Charge()/3.0) : -999;
    candidate->Mass = mass;
    candidate->IsPU = 0;

    candidate->Momentum.SetPxPyPzE(px, py, pz, e);

    candidate->Position.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);
    candidate->InitialPosition.SetXYZT(x * 10.0, y * 10.0, z * 10.0, 0.0);

    candidate->D0 = d0 * 10.0;
    candidate->DZ = dz * 10.0;
    candidate->P = p;
    candidate->PT = pt;
    candidate->CtgTheta = ctgTheta;
    candidate->Phi = phi;

    status3OutputArray->Add(candidate);
  }
}

void ConvertNPU(fwlite::Event &event, DelphesFactory *factory, TObjArray *nPUOutputArray)
{
  fwlite::Handle< vector< PileupSummaryInfo > > handlePU;
  vector< PileupSummaryInfo >::const_iterator itPU;

  handlePU.getByLabel(event, "addPileupInfo");

  Candidate *candidate;

  for(itPU = handlePU->begin(); itPU != handlePU->end(); ++itPU)
  {
    const PileupSummaryInfo &pu = *itPU;
    if (pu.getBunchCrossing ())
      continue;

    candidate = factory->NewCandidate();
    candidate->Momentum.SetPtEtaPhiE((float)pu.getPU_NumInteractions(), 0.0, 0.0, (float)pu.getPU_NumInteractions());
    nPUOutputArray->Add(candidate);
  }
}

void ConvertEventInfo(fwlite::Event &event, DelphesFactory *factory, TObjArray *eventInfoOutputArray)
{
  Candidate *candidate;

  candidate = factory->NewCandidate();
  candidate->Run  = event.id().run();
  candidate->Lumi = event.id().luminosityBlock();
  candidate->Evt  = event.id().event();
  eventInfoOutputArray->Add(candidate);

}

//---------------------------------------------------------------------------

bool isnumber (const string &s, double &x)
{
  char *p;
  x = strtod (s.c_str (), &p);
  return !(*p);
}

static bool interrupted = false;

void SignalHandler(int sig)
{
  interrupted = true;
}

//---------------------------------------------------------------------------

int main(int argc, char *argv[])
{
  char appName[] = "DelphesCMSFWLite";
  stringstream message;
  TFile *inputFile = 0;
  TFile *puInputFile = 0;
  TFile *outputFile = 0;
  TStopwatch eventStopWatch;
  ExRootTreeWriter *treeWriter = 0;
  ExRootConfReader *confReader = 0;
  Delphes *modularDelphes = 0;
  DelphesFactory *factory = 0;
  TObjArray *allParticleOutputArray = 0, *stableParticleOutputArray = 0, *stableParticleNoNuOutputArray = 0, *partonOutputArray = 0, *vbfQuarkOutputArray = 0, *eventInfoOutputArray = 0, *puGoodTrackOutputArray = 0, *primaryGoodTrackOutputArray = 0, *puBadTrackOutputArray = 0, *primaryBadTrackOutputArray = 0, *puNeutralOutputArray = 0, *primaryNeutralOutputArray = 0, *status3OutputArray = 0, *nPUOutputArray = 0;
  Int_t i;
  Long64_t eventCounter, numberOfEvents, numberOfPUEvents;
  Int_t maxEvents, skipEvents;
  double skipFactor;
  Bool_t puFilePresent;

  if(argc < 4)
  {
    cout << " Usage: " << appName << " config_file" << " output_file" << " input_file(s)" << " [pu_input_file(s)]" << endl;
    cout << " config_file - configuration file in Tcl format," << endl;
    cout << " output_file - output file in ROOT format," << endl;
    cout << " input_file(s) - input file(s) in ROOT format." << endl;
    cout << " pu_input_file(s) - PU input file(s) in ROOT format." << endl;
    return 1;
  }

  // cout << "In main()" << endl ; 

  signal(SIGINT, SignalHandler);

  gROOT->SetBatch();

  int appargc = 1;
  char *appargv[] = {appName};
  TApplication app(appName, &appargc, appargv);

  AutoLibraryLoader::enable();

  try
  {
    outputFile = TFile::Open(argv[2], "RECREATE");

    if(outputFile == NULL)
    {
      message << "can't open " << argv[2] << endl;
      throw runtime_error(message.str());
    } else { 
      cout << "Successfully opening output file for writing" << endl ; 
    }

    treeWriter = new ExRootTreeWriter(outputFile, "Delphes");

    confReader = new ExRootConfReader;
    confReader->ReadFile(argv[1]);

    maxEvents = confReader->GetInt("::MaxEvents", 0);
    skipEvents = confReader->GetInt("::SkipEvents", 0);
    puFilePresent = (argc != 4 && (argc != 5 || !isnumber (argv[4], skipFactor)));
    if ((argc == 5 && isnumber (argv[4], skipFactor))
     || (argc == 6 && isnumber (argv[5], skipFactor)))
      skipEvents *= (int) skipFactor;

    if(maxEvents < 0)
    {
      throw runtime_error("MaxEvents must be zero or positive");
    }

    if(skipEvents < 0)
    {
      throw runtime_error("SkipEvents must be zero or positive");
    }

    modularDelphes = new Delphes("Delphes");
    modularDelphes->SetConfReader(confReader);
    modularDelphes->SetTreeWriter(treeWriter);

    factory = modularDelphes->GetFactory();
    allParticleOutputArray = modularDelphes->ExportArray("allParticles");
    stableParticleOutputArray = modularDelphes->ExportArray("stableParticles");
    stableParticleNoNuOutputArray = modularDelphes->ExportArray("stableParticlesNoNus");
    partonOutputArray = modularDelphes->ExportArray("partons");
    vbfQuarkOutputArray = modularDelphes->ExportArray("vbfQuarks");
    eventInfoOutputArray = modularDelphes->ExportArray("eventInfo");
    puGoodTrackOutputArray = modularDelphes->ExportArray("puGoodTracks");
    primaryGoodTrackOutputArray = modularDelphes->ExportArray("primaryGoodTracks");
    puBadTrackOutputArray = modularDelphes->ExportArray("puBadTracks");
    primaryBadTrackOutputArray = modularDelphes->ExportArray("primaryBadTracks");
    puNeutralOutputArray = modularDelphes->ExportArray("puNeutrals");
    primaryNeutralOutputArray = modularDelphes->ExportArray("primaryNeutrals");
    status3OutputArray = modularDelphes->ExportArray("status3");
    nPUOutputArray = modularDelphes->ExportArray("NPU");
    modularDelphes->InitTask();

    for(i = 3; i < 4 && !interrupted; ++i)
    {
      cout << "** Reading " << argv[i] << endl;

      inputFile = TFile::Open(argv[i]);

      if (puFilePresent)
        {
          cout << "** Reading " << argv[i + 1] << endl;
          puInputFile = TFile::Open(argv[i + 1]);
        }

      if(inputFile == NULL)
      {
        message << "can't open " << argv[i] << endl;
        throw runtime_error(message.str());
      } else { 
	cout << "Successfully opened input file for reading" << endl ; 
      }
      if (puFilePresent)
        {
          if(puInputFile == NULL)
          {
            message << "can't open " << argv[i + 1] << endl;
            throw runtime_error(message.str());
          } else { 
            cout << "Successfully opened PU input file for reading" << endl ; 
          }
        }

      fwlite::Event event(inputFile);
      numberOfEvents = event.size();
      // cout << "Number of events: " << numberOfEvents << endl ; 
      fwlite::Event *puEvent = NULL;
      if (puFilePresent)
        {
          puEvent = new fwlite::Event (puInputFile);
          numberOfPUEvents = puEvent->size();
          if (numberOfEvents != numberOfPUEvents)
            cout << "Number of events in pileup file (" << numberOfPUEvents << ") does not match number of events in input file (" << numberOfEvents << ")." << endl;
          puEvent->toBegin ();
        }

      if(numberOfEvents <= 0) continue;

      // ExRootProgressBar progressBar(numberOfEvents - 1);
      ExRootProgressBar progressBar(-1);

      // Loop over all objects
      eventCounter = 0;
      modularDelphes->Clear();
      treeWriter->Clear();
      // for(event.toBegin(); !event.atEnd() && !interrupted; ++event)
      for(event.toBegin(); !event.atEnd() && !(puFilePresent && puEvent->atEnd()) && !interrupted && (maxEvents > 0 ? eventCounter - skipEvents < maxEvents : true); ++event)
      {
        ++eventCounter;
        if (eventCounter > skipEvents)
          {
            // cout << "At event " << eventCounter << endl ; 
            cout << "processing record " << eventCounter << "..." << endl;
            cout << "  input event:  " << event.id () << endl;
            ConvertInput(event, factory, allParticleOutputArray, stableParticleOutputArray, stableParticleNoNuOutputArray, partonOutputArray, vbfQuarkOutputArray);
            ConvertEventInfo(event, factory, eventInfoOutputArray);
            if (puFilePresent)
              {
                cout << "  pileup event: " << puEvent->id () << endl;
                ConvertPUInput(*puEvent, factory, puGoodTrackOutputArray, primaryGoodTrackOutputArray, puBadTrackOutputArray, primaryBadTrackOutputArray, puNeutralOutputArray, primaryNeutralOutputArray, status3OutputArray);
                ConvertNPU(*puEvent, factory, nPUOutputArray);
              }
            // cout << "Input converted " << endl ; 
            modularDelphes->ProcessTask();

            // cout << "Trying to fill" << endl ; 
            treeWriter->Fill();

            // cout << "Clearing" << endl ; 
            modularDelphes->Clear();
            treeWriter->Clear();

            // cout << "Cleaned up, moving on..." << endl ; 

            progressBar.Update(eventCounter, eventCounter);
            // progressBar.Update(eventCounter);
            // cout << "Moving on to next event" << endl ; 
          }
        if (puFilePresent)
          ++(*puEvent);
      }

      progressBar.Update(eventCounter, eventCounter, kTRUE);
      progressBar.Finish();

      inputFile->Close();
      if (puFilePresent)
        puInputFile->Close();
    }

    modularDelphes->FinishTask();
    treeWriter->Write();

    cout << "** Exiting..." << endl;

    delete modularDelphes;
    delete confReader;
    delete treeWriter;
    delete outputFile;

    return 0;
  }
  catch(runtime_error &e)
  {
    if(treeWriter) delete treeWriter;
    if(outputFile) delete outputFile;
    cerr << "** ERROR: " << e.what() << endl;
    return 1;
  }
}
