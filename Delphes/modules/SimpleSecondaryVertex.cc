/** \class SimpleSecondaryVertex
 *
 *  Merges particles from pile-up sample into event
 *
 *
 *  $Date: 2013-02-12 15:13:59 +0100 (Tue, 12 Feb 2013) $
 *  $Revision: 907 $
 *
 *
 *  \author M. Selvaggi - UCL, Louvain-la-Neuve
 *
 */

#include "modules/SimpleSecondaryVertex.h"

//#include "CLHEP/Units/GlobalSystemOfUnits.h"
//#include "CLHEP/Units/GlobalPhysicalConstants.h"

#include "classes/DelphesClasses.h"
#include "classes/DelphesFactory.h"
#include "classes/DelphesFormula.h"
#include "classes/DelphesPileUpReader.h"

#include "ExRootAnalysis/ExRootResult.h"
#include "ExRootAnalysis/ExRootFilter.h"
#include "ExRootAnalysis/ExRootClassifier.h"

#include "RecoBTag/SecondaryVertex/interface/SecondaryVertex.h"
#include "RecoVertex/VertexPrimitives/interface/TransientVertex.h"
#include "TrackingTools/TransientTrack/interface/TransientTrack.h"
#include "RecoVertex/AdaptiveVertexFinder/interface/AdaptiveVertexReconstructor.h"
//#include "MagneticField/ParametrizedEngine/plugins/OAEParametrizedMagneticField.h"
#include "MagneticField/UniformEngine/src/UniformMagneticField.h"
#include "DataFormats/Math/interface/deltaR.h"

#include "TMath.h"
#include "TString.h"
#include "TFormula.h"
#include "TRandom3.h"
#include "TObjArray.h"
#include "TDatabasePDG.h"
#include "TParticlePDG.h"
#include "TLorentzVector.h"
#include "TMatrixT.h"
#include "TVector3.h"

static const double mm  = 1.;
static const double m = 1000.*mm;
static const double ns  = 1.;
static const double s = 1.e+9 *ns;
static const double c_light   = 2.99792458e+8 * m/s;

//------------------------------------------------------------------------------

SimpleSecondaryVertex::SimpleSecondaryVertex() :
  fParameterR (0.0)
{
}

//------------------------------------------------------------------------------

SimpleSecondaryVertex::~SimpleSecondaryVertex()
{
}

//------------------------------------------------------------------------------

void SimpleSecondaryVertex::Init()
{
  fParameterR = GetDouble("ParameterR", 0.3);
  fMinTracks = GetInt("MinTracks", 2);

  fTrackInputArray = ImportArray(GetString("TrackInputArray", "MuonSeparator/tracks"));
  fItTrackInputArray = fTrackInputArray->MakeIterator();

  fBeamSpotInputArray = ImportArray(GetString("BeamSpotInputArray", "GenBeamSpotFilter/beamSpotParticles"));
  fClusterInputArray = ImportArray(GetString("ClusterInputArray", "VertexFinder/clusters"));

  fInputArray = ImportArray(GetString("InputArray", "JetPileUpSubtractor/jets"));
  fItInputArray = fInputArray->MakeIterator ();

  fOutputArray = ExportArray(GetString("OutputArray", "jets"));

  svFitIsValid = false;
}

//------------------------------------------------------------------------------

void SimpleSecondaryVertex::Finish()
{
  if(fItTrackInputArray) delete fItTrackInputArray;
  if(fItInputArray) delete fItInputArray;
}

//------------------------------------------------------------------------------

bool
SimpleSecondaryVertex::dist3dErrorAscending (const reco::SecondaryVertex * const a, const reco::SecondaryVertex * const b)
{
  return (a->dist3d ().error () < b->dist3d ().error ());
}

void SimpleSecondaryVertex::Process()
{
  AdaptiveVertexReconstructor *avr = new AdaptiveVertexReconstructor ();
  UniformMagneticField *magField = new UniformMagneticField (3.8);
  reco::Vertex *pv;
  vector<reco::TransientTrack> fitTracks;
  vector<TransientVertex> fittedSVs;
  vector<const reco::SecondaryVertex *> svs;
  Candidate *candidate;

  if (!fBeamSpotInputArray->GetSize () || !fBeamSpotInputArray->At (0))
    return;
  const Candidate &beamSpotCandidate = *((Candidate *) fBeamSpotInputArray->At (0));

  if (!fClusterInputArray->GetSize () || !fClusterInputArray->At (0))
    return;
  const Candidate &pvCandidate = *((Candidate *) fClusterInputArray->At (0));
  pv = new reco::Vertex (
        reco::Point (beamSpotCandidate.Position.X () / 10.0, beamSpotCandidate.Position.Y () / 10.0, pvCandidate.Position.Z () / 10.0), // p
        dummyCovarianceMatrix () // err
      );

  fItInputArray->Reset();
  while((candidate = static_cast<Candidate*>(fItInputArray->Next())))
    {
      fitTracks.clear ();
      fittedSVs.clear ();
      svs.clear ();

      Candidate *trackCandidate;

      fItTrackInputArray->Reset();
      while((trackCandidate = static_cast<Candidate*>(fItTrackInputArray->Next())))
        {
          double chi2, ndf;

          if (candidate->Momentum.DeltaR (trackCandidate->Momentum) > fParameterR
           || trackCandidate->Momentum.Pt () < 1.0)
            continue;

          chi2 = trackCandidate->Chi2 < 0.0 ? 24.86 : trackCandidate->Chi2;
          ndf = trackCandidate->NDF < 0.0 ? 22.91 : trackCandidate->NDF;
          reco::Track *track = new reco::Track (
            chi2, // chi2
            ndf, // ndof
            reco::Point (trackCandidate->InitialPosition.X () / 10.0, trackCandidate->InitialPosition.Y () / 10.0, trackCandidate->InitialPosition.Z () / 10.0), // referencePoint
            reco::Vector (trackCandidate->Momentum.Px (), trackCandidate->Momentum.Py (), trackCandidate->Momentum.Pz ()),
            trackCandidate->Charge, // charge
            covarianceMatrix (*trackCandidate) // cov
          );
          fitTracks.push_back (reco::TransientTrack (*track, magField));
        }

      try
        {
          fittedSVs = avr->vertices (fitTracks);
          svFitIsValid = true;
        }
      catch (...)
        {
          cout << "  WARNING: secondary vertex finding failed." << endl;
          svFitIsValid = false;
        }

      for (const auto &fittedSV : fittedSVs)
        {
          reco::SecondaryVertex *sv = new reco::SecondaryVertex (
            *pv, // pv
            fittedSV, // sv
            GlobalVector (candidate->Momentum.Px (), candidate->Momentum.Py (), candidate->Momentum.Pz ()), // direction
            false // withPVError
          );
          if (sv->dist2d ().value () > 2.5
           || reco::deltaR ((sv->position () - pv->position ()).eta (), (sv->position () - pv->position ()).phi (), candidate->Momentum.Eta (), candidate->Momentum.Phi ()) > 0.8
           || isK0Short (fittedSV)
           || sv->dist2d ().significance () < 3.0
           || sv->tracksSize () < 2
           || svMass (fittedSV) > 6.5
           || sv->dist2d ().value () < 0.01)
            continue;
          svs.push_back (sv);
        }
      sort (svs.begin (), svs.end (), dist3dErrorAscending);

      const reco::SecondaryVertex *bestSV = NULL;
      for (const auto &sv : svs)
        {
          if ((int) sv->tracksSize () >= fMinTracks)
            {
              bestSV = sv;
              break;
            }
        }
      if (!bestSV)
        continue;

      double value = bestSV->dist3d ().significance ();
      candidate->SSV = (value > 0) ? +std::log (1.0 + value)
                                   : -std::log (1.0 - value);
      fOutputArray->Add (candidate);
    }

  delete avr;
  delete magField;
  delete pv;
}

const reco::CovarianceMatrix5 &
SimpleSecondaryVertex::covarianceMatrix (const Candidate &candidate)
{
  reco::CovarianceMatrix5 *cov = new reco::CovarianceMatrix5 ();
  TMatrixT<double> *J = new TMatrixT<double> (5, 5),
                   *S = new TMatrixT<double> (5, 5),
                   *Sigma;
  double q = candidate.Charge,
         p = candidate.P,
         ctgTheta = candidate.CtgTheta,
         dz = candidate.DZ / 10.0;
  double pError = candidate.ErrorP,
         ctgThetaError = candidate.ErrorCtgTheta,
         phiError = candidate.ErrorPhi,
         d0Error = candidate.ErrorD0 / 10.0,
         dzError = candidate.ErrorDZ / 10.0;

  (*J) (0, 0) = -q / (p * p); (*J) (0, 1) = (*J) (0, 2) = (*J) (0, 3) = (*J) (0, 4) = 0.0;
  (*J) (1, 0) = 0.0; (*J) (1, 1) = 1.0 / (ctgTheta * ctgTheta + 1); (*J) (1, 2) = (*J) (1, 3) = (*J) (1, 4) = 0.0;
  (*J) (2, 0) = (*J) (2, 1) = 0.0; (*J) (2, 2) = 1.0; (*J) (2, 3) = (*J) (2, 4) = 0.0;
  (*J) (3, 0) = (*J) (3, 1) = (*J) (3, 2) = 0.0; (*J) (3, 3) = 1.0; (*J) (3, 4) = 0.0;
  (*J) (4, 0) = 0.0; (*J) (4, 1) = -(ctgTheta * dz) / pow (ctgTheta * ctgTheta + 1, 1.5); (*J) (4, 2) = (*J) (4, 3) = 0.0; (*J) (4, 4) = 1.0 / sqrt (ctgTheta * ctgTheta + 1);

  (*S) (0, 0) = pError * pError; (*S) (0, 1) = (*S) (0, 2) = (*S) (0, 3) = (*S) (0, 4) = 0.0;
  (*S) (1, 0) = 0.0; (*S) (1, 1) = ctgThetaError * ctgThetaError; (*S) (1, 2) = (*S) (1, 3) = (*S) (1, 4) = 0.0;
  (*S) (2, 0) = (*S) (2, 1) = 0.0; (*S) (2, 2) = phiError * phiError; (*S) (2, 3) = (*S) (2, 4) = 0.0;
  (*S) (3, 0) = (*S) (3, 1) = (*S) (3, 2) = 0.0; (*S) (3, 3) = d0Error * d0Error; (*S) (3, 4) = 0.0;
  (*S) (4, 0) = (*S) (4, 1) = (*S) (4, 2) = (*S) (4, 3) = 0.0; (*S) (4, 4) = dzError * dzError;

  Sigma = (TMatrixT<double> *) J->Clone ();
  (*Sigma) *= (*S);
  (*Sigma) *= J->Transpose (*J);

  for (unsigned i = 0; i < 5; i++)
    {
      for (unsigned j = 0; j < 5; j++)
        (*cov) (i, j) = (*Sigma) (i, j);
    }

  return *cov;
}

const reco::CovarianceMatrix3 &
SimpleSecondaryVertex::dummyCovarianceMatrix ()
{
  reco::CovarianceMatrix3 *cov = new reco::CovarianceMatrix3 ();

  for (unsigned i = 0; i < 3; i++)
    {
      for (unsigned j = 0; j < 3; j++)
        (*cov) (i, j) = i == j ? 1.0 : 0.0;
    }

  return *cov;
}

bool
SimpleSecondaryVertex::isK0Short (const TransientVertex &sv)
{
  if (sv.originalTracks ().size () != 2)
    return false;

  TParticlePDG pion (211), k0Short (310);
  int q = 0;
  TLorentzVector p (0.0, 0.0, 0.0, 0.0);
  for (const auto &track : sv.originalTracks ())
    {
      q += track.track ().charge ();
      TLorentzVector p0;
      p0.SetPx (track.track ().px ());
      p0.SetPy (track.track ().py ());
      p0.SetPz (track.track ().pz ());
      p0.SetE (sqrt (track.track ().p () * track.track ().p () + pion.Mass () * pion.Mass ()));
      p += p0;
    }

  return (q == 0 && fabs (p.M () - k0Short.Mass ()) < 0.05);
}

double
SimpleSecondaryVertex::svMass (const TransientVertex &sv)
{
  TParticlePDG pion (211);
  TLorentzVector p (0.0, 0.0, 0.0, 0.0);
  for (const auto &track : sv.originalTracks ())
    {
      TLorentzVector p0;
      p0.SetPx (track.track ().px ());
      p0.SetPy (track.track ().py ());
      p0.SetPz (track.track ().pz ());
      p0.SetE (sqrt (track.track ().p () * track.track ().p () + pion.Mass () * pion.Mass ()));
      p += p0;
    }

  return (p.M ());
}

//------------------------------------------------------------------------------
