 
/** \class SimpleTrackSmearing
 *
 *  Performs transverse momentum resolution smearing.
 *
 *  $Date: 2013-02-13 16:58:53 +0100 (Wed, 13 Feb 2013) $
 *  $Revision: 911 $
 *
 *
 *  \author P. Demin - UCL, Louvain-la-Neuve
 *
 */

#include "modules/SimpleTrackSmearing.h"

#include "classes/DelphesClasses.h"
#include "classes/DelphesFactory.h"
#include "classes/DelphesFormula.h"

#include "ExRootAnalysis/ExRootResult.h"
#include "ExRootAnalysis/ExRootFilter.h"
#include "ExRootAnalysis/ExRootClassifier.h"

#include "TMath.h"
#include "TString.h"
#include "TFormula.h"
#include "TRandom3.h"
#include "TObjArray.h"
#include "TDatabasePDG.h"
#include "TLorentzVector.h"
#include "TFile.h"
#include "TProfile2D.h"

#include <algorithm> 
#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;

//------------------------------------------------------------------------------

SimpleTrackSmearing::SimpleTrackSmearing() :
  fD0Formula(0), fDZFormula(0), fPTFormula(0), fItInputArray(0)
{
  TFormula::SetMaxima (10000, 10000, 10000);
  fD0Formula = new DelphesFormula;
  fDZFormula = new DelphesFormula;
  fPTFormula = new DelphesFormula;
}

//------------------------------------------------------------------------------

SimpleTrackSmearing::~SimpleTrackSmearing()
{
  if(fD0Formula) delete fD0Formula;
  if(fDZFormula) delete fDZFormula;
  if(fPTFormula) delete fPTFormula;
}

//------------------------------------------------------------------------------

void SimpleTrackSmearing::Init()
{
  // read resolution formula

  if (string (GetString("D0ResolutionFormula", "0.0")) != "0.0")
    {
      fD0Formula->Compile(GetString("D0ResolutionFormula", "0.0"));
      fUseD0Formula = true;
    }
  else
    {
      fD0ResolutionFile = GetString("D0ResolutionFile", "errors.root");
      fD0ResolutionHist = GetString("D0ResolutionHist", "d0");
      fUseD0Formula = false;
    }
  if (string (GetString("DZResolutionFormula", "0.0")) != "0.0")
    {
      fDZFormula->Compile(GetString("DZResolutionFormula", "0.0"));
      fUseDZFormula = true;
    }
  else
    {
      fDZResolutionFile = GetString("DZResolutionFile", "errors.root");
      fDZResolutionHist = GetString("DZResolutionHist", "dz");
      fUseDZFormula = false;
    }
  if (string (GetString("PTResolutionFormula", "0.0")) != "0.0")
    {
      fPTFormula->Compile(GetString("PTResolutionFormula", "0.0"));
      fUsePTFormula = true;
    }
  else
    {
      fPTResolutionFile = GetString("PTResolutionFile", "errors.root");
      fPTResolutionHist = GetString("PTResolutionHist", "p");
      fUsePTFormula = false;
    }

  fApplyToPileUp = GetBool("ApplyToPileUp", true);

  // import input array

  fInputArray = ImportArray(GetString("InputArray", "ParticlePropagator/stableParticles"));
  fItInputArray = fInputArray->MakeIterator();
  fBeamSpotInputArray = ImportArray(GetString("BeamSpotInputArray", "GenBeamSpotFilter/beamSpotParticles"));

  // create output array

  fOutputArray = ExportArray(GetString("OutputArray", "stableParticles"));
}

//------------------------------------------------------------------------------

void SimpleTrackSmearing::Finish()
{
  if(fItInputArray) delete fItInputArray;
}

//------------------------------------------------------------------------------

void SimpleTrackSmearing::Process()
{
  Int_t iCandidate = 0;
  Candidate *candidate, *mother;
  Double_t eta, d0, d0Error, trueD0, dz, dzError, trueDZ, p, pError, trueP, pt, ptError, truePT, ctgTheta, ctgThetaError, trueCtgTheta, phi, phiError, truePhi;
  Double_t x, y, z, t, px, py, pz, theta;
  TProfile2D *d0ErrorHist = NULL,
             *dzErrorHist = NULL,
             *ptErrorHist = NULL;

  if (!fBeamSpotInputArray->GetSize () || !fBeamSpotInputArray->At (0))
    return;
  const Candidate &beamSpotCandidate = *((Candidate *) fBeamSpotInputArray->At (0));
  const TLorentzVector &bs = beamSpotCandidate.Position;

  if (!fUseD0Formula)
    {
      TFile *fin = TFile::Open (fD0ResolutionFile.c_str ());
      d0ErrorHist = (TProfile2D *) fin->Get (fD0ResolutionHist.c_str ());
      d0ErrorHist->SetDirectory (0);
      fin->Close ();
    }
  if (!fUseDZFormula)
    {
      TFile *fin = TFile::Open (fDZResolutionFile.c_str ());
      dzErrorHist = (TProfile2D *) fin->Get (fDZResolutionHist.c_str ());
      dzErrorHist->SetDirectory (0);
      fin->Close ();
    }
  if (!fUsePTFormula)
    {
      TFile *fin = TFile::Open (fPTResolutionFile.c_str ());
      ptErrorHist = (TProfile2D *) fin->Get (fPTResolutionHist.c_str ());
      ptErrorHist->SetDirectory (0);
      fin->Close ();
    }

  fItInputArray->Reset();
  while((candidate = static_cast<Candidate*>(fItInputArray->Next())))
  {
    const TLorentzVector &momentum = candidate->Momentum;
    const TLorentzVector &position = candidate->InitialPosition;
    eta = momentum.Eta();

    d0 = trueD0 = (position.X () * momentum.Py () - position.Y () * momentum.Px ()) / momentum.Pt ();
    dz = trueDZ = position.Z () - ((position.X () - bs.X ()) * momentum.Px () + (position.Y () - bs.Y ()) * momentum.Py ()) / momentum.Pt () * (momentum.Pz () / momentum.Pt ());
    p = trueP = momentum.P ();
    pt = truePT = momentum.Pt ();
    ctgTheta = trueCtgTheta = 1.0 / tan (momentum.Theta ());
    phi = truePhi = momentum.Phi ();

    if (fUseD0Formula)
      d0Error = fD0Formula->Eval(pt, eta);
    else
      {
        int xbin, ybin;

        xbin = pt < d0ErrorHist->GetXaxis ()->GetXmax () ? d0ErrorHist->GetXaxis ()->FindBin (pt)
             : d0ErrorHist->GetXaxis ()->GetBinCenter (d0ErrorHist->GetXaxis ()->GetNbins ());
        ybin = d0ErrorHist->GetYaxis ()->FindBin (fabs (eta));
        d0Error = d0ErrorHist->GetBinContent (xbin, ybin);
        if (!d0Error)
          d0Error = -1.0;
      }
    if (d0Error < 0.0)
      continue;

    if (fUseDZFormula)
      dzError = fDZFormula->Eval(pt, eta);
    else
      {
        int xbin, ybin;

        xbin = pt < dzErrorHist->GetXaxis ()->GetXmax () ? dzErrorHist->GetXaxis ()->FindBin (pt)
             : dzErrorHist->GetXaxis ()->GetBinCenter (dzErrorHist->GetXaxis ()->GetNbins ());
        ybin = dzErrorHist->GetYaxis ()->FindBin (fabs (eta));
        dzError = dzErrorHist->GetBinContent (xbin, ybin);
        if (!dzError)
          dzError = -1.0;
      }
    if (dzError < 0.0)
      continue;

    if (fUsePTFormula)
      ptError = fPTFormula->Eval(pt, eta) * pt;
    else
      {
        int xbin, ybin;

        xbin = pt < ptErrorHist->GetXaxis ()->GetXmax () ? ptErrorHist->GetXaxis ()->FindBin (pt)
             : ptErrorHist->GetXaxis ()->GetBinCenter (ptErrorHist->GetXaxis ()->GetNbins ());
        ybin = ptErrorHist->GetYaxis ()->FindBin (fabs (eta));
        ptError = ptErrorHist->GetBinContent (xbin, ybin) * pt;
        if (!ptError)
          ptError = -1.0;
      }
    if (ptError < 0.0)
      continue;

    if (fApplyToPileUp || !candidate->IsPU)
      {
        d0 = gRandom->Gaus(d0, d0Error);
        dz = gRandom->Gaus(dz, dzError);
        pt = gRandom->Gaus(pt, ptError);
      }

    if(pt < 0.0) continue;

    mother = candidate;
    candidate = static_cast<Candidate*>(candidate->Clone());
    candidate->D0 = d0;
    candidate->DZ = dz;
    candidate->PT = pt;

    candidate->Momentum.SetPtEtaPhiE (pt, eta, phi, pt * TMath::CosH (eta));

    x = position.X ();
    y = position.Y ();
    z = position.Z ();
    t = position.T ();
    px = candidate->Momentum.Px ();
    py = candidate->Momentum.Py ();
    pz = candidate->Momentum.Pz ();
    pt = candidate->Momentum.Pt ();
    candidate->InitialPosition.SetX (x + ((px * y - py * x + d0 * pt) / (py - px)));
    candidate->InitialPosition.SetY (y + ((px * y - py * x + d0 * pt) / (py - px)));
    x = candidate->InitialPosition.X ();
    y = candidate->InitialPosition.Y ();
    candidate->InitialPosition.SetZ (z + ((pz * (px * (x - bs.X ()) + py * (y - bs.Y ())) + pt * pt * (dz - z)) / (pt * pt)));
    candidate->InitialPosition.SetT (t);

    if (fApplyToPileUp || !candidate->IsPU)
      {
        candidate->ErrorD0 = d0Error;
        candidate->ErrorDZ = dzError;
        candidate->ErrorPT = ptError;
      }
    candidate->TrueD0 = trueD0;
    candidate->TrueDZ = trueDZ;
    candidate->TruePT = truePT;

    candidate->AddCandidate(mother);
    fOutputArray->Add(candidate);

    iCandidate++;
  }
}

//------------------------------------------------------------------------------
