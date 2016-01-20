/** \class TreeWriter
 *
 *  Fills ROOT tree branches.
 *
 *  $Date: 2013-05-16 16:28:38 +0200 (Thu, 16 May 2013) $
 *  $Revision: 1115 $
 *
 *
 *  \author P. Demin - UCL, Louvain-la-Neuve
 *
 */

#include "modules/TreeWriter.h"

//------------------------------------------------------------------------------

TreeWriter::TreeWriter()
{
}

//------------------------------------------------------------------------------

TreeWriter::~TreeWriter()
{
}

//------------------------------------------------------------------------------

void TreeWriter::Init()
{
  fClassMap[GenParticle::Class()] = &TreeWriter::ProcessParticles;
  fClassMap[Track::Class()] = &TreeWriter::ProcessTracks;
  fClassMap[Tower::Class()] = &TreeWriter::ProcessTowers;
  fClassMap[Photon::Class()] = &TreeWriter::ProcessPhotons;
  fClassMap[Electron::Class()] = &TreeWriter::ProcessElectrons;
  fClassMap[Muon::Class()] = &TreeWriter::ProcessMuons;
  fClassMap[Jet::Class()] = &TreeWriter::ProcessJets;
  fClassMap[MissingET::Class()] = &TreeWriter::ProcessMissingET;
  fClassMap[ScalarHT::Class()] = &TreeWriter::ProcessScalarHT;
  fClassMap[Cluster::Class()] = &TreeWriter::ProcessClusters;
  fClassMap[Rho::Class()] = &TreeWriter::ProcessRho;
  fClassMap[IsoTrack::Class()] = &TreeWriter::ProcessIsoTracks;
  fClassMap[Event::Class()] = &TreeWriter::ProcessEventInfo;

  TBranchMap::iterator itBranchMap;
  map< TClass *, TProcessMethod >::iterator itClassMap;

  // read branch configuration and
  // import array with output from filter/classifier/jetfinder modules

  fOffsetFromModifyBeamSpot = GetInt("OffsetFromModifyBeamSpot", 0);

  ExRootConfParam param = GetParam("Branch");
  Long_t i, size;
  TString branchName, branchClassName, branchInputArray;
  TClass *branchClass;
  TObjArray *array;
  ExRootTreeBranch *branch;

  size = param.GetSize();
  for(i = 0; i < size/3; ++i)
  {
    branchInputArray = param[i*3].GetString();
    branchName = param[i*3 + 1].GetString();
    branchClassName = param[i*3 + 2].GetString();

    branchClass = gROOT->GetClass(branchClassName);

    if(!branchClass)
    {
      cout << "** ERROR: cannot find class '" << branchClassName << "'" << endl;
      continue;
    }

    itClassMap = fClassMap.find(branchClass);
    if(itClassMap == fClassMap.end())
    {
      cout << "** ERROR: cannot create branch for class '" << branchClassName << "'" << endl;
      continue;
    }

    array = ImportArray(branchInputArray);
    branch = NewBranch(branchName, branchClass);

    fBranchMap.insert(make_pair(branch, make_pair(itClassMap->second, array)));
  }

}

//------------------------------------------------------------------------------

void TreeWriter::Finish()
{

}

//------------------------------------------------------------------------------

void TreeWriter::FillParticles(Candidate *candidate, TRefArray *array)
{
  TIter it1(candidate->GetCandidates());
  it1.Reset();
  array->Clear();
  while((candidate = static_cast<Candidate*>(it1.Next())))
  {
    TIter it2(candidate->GetCandidates());

    // particle
    if(candidate->GetCandidates()->GetEntriesFast() == 0)
    {
      array->Add(candidate);
      continue;
    }

    // track
    //    candidate = static_cast<Candidate*>(candidate->GetCandidates()->At(0));
    candidate = static_cast<Candidate*>(candidate->GetCandidates()->Last()); //?
    if(candidate->GetCandidates()->GetEntriesFast() == 0)
    {
      array->Add(candidate);
      continue;
    }

    // tower
    it2.Reset();
    while((candidate = static_cast<Candidate*>(it2.Next())))
    {
      //      array->Add(candidate->GetCandidates()->At(0));
      array->Add(candidate->GetCandidates()->Last());
    }
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessParticles(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  GenParticle *entry = 0;
  Double_t pt, signPz, cosTheta, eta, rapidity;

  // loop over all particles
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;
    const TLorentzVector &position = candidate->Position;

    entry = static_cast<GenParticle*>(branch->NewEntry());

    entry->SetBit(kIsReferenced);
    entry->SetUniqueID(candidate->GetUniqueID());

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());
    rapidity = (cosTheta == 1.0 ? signPz*999.9 : momentum.Rapidity());

    entry->PID = candidate->PID;

    entry->Status = candidate->Status;
    entry->IsPU = candidate->IsPU;


    entry->M1 = candidate->M1;
    entry->M2 = candidate->M2;

    entry->D1 = candidate->D1;
    entry->D2 = candidate->D2;

    entry->Charge = candidate->Charge;
    entry->Mass = candidate->Mass;

    entry->E = momentum.E();
    entry->Px = momentum.Px();
    entry->Py = momentum.Py();
    entry->Pz = momentum.Pz();

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;

    entry->Rapidity = rapidity;

    entry->X = position.X();
    entry->Y = position.Y();
    entry->Z = position.Z();
    entry->T = position.T();

  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessTracks(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Candidate *particle = 0;
  Track *entry = 0;
  Double_t d0, d0Error, trueD0, dz, dzError, trueDZ, p, pError, trueP, pt, ptError, truePT, ctgTheta, ctgThetaError, trueCtgTheta, phi, phiError, truePhi, signz, cosTheta, eta;

  // loop over all jets
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &position = candidate->Position;
    const TLorentzVector &initialPosition = candidate->InitialPosition;

    cosTheta = TMath::Abs(position.CosTheta());
    signz = (position.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signz*999.9 : position.Eta());

    entry = static_cast<Track*>(branch->NewEntry());

    entry->SetBit(kIsReferenced);
    entry->SetUniqueID(candidate->GetUniqueID());

    entry->PID = candidate->PID;

    entry->Charge = candidate->Charge;

    entry->EtaOuter = eta;
    entry->PhiOuter = position.Phi();

    entry->XOuter = position.X();
    entry->YOuter = position.Y();
    entry->ZOuter = position.Z();
    entry->TOuter = position.T();

    const TLorentzVector &momentum = candidate->Momentum;

    d0 = candidate->D0;
    d0Error = candidate->ErrorD0;
    trueD0 = candidate->TrueD0;
    dz = candidate->DZ;
    dzError = candidate->ErrorDZ;
    trueDZ = candidate->TrueDZ;
    p = candidate->P;
    pError = candidate->ErrorP;
    trueP = candidate->TrueP;
    pt = candidate->PT;
    ptError = candidate->ErrorPT;
    truePT = candidate->TruePT;
    ctgTheta = candidate->CtgTheta;
    ctgThetaError = candidate->ErrorCtgTheta;
    trueCtgTheta = candidate->TrueCtgTheta;
    phi = candidate->Phi;
    phiError = candidate->ErrorPhi;
    truePhi = candidate->TruePhi;

    cosTheta = TMath::Abs(momentum.CosTheta());
    signz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signz*999.9 : momentum.Eta());

    entry->D0 = d0;
    entry->ErrorD0 = d0Error;
    entry->TrueD0 = trueD0;
    entry->DZ = dz;
    entry->ErrorDZ = dzError;
    entry->TrueDZ = trueDZ;
    entry->P = p;
    entry->ErrorP = pError;
    entry->TrueP = trueP;
    entry->PT = pt;
    entry->ErrorPT = ptError;
    entry->TruePT = truePT;
    entry->CtgTheta = ctgTheta;
    entry->ErrorCtgTheta = ctgThetaError;
    entry->TrueCtgTheta = trueCtgTheta;
    entry->Phi = phi;
    entry->ErrorPhi = phiError;
    entry->TruePhi = truePhi;

    entry->Eta = eta;

    entry->Chi2 = candidate->Chi2;
    entry->NDF = candidate->NDF;

    /*particle = static_cast<Candidate*>(candidate->GetCandidates()->At(fOffsetFromModifyBeamSpot));
    const TLorentzVector &initialPosition = particle->Position;
    const TLorentzVector &initialError = particle->PositionError;*/

    entry->X = initialPosition.X();
    entry->Y = initialPosition.Y();
    entry->Z = initialPosition.Z();
    entry->T = initialPosition.T();

    entry->IsPU = candidate->IsPU;
    entry->ClusterIndex = candidate->ClusterIndex;
    entry->IsRecoPU = candidate->IsRecoPU;

    entry->Particle = particle;

    /*
    cout << "  SCZ Processing track with Inner X Y Z T " << entry->X << " " << entry->Y << " " << entry->Z << " " << entry->T << endl;
    cout << "                        and Outer X Y Z T " << entry->XOuter << " " << entry->YOuter << " " << entry->ZOuter << " " << entry->TOuter << endl;
    */

  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessTowers(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Tower *entry = 0;
  Double_t pt, signPz, cosTheta, eta;

  // loop over all jets
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<Tower*>(branch->NewEntry());

    entry->SetBit(kIsReferenced);
    entry->SetUniqueID(candidate->GetUniqueID());

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->ET = pt;
    entry->E = momentum.E();
    entry->Eem = candidate->Eem;
    entry->Ehad = candidate->Ehad;
    entry->Edges[0] = candidate->Edges[0];
    entry->Edges[1] = candidate->Edges[1];
    entry->Edges[2] = candidate->Edges[2];
    entry->Edges[3] = candidate->Edges[3];

    entry->TOuter = candidate->Position.T();
    entry->nTimes = candidate->nTimes;

    FillParticles(candidate, &entry->Particles);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessPhotons(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Photon *entry = 0;
  Double_t pt, signPz, cosTheta, eta;

  array->Sort();

  // loop over all photons
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    TIter it1(candidate->GetCandidates());
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<Photon*>(branch->NewEntry());

    entry->IsolationVar = candidate->IsolationVar;
    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;
    entry->E = momentum.E();

    entry->EhadOverEem = candidate->Eem > 0.0 ? candidate->Ehad/candidate->Eem : 999.9;

    entry->TOuter = candidate->Position.T();
    FillParticles(candidate, &entry->Particles);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessElectrons(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Electron *entry = 0;
  Double_t pt, signPz, cosTheta, eta;

  array->Sort();

  // loop over all electrons
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<Electron*>(branch->NewEntry());

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;
    entry->IsolationVar = candidate->IsolationVar;
    entry->Charge = candidate->Charge;

    entry->EhadOverEem = 0.0;

    entry->TOuter = candidate->Position.T();

    entry->Particle = candidate->GetCandidates()->At(fOffsetFromModifyBeamSpot);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessMuons(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Muon *entry = 0;
  Double_t pt, signPz, cosTheta, eta;

  array->Sort();

  // loop over all muons
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<Muon*>(branch->NewEntry());

    entry->SetBit(kIsReferenced);
    entry->SetUniqueID(candidate->GetUniqueID());

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;
    entry->IsolationVar = candidate->IsolationVar;

    entry->Charge = candidate->Charge;

    entry->Particle = candidate->GetCandidates()->At(fOffsetFromModifyBeamSpot);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessIsoTracks(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  IsoTrack *entry = 0;
  Double_t pt, signPz, cosTheta, eta;

  array->Sort();

  // loop over all IsoTracks
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<IsoTrack*>(branch->NewEntry());

    entry->SetBit(kIsReferenced);
    entry->SetUniqueID(candidate->GetUniqueID());

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;
    entry->IsolationVar = candidate->TrackIsolationVar;

    entry->Charge = candidate->Charge;
    entry->IsEMCand = candidate->IsEMCand;

    entry->Particle = candidate->GetCandidates()->At(fOffsetFromModifyBeamSpot);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessJets(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0, *constituent = 0;
  Jet *entry = 0;
  Double_t pt, signPz, cosTheta, eta;
  Double_t ecalEnergy, hcalEnergy;

  array->Sort();

  // loop over all jets
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    TIter itConstituents(candidate->GetCandidates());
    const TLorentzVector &momentum = candidate->Momentum;

    pt = momentum.Pt();
    cosTheta = TMath::Abs(momentum.CosTheta());
    signPz = (momentum.Pz() >= 0.0) ? 1.0 : -1.0;
    eta = (cosTheta == 1.0 ? signPz*999.9 : momentum.Eta());

    entry = static_cast<Jet*>(branch->NewEntry());

    entry->Eta = eta;
    entry->Phi = momentum.Phi();
    entry->PT = pt;

    entry->Mass = momentum.M();

    entry->DeltaEta = candidate->DeltaEta;
    entry->DeltaPhi = candidate->DeltaPhi;

    entry->BTag = candidate->BTag;
    entry->TauTag = candidate->TauTag;
    entry->SSV = candidate->SSV;
    entry->WTag = candidate->WTag;
    entry->TopTag = candidate->TopTag;
    entry->HTag = candidate->HTag;

    entry->Tau1=candidate->Tau1;
    entry->Tau2=candidate->Tau2;
    entry->Tau3=candidate->Tau3;

    entry->TrimmedMass=candidate->TrimmedMass;
    entry->NSubJets=candidate->NSubJets;
    entry->MassDrop=candidate->MassDrop;

    entry->Charge = candidate->Charge;

    entry->Beta = candidate->Beta;
    entry->BetaStar = candidate->BetaStar;
    entry->SumPtCh = candidate->SumPtCh;
    entry->SumPtChPV = candidate->SumPtChPV;
    entry->SumPtChPU = candidate->SumPtChPU;
    entry->MeanSqDeltaR = candidate->MeanSqDeltaR;
    entry->NCharged = candidate->NCharged;
    entry->NNeutrals = candidate->NNeutrals;
    entry->PTD = candidate->PTD;
    for (int i = 0 ; i < 5 ; i++) {
      entry->FracPt[i] = candidate->FracPt[i];
    }
    //    entry->t0 = candidate->t0;
    //    entry->t1 = candidate->t1;
    //    entry->t10 = candidate->t10;
    //    entry->t20 = candidate->t20;
    //    entry->t30 = candidate->t30;
    //    entry->t40 = candidate->t40;
    //    entry->nTimes = candidate->nTimes;

    entry->AreaX = candidate->Area.X();
    entry->AreaY = candidate->Area.Y();
    entry->AreaZ = candidate->Area.Z();
    entry->AreaT = candidate->Area.T();


    itConstituents.Reset();
    entry->Constituents.Clear();
    ecalEnergy = 0.0;
    hcalEnergy = 0.0;
    while((constituent = static_cast<Candidate*>(itConstituents.Next())))
    {
      //      cout << "Adding constituent with dr=" << entry->P4().DeltaR(constituent->Momentum) << endl;
      entry->Constituents.Add(constituent);
      ecalEnergy += constituent->Eem;
      hcalEnergy += constituent->Ehad;
    }

    entry->EhadOverEem = ecalEnergy > 0.0 ? hcalEnergy/ecalEnergy : 999.9;

    FillParticles(candidate, &entry->Particles);
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessMissingET(ExRootTreeBranch *branch, TObjArray *array)
{
  Candidate *candidate = 0;
  MissingET *entry = 0;

  // get the first entry
  if((candidate = static_cast<Candidate*>(array->At(0))))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    entry = static_cast<MissingET*>(branch->NewEntry());

    entry->Phi = (-momentum).Phi();
    entry->MET = momentum.Pt();
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessScalarHT(ExRootTreeBranch *branch, TObjArray *array)
{
  Candidate *candidate = 0;
  ScalarHT *entry = 0;

  // get the first entry
  if((candidate = static_cast<Candidate*>(array->At(0))))
  {
    const TLorentzVector &momentum = candidate->Momentum;

    entry = static_cast<ScalarHT*>(branch->NewEntry());

    entry->HT = momentum.Pt();
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessClusters(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Cluster *entry = 0;
  Double_t x, y, z, xError, yError, zError, sigma, sumPT2, btvSumPT2, genDeltaZ, genSumPT2;
           /*ptFromVBFFromCluster,
           ptFromVBFNotFromCluster,
           ptFromPUFromCluster,
           ptFromPUNotFromCluster,
           truePTFromVBFFromCluster,
           truePTFromVBFNotFromCluster,
           truePTFromPUFromCluster,
           truePTFromPUNotFromCluster,
           recoPTFromVBFFromCluster,
           recoPTFromVBFNotFromCluster,
           recoPTFromPUFromCluster,
           recoPTFromPUNotFromCluster,
           recoTruePTFromVBFFromCluster,
           recoTruePTFromVBFNotFromCluster,
           recoTruePTFromPUFromCluster,
           recoTruePTFromPUNotFromCluster,
           originalPTFromVBFFromCluster,
           originalPTFromVBFNotFromCluster,
           originalPTFromPUFromCluster,
           originalPTFromPUNotFromCluster,
           originalRecoPTFromVBFFromCluster,
           originalRecoPTFromVBFNotFromCluster,
           originalRecoPTFromPUFromCluster,
           originalRecoPTFromPUNotFromCluster,
           vfPTFromVBFFromCluster,
           vfPTFromVBFNotFromCluster,
           vfPTFromPUFromCluster,
           vfPTFromPUNotFromCluster,
           vfTruePTFromVBFFromCluster,
           vfTruePTFromVBFNotFromCluster,
           vfTruePTFromPUFromCluster,
           vfTruePTFromPUNotFromCluster,
           recoVFPTFromVBFFromCluster,
           recoVFPTFromVBFNotFromCluster,
           recoVFPTFromPUFromCluster,
           recoVFPTFromPUNotFromCluster,
           recoVFTruePTFromVBFFromCluster,
           recoVFTruePTFromVBFNotFromCluster,
           recoVFTruePTFromPUFromCluster,
           recoVFTruePTFromPUNotFromCluster,
           originalVFPTFromVBFFromCluster,
           originalVFPTFromVBFNotFromCluster,
           originalVFPTFromPUFromCluster,
           originalVFPTFromPUNotFromCluster,
           originalRecoVFPTFromVBFFromCluster,
           originalRecoVFPTFromVBFNotFromCluster,
           originalRecoVFPTFromPUFromCluster,
           originalRecoVFPTFromPUNotFromCluster;*/
  UInt_t index, ndf;
         /*tracksFromVBFFromCluster,
         tracksFromVBFNotFromCluster,
         tracksFromPUFromCluster,
         tracksFromPUNotFromCluster,
         recoTracksFromVBFFromCluster,
         recoTracksFromVBFNotFromCluster,
         recoTracksFromPUFromCluster,
         recoTracksFromPUNotFromCluster,
         originalTracksFromVBFFromCluster,
         originalTracksFromVBFNotFromCluster,
         originalTracksFromPUFromCluster,
         originalTracksFromPUNotFromCluster,
         originalRecoTracksFromVBFFromCluster,
         originalRecoTracksFromVBFNotFromCluster,
         originalRecoTracksFromPUFromCluster,
         originalRecoTracksFromPUNotFromCluster,
         vfTracksFromVBFFromCluster,
         vfTracksFromVBFNotFromCluster,
         vfTracksFromPUFromCluster,
         vfTracksFromPUNotFromCluster,
         recoVFTracksFromVBFFromCluster,
         recoVFTracksFromVBFNotFromCluster,
         recoVFTracksFromPUFromCluster,
         recoVFTracksFromPUNotFromCluster,
         originalVFTracksFromVBFFromCluster,
         originalVFTracksFromVBFNotFromCluster,
         originalVFTracksFromPUFromCluster,
         originalVFTracksFromPUNotFromCluster,
         originalRecoVFTracksFromVBFFromCluster,
         originalRecoVFTracksFromVBFNotFromCluster,
         originalRecoVFTracksFromPUFromCluster,
         originalRecoVFTracksFromPUNotFromCluster;*/

  // loop over all clusters
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
  {
    index = candidate->ClusterIndex;
    ndf = candidate->ClusterNDF;
    sigma = candidate->ClusterSigma;
    sumPT2 = candidate->SumPT2;
    btvSumPT2 = candidate->BTVSumPT2;
    genDeltaZ = candidate->GenDeltaZ;
    genSumPT2 = candidate->GenSumPT2;

    /*ptFromVBFFromCluster = candidate->PTFromVBFFromCluster;
    ptFromVBFNotFromCluster = candidate->PTFromVBFNotFromCluster;
    ptFromPUFromCluster = candidate->PTFromPUFromCluster;
    ptFromPUNotFromCluster = candidate->PTFromPUNotFromCluster;

    truePTFromVBFFromCluster = candidate->TruePTFromVBFFromCluster;
    truePTFromVBFNotFromCluster = candidate->TruePTFromVBFNotFromCluster;
    truePTFromPUFromCluster = candidate->TruePTFromPUFromCluster;
    truePTFromPUNotFromCluster = candidate->TruePTFromPUNotFromCluster;

    recoPTFromVBFFromCluster = candidate->RecoPTFromVBFFromCluster;
    recoPTFromVBFNotFromCluster = candidate->RecoPTFromVBFNotFromCluster;
    recoPTFromPUFromCluster = candidate->RecoPTFromPUFromCluster;
    recoPTFromPUNotFromCluster = candidate->RecoPTFromPUNotFromCluster;

    recoTruePTFromVBFFromCluster = candidate->RecoTruePTFromVBFFromCluster;
    recoTruePTFromVBFNotFromCluster = candidate->RecoTruePTFromVBFNotFromCluster;
    recoTruePTFromPUFromCluster = candidate->RecoTruePTFromPUFromCluster;
    recoTruePTFromPUNotFromCluster = candidate->RecoTruePTFromPUNotFromCluster;

    tracksFromVBFFromCluster = candidate->TracksFromVBFFromCluster;
    tracksFromVBFNotFromCluster = candidate->TracksFromVBFNotFromCluster;
    tracksFromPUFromCluster = candidate->TracksFromPUFromCluster;
    tracksFromPUNotFromCluster = candidate->TracksFromPUNotFromCluster;

    recoTracksFromVBFFromCluster = candidate->RecoTracksFromVBFFromCluster;
    recoTracksFromVBFNotFromCluster = candidate->RecoTracksFromVBFNotFromCluster;
    recoTracksFromPUFromCluster = candidate->RecoTracksFromPUFromCluster;
    recoTracksFromPUNotFromCluster = candidate->RecoTracksFromPUNotFromCluster;

    originalPTFromVBFFromCluster = candidate->OriginalPTFromVBFFromCluster;
    originalPTFromVBFNotFromCluster = candidate->OriginalPTFromVBFNotFromCluster;
    originalPTFromPUFromCluster = candidate->OriginalPTFromPUFromCluster;
    originalPTFromPUNotFromCluster = candidate->OriginalPTFromPUNotFromCluster;

    originalRecoPTFromVBFFromCluster = candidate->OriginalRecoPTFromVBFFromCluster;
    originalRecoPTFromVBFNotFromCluster = candidate->OriginalRecoPTFromVBFNotFromCluster;
    originalRecoPTFromPUFromCluster = candidate->OriginalRecoPTFromPUFromCluster;
    originalRecoPTFromPUNotFromCluster = candidate->OriginalRecoPTFromPUNotFromCluster;

    originalTracksFromVBFFromCluster = candidate->OriginalTracksFromVBFFromCluster;
    originalTracksFromVBFNotFromCluster = candidate->OriginalTracksFromVBFNotFromCluster;
    originalTracksFromPUFromCluster = candidate->OriginalTracksFromPUFromCluster;
    originalTracksFromPUNotFromCluster = candidate->OriginalTracksFromPUNotFromCluster;

    originalRecoTracksFromVBFFromCluster = candidate->OriginalRecoTracksFromVBFFromCluster;
    originalRecoTracksFromVBFNotFromCluster = candidate->OriginalRecoTracksFromVBFNotFromCluster;
    originalRecoTracksFromPUFromCluster = candidate->OriginalRecoTracksFromPUFromCluster;
    originalRecoTracksFromPUNotFromCluster = candidate->OriginalRecoTracksFromPUNotFromCluster;

    vfPTFromVBFFromCluster = candidate->VFPTFromVBFFromCluster;
    vfPTFromVBFNotFromCluster = candidate->VFPTFromVBFNotFromCluster;
    vfPTFromPUFromCluster = candidate->VFPTFromPUFromCluster;
    vfPTFromPUNotFromCluster = candidate->VFPTFromPUNotFromCluster;

    vfTruePTFromVBFFromCluster = candidate->VFTruePTFromVBFFromCluster;
    vfTruePTFromVBFNotFromCluster = candidate->VFTruePTFromVBFNotFromCluster;
    vfTruePTFromPUFromCluster = candidate->VFTruePTFromPUFromCluster;
    vfTruePTFromPUNotFromCluster = candidate->VFTruePTFromPUNotFromCluster;

    recoVFPTFromVBFFromCluster = candidate->RecoVFPTFromVBFFromCluster;
    recoVFPTFromVBFNotFromCluster = candidate->RecoVFPTFromVBFNotFromCluster;
    recoVFPTFromPUFromCluster = candidate->RecoVFPTFromPUFromCluster;
    recoVFPTFromPUNotFromCluster = candidate->RecoVFPTFromPUNotFromCluster;

    recoVFTruePTFromVBFFromCluster = candidate->RecoVFTruePTFromVBFFromCluster;
    recoVFTruePTFromVBFNotFromCluster = candidate->RecoVFTruePTFromVBFNotFromCluster;
    recoVFTruePTFromPUFromCluster = candidate->RecoVFTruePTFromPUFromCluster;
    recoVFTruePTFromPUNotFromCluster = candidate->RecoVFTruePTFromPUNotFromCluster;

    vfTracksFromVBFFromCluster = candidate->VFTracksFromVBFFromCluster;
    vfTracksFromVBFNotFromCluster = candidate->VFTracksFromVBFNotFromCluster;
    vfTracksFromPUFromCluster = candidate->VFTracksFromPUFromCluster;
    vfTracksFromPUNotFromCluster = candidate->VFTracksFromPUNotFromCluster;

    recoVFTracksFromVBFFromCluster = candidate->RecoVFTracksFromVBFFromCluster;
    recoVFTracksFromVBFNotFromCluster = candidate->RecoVFTracksFromVBFNotFromCluster;
    recoVFTracksFromPUFromCluster = candidate->RecoVFTracksFromPUFromCluster;
    recoVFTracksFromPUNotFromCluster = candidate->RecoVFTracksFromPUNotFromCluster;

    originalVFPTFromVBFFromCluster = candidate->OriginalVFPTFromVBFFromCluster;
    originalVFPTFromVBFNotFromCluster = candidate->OriginalVFPTFromVBFNotFromCluster;
    originalVFPTFromPUFromCluster = candidate->OriginalVFPTFromPUFromCluster;
    originalVFPTFromPUNotFromCluster = candidate->OriginalVFPTFromPUNotFromCluster;

    originalRecoVFPTFromVBFFromCluster = candidate->OriginalRecoVFPTFromVBFFromCluster;
    originalRecoVFPTFromVBFNotFromCluster = candidate->OriginalRecoVFPTFromVBFNotFromCluster;
    originalRecoVFPTFromPUFromCluster = candidate->OriginalRecoVFPTFromPUFromCluster;
    originalRecoVFPTFromPUNotFromCluster = candidate->OriginalRecoVFPTFromPUNotFromCluster;

    originalVFTracksFromVBFFromCluster = candidate->OriginalVFTracksFromVBFFromCluster;
    originalVFTracksFromVBFNotFromCluster = candidate->OriginalVFTracksFromVBFNotFromCluster;
    originalVFTracksFromPUFromCluster = candidate->OriginalVFTracksFromPUFromCluster;
    originalVFTracksFromPUNotFromCluster = candidate->OriginalVFTracksFromPUNotFromCluster;

    originalRecoVFTracksFromVBFFromCluster = candidate->OriginalRecoVFTracksFromVBFFromCluster;
    originalRecoVFTracksFromVBFNotFromCluster = candidate->OriginalRecoVFTracksFromVBFNotFromCluster;
    originalRecoVFTracksFromPUFromCluster = candidate->OriginalRecoVFTracksFromPUFromCluster;
    originalRecoVFTracksFromPUNotFromCluster = candidate->OriginalRecoVFTracksFromPUNotFromCluster;*/

    x = candidate->Position.X ();
    y = candidate->Position.Y ();
    z = candidate->Position.Z ();

    xError = candidate->PositionError.X ();
    yError = candidate->PositionError.Y ();
    zError = candidate->PositionError.Z ();

    entry = static_cast<Cluster*>(branch->NewEntry());

    entry->Index = index;
    entry->NDF = ndf;
    entry->Sigma = sigma;
    entry->SumPT2 = sumPT2;
    entry->BTVSumPT2 = btvSumPT2;
    entry->GenDeltaZ = genDeltaZ;
    entry->GenSumPT2 = genSumPT2;

    /*entry->PTFromVBFFromCluster = ptFromVBFFromCluster;
    entry->PTFromVBFNotFromCluster = ptFromVBFNotFromCluster;
    entry->PTFromPUFromCluster = ptFromPUFromCluster;
    entry->PTFromPUNotFromCluster = ptFromPUNotFromCluster;

    entry->TruePTFromVBFFromCluster = truePTFromVBFFromCluster;
    entry->TruePTFromVBFNotFromCluster = truePTFromVBFNotFromCluster;
    entry->TruePTFromPUFromCluster = truePTFromPUFromCluster;
    entry->TruePTFromPUNotFromCluster = truePTFromPUNotFromCluster;

    entry->RecoPTFromVBFFromCluster = recoPTFromVBFFromCluster;
    entry->RecoPTFromVBFNotFromCluster = recoPTFromVBFNotFromCluster;
    entry->RecoPTFromPUFromCluster = recoPTFromPUFromCluster;
    entry->RecoPTFromPUNotFromCluster = recoPTFromPUNotFromCluster;

    entry->RecoTruePTFromVBFFromCluster = recoTruePTFromVBFFromCluster;
    entry->RecoTruePTFromVBFNotFromCluster = recoTruePTFromVBFNotFromCluster;
    entry->RecoTruePTFromPUFromCluster = recoTruePTFromPUFromCluster;
    entry->RecoTruePTFromPUNotFromCluster = recoTruePTFromPUNotFromCluster;

    entry->TracksFromVBFFromCluster = tracksFromVBFFromCluster;
    entry->TracksFromVBFNotFromCluster = tracksFromVBFNotFromCluster;
    entry->TracksFromPUFromCluster = tracksFromPUFromCluster;
    entry->TracksFromPUNotFromCluster = tracksFromPUNotFromCluster;

    entry->RecoTracksFromVBFFromCluster = recoTracksFromVBFFromCluster;
    entry->RecoTracksFromVBFNotFromCluster = recoTracksFromVBFNotFromCluster;
    entry->RecoTracksFromPUFromCluster = recoTracksFromPUFromCluster;
    entry->RecoTracksFromPUNotFromCluster = recoTracksFromPUNotFromCluster;

    entry->OriginalPTFromVBFFromCluster = originalPTFromVBFFromCluster;
    entry->OriginalPTFromVBFNotFromCluster = originalPTFromVBFNotFromCluster;
    entry->OriginalPTFromPUFromCluster = originalPTFromPUFromCluster;
    entry->OriginalPTFromPUNotFromCluster = originalPTFromPUNotFromCluster;

    entry->OriginalRecoPTFromVBFFromCluster = originalRecoPTFromVBFFromCluster;
    entry->OriginalRecoPTFromVBFNotFromCluster = originalRecoPTFromVBFNotFromCluster;
    entry->OriginalRecoPTFromPUFromCluster = originalRecoPTFromPUFromCluster;
    entry->OriginalRecoPTFromPUNotFromCluster = originalRecoPTFromPUNotFromCluster;

    entry->OriginalTracksFromVBFFromCluster = originalTracksFromVBFFromCluster;
    entry->OriginalTracksFromVBFNotFromCluster = originalTracksFromVBFNotFromCluster;
    entry->OriginalTracksFromPUFromCluster = originalTracksFromPUFromCluster;
    entry->OriginalTracksFromPUNotFromCluster = originalTracksFromPUNotFromCluster;

    entry->OriginalRecoTracksFromVBFFromCluster = originalRecoTracksFromVBFFromCluster;
    entry->OriginalRecoTracksFromVBFNotFromCluster = originalRecoTracksFromVBFNotFromCluster;
    entry->OriginalRecoTracksFromPUFromCluster = originalRecoTracksFromPUFromCluster;
    entry->OriginalRecoTracksFromPUNotFromCluster = originalRecoTracksFromPUNotFromCluster;

    entry->VFPTFromVBFFromCluster = vfPTFromVBFFromCluster;
    entry->VFPTFromVBFNotFromCluster = vfPTFromVBFNotFromCluster;
    entry->VFPTFromPUFromCluster = vfPTFromPUFromCluster;
    entry->VFPTFromPUNotFromCluster = vfPTFromPUNotFromCluster;

    entry->VFTruePTFromVBFFromCluster = vfTruePTFromVBFFromCluster;
    entry->VFTruePTFromVBFNotFromCluster = vfTruePTFromVBFNotFromCluster;
    entry->VFTruePTFromPUFromCluster = vfTruePTFromPUFromCluster;
    entry->VFTruePTFromPUNotFromCluster = vfTruePTFromPUNotFromCluster;

    entry->RecoVFPTFromVBFFromCluster = recoVFPTFromVBFFromCluster;
    entry->RecoVFPTFromVBFNotFromCluster = recoVFPTFromVBFNotFromCluster;
    entry->RecoVFPTFromPUFromCluster = recoVFPTFromPUFromCluster;
    entry->RecoVFPTFromPUNotFromCluster = recoVFPTFromPUNotFromCluster;

    entry->RecoVFTruePTFromVBFFromCluster = recoVFTruePTFromVBFFromCluster;
    entry->RecoVFTruePTFromVBFNotFromCluster = recoVFTruePTFromVBFNotFromCluster;
    entry->RecoVFTruePTFromPUFromCluster = recoVFTruePTFromPUFromCluster;
    entry->RecoVFTruePTFromPUNotFromCluster = recoVFTruePTFromPUNotFromCluster;

    entry->VFTracksFromVBFFromCluster = vfTracksFromVBFFromCluster;
    entry->VFTracksFromVBFNotFromCluster = vfTracksFromVBFNotFromCluster;
    entry->VFTracksFromPUFromCluster = vfTracksFromPUFromCluster;
    entry->VFTracksFromPUNotFromCluster = vfTracksFromPUNotFromCluster;

    entry->RecoVFTracksFromVBFFromCluster = recoVFTracksFromVBFFromCluster;
    entry->RecoVFTracksFromVBFNotFromCluster = recoVFTracksFromVBFNotFromCluster;
    entry->RecoVFTracksFromPUFromCluster = recoVFTracksFromPUFromCluster;
    entry->RecoVFTracksFromPUNotFromCluster = recoVFTracksFromPUNotFromCluster;

    entry->OriginalVFPTFromVBFFromCluster = originalVFPTFromVBFFromCluster;
    entry->OriginalVFPTFromVBFNotFromCluster = originalVFPTFromVBFNotFromCluster;
    entry->OriginalVFPTFromPUFromCluster = originalVFPTFromPUFromCluster;
    entry->OriginalVFPTFromPUNotFromCluster = originalVFPTFromPUNotFromCluster;

    entry->OriginalRecoVFPTFromVBFFromCluster = originalRecoVFPTFromVBFFromCluster;
    entry->OriginalRecoVFPTFromVBFNotFromCluster = originalRecoVFPTFromVBFNotFromCluster;
    entry->OriginalRecoVFPTFromPUFromCluster = originalRecoVFPTFromPUFromCluster;
    entry->OriginalRecoVFPTFromPUNotFromCluster = originalRecoVFPTFromPUNotFromCluster;

    entry->OriginalVFTracksFromVBFFromCluster = originalVFTracksFromVBFFromCluster;
    entry->OriginalVFTracksFromVBFNotFromCluster = originalVFTracksFromVBFNotFromCluster;
    entry->OriginalVFTracksFromPUFromCluster = originalVFTracksFromPUFromCluster;
    entry->OriginalVFTracksFromPUNotFromCluster = originalVFTracksFromPUNotFromCluster;

    entry->OriginalRecoVFTracksFromVBFFromCluster = originalRecoVFTracksFromVBFFromCluster;
    entry->OriginalRecoVFTracksFromVBFNotFromCluster = originalRecoVFTracksFromVBFNotFromCluster;
    entry->OriginalRecoVFTracksFromPUFromCluster = originalRecoVFTracksFromPUFromCluster;
    entry->OriginalRecoVFTracksFromPUNotFromCluster = originalRecoVFTracksFromPUNotFromCluster;*/

    entry->X = x;
    entry->Y = y;
    entry->Z = z;

    entry->ErrorX = xError;
    entry->ErrorY = yError;
    entry->ErrorZ = zError;
  }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessRho(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Rho *entry = 0;

  // loop over all rho
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
    {
      const TLorentzVector &momentum = candidate->Momentum;

      entry = static_cast<Rho*>(branch->NewEntry());

      entry->Rho = momentum.E();
      entry->Edges[0] = candidate->Edges[0];
      entry->Edges[1] = candidate->Edges[1];
    }
}

//------------------------------------------------------------------------------

void TreeWriter::ProcessEventInfo(ExRootTreeBranch *branch, TObjArray *array)
{
  TIter iterator(array);
  Candidate *candidate = 0;
  Event *entry = 0;

  // loop over all Event Info (there should just be one per event)
  iterator.Reset();
  while((candidate = static_cast<Candidate*>(iterator.Next())))
    {
      entry = static_cast<Event*>(branch->NewEntry());

      entry->RunNumber   = candidate->Run;
      entry->LumiNumber  = candidate->Lumi;
      entry->EventNumber = candidate->Evt;

    }
}

//------------------------------------------------------------------------------

void TreeWriter::Process()
{
  TBranchMap::iterator itBranchMap;
  ExRootTreeBranch *branch;
  TProcessMethod method;
  TObjArray *array;

  for(itBranchMap = fBranchMap.begin(); itBranchMap != fBranchMap.end(); ++itBranchMap)
  {
    branch = itBranchMap->first;
    method = itBranchMap->second.first;
    array = itBranchMap->second.second;

    (this->*method)(branch, array);
  }
}

//------------------------------------------------------------------------------
