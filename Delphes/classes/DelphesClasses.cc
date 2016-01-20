
/**
 *
 *  Definition of classes to be stored in the root tree.
 *  Function CompareXYZ sorts objects by the variable XYZ that MUST be
 *  present in the data members of the root tree class of the branch.
 *
 *  $Date: 2008-06-04 13:57:24 $
 *  $Revision: 1.1 $
 *
 *
 *  \author P. Demin - UCL, Louvain-la-Neuve
 *
 */

#include "classes/DelphesClasses.h"

#include "classes/DelphesFactory.h"
#include "classes/SortableObject.h"

CompBase *GenParticle::fgCompare = 0;
CompBase *Photon::fgCompare = CompPT<Photon>::Instance();
CompBase *Electron::fgCompare = CompPT<Electron>::Instance();
CompBase *Muon::fgCompare = CompPT<Muon>::Instance();
CompBase *IsoTrack::fgCompare = CompPT<IsoTrack>::Instance();
CompBase *Jet::fgCompare = CompPT<Jet>::Instance();
CompBase *Track::fgCompare = CompPT<Track>::Instance();
CompBase *Tower::fgCompare = CompE<Tower>::Instance();
//CompBase *Candidate::fgCompare = CompMomentumPt<Candidate>::Instance();
CompBase *Candidate::fgCompare = CompZ<Candidate>::Instance();
CompBase *Cluster::fgCompare = CompSumPT2<Cluster>::Instance();

//------------------------------------------------------------------------------

TLorentzVector GenParticle::P4()
{
  TLorentzVector vec;
  vec.SetPxPyPzE(Px, Py, Pz, E);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Photon::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, 0.0);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Electron::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, 0.0);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Muon::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, 0.0);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector IsoTrack::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, 0.0);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Jet::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, Mass);
  return vec;
}

TLorentzVector Jet::AreaP4()
{
  TLorentzVector vec(AreaX,AreaY,AreaZ,AreaT);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Track::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(PT, Eta, Phi, 0.0);
  return vec;
}

//------------------------------------------------------------------------------

TLorentzVector Tower::P4()
{
  TLorentzVector vec;
  vec.SetPtEtaPhiM(ET, Eta, Phi, 0.0);
  return vec;
}


//------------------------------------------------------------------------------

Candidate::Candidate() :
  Run(-1), Lumi(-1), Evt(-1),
  PID(0), Status(0), M1(-1), M2(-1), D1(-1), D2(-1),
  Charge(0), Mass(0.0),
  IsolationVar(0), TrackIsolationVar(0),
  IsPU(0), ClusterIndex(-1), ClusterNDF(0), ClusterSigma(0), SumPT2(0), BTVSumPT2(0), GenDeltaZ(0), GenSumPT2(0),
/*  TracksFromVBFFromCluster(0),
  TracksFromVBFNotFromCluster(0),
  TracksFromPUFromCluster(0),
  TracksFromPUNotFromCluster(0),
  PTFromVBFFromCluster(0),
  PTFromVBFNotFromCluster(0),
  PTFromPUFromCluster(0),
  PTFromPUNotFromCluster(0),
  TruePTFromVBFFromCluster(0),
  TruePTFromVBFNotFromCluster(0),
  TruePTFromPUFromCluster(0),
  TruePTFromPUNotFromCluster(0),
  RecoTracksFromVBFFromCluster(0),
  RecoTracksFromVBFNotFromCluster(0),
  RecoTracksFromPUFromCluster(0),
  RecoTracksFromPUNotFromCluster(0),
  RecoPTFromVBFFromCluster(0),
  RecoPTFromVBFNotFromCluster(0),
  RecoPTFromPUFromCluster(0),
  RecoPTFromPUNotFromCluster(0),
  RecoTruePTFromVBFFromCluster(0),
  RecoTruePTFromVBFNotFromCluster(0),
  RecoTruePTFromPUFromCluster(0),
  RecoTruePTFromPUNotFromCluster(0),
  OriginalTracksFromVBFFromCluster(0),
  OriginalTracksFromVBFNotFromCluster(0),
  OriginalTracksFromPUFromCluster(0),
  OriginalTracksFromPUNotFromCluster(0),
  OriginalPTFromVBFFromCluster(0),
  OriginalPTFromVBFNotFromCluster(0),
  OriginalPTFromPUFromCluster(0),
  OriginalPTFromPUNotFromCluster(0),
  OriginalRecoTracksFromVBFFromCluster(0),
  OriginalRecoTracksFromVBFNotFromCluster(0),
  OriginalRecoTracksFromPUFromCluster(0),
  OriginalRecoTracksFromPUNotFromCluster(0),
  OriginalRecoPTFromVBFFromCluster(0),
  OriginalRecoPTFromVBFNotFromCluster(0),
  OriginalRecoPTFromPUFromCluster(0),
  OriginalRecoPTFromPUNotFromCluster(0),
  VFTracksFromVBFFromCluster(0),
  VFTracksFromVBFNotFromCluster(0),
  VFTracksFromPUFromCluster(0),
  VFTracksFromPUNotFromCluster(0),
  VFPTFromVBFFromCluster(0),
  VFPTFromVBFNotFromCluster(0),
  VFPTFromPUFromCluster(0),
  VFPTFromPUNotFromCluster(0),
  VFTruePTFromVBFFromCluster(0),
  VFTruePTFromVBFNotFromCluster(0),
  VFTruePTFromPUFromCluster(0),
  VFTruePTFromPUNotFromCluster(0),
  RecoVFTracksFromVBFFromCluster(0),
  RecoVFTracksFromVBFNotFromCluster(0),
  RecoVFTracksFromPUFromCluster(0),
  RecoVFTracksFromPUNotFromCluster(0),
  RecoVFPTFromVBFFromCluster(0),
  RecoVFPTFromVBFNotFromCluster(0),
  RecoVFPTFromPUFromCluster(0),
  RecoVFPTFromPUNotFromCluster(0),
  RecoVFTruePTFromVBFFromCluster(0),
  RecoVFTruePTFromVBFNotFromCluster(0),
  RecoVFTruePTFromPUFromCluster(0),
  RecoVFTruePTFromPUNotFromCluster(0),
  OriginalVFTracksFromVBFFromCluster(0),
  OriginalVFTracksFromVBFNotFromCluster(0),
  OriginalVFTracksFromPUFromCluster(0),
  OriginalVFTracksFromPUNotFromCluster(0),
  OriginalVFPTFromVBFFromCluster(0),
  OriginalVFPTFromVBFNotFromCluster(0),
  OriginalVFPTFromPUFromCluster(0),
  OriginalVFPTFromPUNotFromCluster(0),
  OriginalRecoVFTracksFromVBFFromCluster(0),
  OriginalRecoVFTracksFromVBFNotFromCluster(0),
  OriginalRecoVFTracksFromPUFromCluster(0),
  OriginalRecoVFTracksFromPUNotFromCluster(0),
  OriginalRecoVFPTFromVBFFromCluster(0),
  OriginalRecoVFPTFromVBFNotFromCluster(0),
  OriginalRecoVFPTFromPUFromCluster(0),
  OriginalRecoVFPTFromPUNotFromCluster(0),*/
  IsRecoPU(0), IsConstituent(0), IsEMCand(0),
  BTag(0), TauTag(0), SSV(-999.0),
  WTag(0), TopTag(0), HTag(0),
  Tau1(-999), Tau2(-999), Tau3(-999),
  NSubJets(-999), MassDrop(-999), TrimmedMass(-999),
  Eem(0.0), Ehad(0.0),
  DeltaEta(0.0), DeltaPhi(0.0),
  Momentum(0.0, 0.0, 0.0, 0.0),
  Position(0.0, 0.0, 0.0, 0.0),
  PositionError(0.0, 0.0, 0.0, 0.0),
  InitialPosition(0.0, 0.0, 0.0, 0.0),
  Area(0.0, 0.0, 0.0, 0.0),
  Chi2(-999.0),
  NDF(-999.0),
  D0(0.0),
  ErrorD0(0.0),
  TrueD0(0.0),
  DZ(0.0),
  ErrorDZ(0.0),
  TrueDZ(0.0),
  P(0.0),
  ErrorP(0.0),
  TrueP(0.0),
  PT(0.0),
  ErrorPT(0.0),
  TruePT(0.0),
  CtgTheta(0.0),
  ErrorCtgTheta(0.0),
  TrueCtgTheta(0.0),
  Phi(0.0),
  ErrorPhi(0.0),
  TruePhi(0.0),
  Beta(-999.), BetaStar(-999.), 
  SumPtCh(0.0), SumPtChPV(0.0), SumPtChPU(0.0),
  MeanSqDeltaR(-999.), PTD(-999.),
  NCharged(-999), NNeutrals(-999),
  //  t0(-999999.),
  //  t1(-999999.),
  //  t10(-999999.),
  //  t20(-999999.),
  //  t30(-999999.),
  //  t40(-999999.),
  //  nTimes(-1),
  fFactory(0),
  fArray(0)
{
  Edges[0] = 0.0;
  Edges[1] = 0.0;
  Edges[2] = 0.0;
  Edges[3] = 0.0;
  for (int i = 0 ; i < 5 ; i++) {
    FracPt[i] = -999.;
  }
}

//------------------------------------------------------------------------------

void Candidate::AddCandidate(Candidate *object)
{
  if(!fArray) fArray = fFactory->NewArray();
  fArray->Add(object);
}

//------------------------------------------------------------------------------

TObjArray *Candidate::GetCandidates()
{
  if(!fArray) fArray = fFactory->NewArray();
  return fArray;
}

//------------------------------------------------------------------------------

Bool_t Candidate::Overlaps(const Candidate *object) const
{
  const Candidate *candidate;

  if(object->GetUniqueID() == GetUniqueID()) return kTRUE;

  if(fArray)
  {
    TIter it(fArray);
    while((candidate = static_cast<Candidate *>(it.Next())))
    {
      if(candidate->Overlaps(object)) return kTRUE;
    }
  }

  if(object->fArray)
  {
    TIter it(object->fArray);
    while((candidate = static_cast<Candidate *>(it.Next())))
    {
      if(candidate->Overlaps(this)) return kTRUE;
    }
  }

  return kFALSE;
}


//------------------------------------------------------------------------------

TObject *Candidate::Clone(const char *newname) const
{
  Candidate *object = fFactory->NewCandidate();
  Copy(*object);
  return object;
}

//------------------------------------------------------------------------------

void Candidate::Copy(TObject &obj) const
{
  Candidate &object = static_cast<Candidate &>(obj);
  Candidate *candidate;

  object.Run = Run;
  object.Lumi = Lumi;
  object.Evt = Evt;
  object.PID = PID;
  object.Status = Status;
  object.IsolationVar = IsolationVar;
  object.TrackIsolationVar = TrackIsolationVar;
  object.M1 = M1;
  object.M2 = M2;
  object.D1 = D1;
  object.D2 = D2;
  object.Charge = Charge;
  object.Mass = Mass;
  object.ClusterIndex = ClusterIndex;
  object.ClusterNDF = ClusterNDF;
  object.ClusterSigma = ClusterSigma;
  object.SumPT2 = SumPT2;
  object.BTVSumPT2 = BTVSumPT2;
  object.GenDeltaZ = GenDeltaZ;
  object.GenSumPT2 = GenSumPT2;
  object.IsPU = IsPU;
  /*object.TracksFromVBFFromCluster = TracksFromVBFFromCluster;
  object.TracksFromVBFNotFromCluster = TracksFromVBFNotFromCluster;
  object.TracksFromPUFromCluster = TracksFromPUFromCluster;
  object.TracksFromPUNotFromCluster = TracksFromPUNotFromCluster;
  object.PTFromVBFFromCluster = PTFromVBFFromCluster;
  object.PTFromVBFNotFromCluster = PTFromVBFNotFromCluster;
  object.PTFromPUFromCluster = PTFromPUFromCluster;
  object.PTFromPUNotFromCluster = PTFromPUNotFromCluster;
  object.TruePTFromVBFFromCluster = TruePTFromVBFFromCluster;
  object.TruePTFromVBFNotFromCluster = TruePTFromVBFNotFromCluster;
  object.TruePTFromPUFromCluster = TruePTFromPUFromCluster;
  object.TruePTFromPUNotFromCluster = TruePTFromPUNotFromCluster;
  object.RecoTracksFromVBFFromCluster = RecoTracksFromVBFFromCluster;
  object.RecoTracksFromVBFNotFromCluster = RecoTracksFromVBFNotFromCluster;
  object.RecoTracksFromPUFromCluster = RecoTracksFromPUFromCluster;
  object.RecoTracksFromPUNotFromCluster = RecoTracksFromPUNotFromCluster;
  object.RecoPTFromVBFFromCluster = RecoPTFromVBFFromCluster;
  object.RecoPTFromVBFNotFromCluster = RecoPTFromVBFNotFromCluster;
  object.RecoPTFromPUFromCluster = RecoPTFromPUFromCluster;
  object.RecoPTFromPUNotFromCluster = RecoPTFromPUNotFromCluster;
  object.RecoTruePTFromVBFFromCluster = RecoTruePTFromVBFFromCluster;
  object.RecoTruePTFromVBFNotFromCluster = RecoTruePTFromVBFNotFromCluster;
  object.RecoTruePTFromPUFromCluster = RecoTruePTFromPUFromCluster;
  object.RecoTruePTFromPUNotFromCluster = RecoTruePTFromPUNotFromCluster;
  object.OriginalTracksFromVBFFromCluster = OriginalTracksFromVBFFromCluster;
  object.OriginalTracksFromVBFNotFromCluster = OriginalTracksFromVBFNotFromCluster;
  object.OriginalTracksFromPUFromCluster = OriginalTracksFromPUFromCluster;
  object.OriginalTracksFromPUNotFromCluster = OriginalTracksFromPUNotFromCluster;
  object.OriginalPTFromVBFFromCluster = OriginalPTFromVBFFromCluster;
  object.OriginalPTFromVBFNotFromCluster = OriginalPTFromVBFNotFromCluster;
  object.OriginalPTFromPUFromCluster = OriginalPTFromPUFromCluster;
  object.OriginalPTFromPUNotFromCluster = OriginalPTFromPUNotFromCluster;
  object.OriginalRecoTracksFromVBFFromCluster = OriginalRecoTracksFromVBFFromCluster;
  object.OriginalRecoTracksFromVBFNotFromCluster = OriginalRecoTracksFromVBFNotFromCluster;
  object.OriginalRecoTracksFromPUFromCluster = OriginalRecoTracksFromPUFromCluster;
  object.OriginalRecoTracksFromPUNotFromCluster = OriginalRecoTracksFromPUNotFromCluster;
  object.OriginalRecoPTFromVBFFromCluster = OriginalRecoPTFromVBFFromCluster;
  object.OriginalRecoPTFromVBFNotFromCluster = OriginalRecoPTFromVBFNotFromCluster;
  object.OriginalRecoPTFromPUFromCluster = OriginalRecoPTFromPUFromCluster;
  object.OriginalRecoPTFromPUNotFromCluster = OriginalRecoPTFromPUNotFromCluster;
  object.VFTracksFromVBFFromCluster = VFTracksFromVBFFromCluster;
  object.VFTracksFromVBFNotFromCluster = VFTracksFromVBFNotFromCluster;
  object.VFTracksFromPUFromCluster = VFTracksFromPUFromCluster;
  object.VFTracksFromPUNotFromCluster = VFTracksFromPUNotFromCluster;
  object.VFPTFromVBFFromCluster = VFPTFromVBFFromCluster;
  object.VFPTFromVBFNotFromCluster = VFPTFromVBFNotFromCluster;
  object.VFPTFromPUFromCluster = VFPTFromPUFromCluster;
  object.VFPTFromPUNotFromCluster = VFPTFromPUNotFromCluster;
  object.VFTruePTFromVBFFromCluster = VFTruePTFromVBFFromCluster;
  object.VFTruePTFromVBFNotFromCluster = VFTruePTFromVBFNotFromCluster;
  object.VFTruePTFromPUFromCluster = VFTruePTFromPUFromCluster;
  object.VFTruePTFromPUNotFromCluster = VFTruePTFromPUNotFromCluster;
  object.RecoVFTracksFromVBFFromCluster = RecoVFTracksFromVBFFromCluster;
  object.RecoVFTracksFromVBFNotFromCluster = RecoVFTracksFromVBFNotFromCluster;
  object.RecoVFTracksFromPUFromCluster = RecoVFTracksFromPUFromCluster;
  object.RecoVFTracksFromPUNotFromCluster = RecoVFTracksFromPUNotFromCluster;
  object.RecoVFPTFromVBFFromCluster = RecoVFPTFromVBFFromCluster;
  object.RecoVFPTFromVBFNotFromCluster = RecoVFPTFromVBFNotFromCluster;
  object.RecoVFPTFromPUFromCluster = RecoVFPTFromPUFromCluster;
  object.RecoVFPTFromPUNotFromCluster = RecoVFPTFromPUNotFromCluster;
  object.RecoVFTruePTFromVBFFromCluster = RecoVFTruePTFromVBFFromCluster;
  object.RecoVFTruePTFromVBFNotFromCluster = RecoVFTruePTFromVBFNotFromCluster;
  object.RecoVFTruePTFromPUFromCluster = RecoVFTruePTFromPUFromCluster;
  object.RecoVFTruePTFromPUNotFromCluster = RecoVFTruePTFromPUNotFromCluster;
  object.OriginalVFTracksFromVBFFromCluster = OriginalVFTracksFromVBFFromCluster;
  object.OriginalVFTracksFromVBFNotFromCluster = OriginalVFTracksFromVBFNotFromCluster;
  object.OriginalVFTracksFromPUFromCluster = OriginalVFTracksFromPUFromCluster;
  object.OriginalVFTracksFromPUNotFromCluster = OriginalVFTracksFromPUNotFromCluster;
  object.OriginalVFPTFromVBFFromCluster = OriginalVFPTFromVBFFromCluster;
  object.OriginalVFPTFromVBFNotFromCluster = OriginalVFPTFromVBFNotFromCluster;
  object.OriginalVFPTFromPUFromCluster = OriginalVFPTFromPUFromCluster;
  object.OriginalVFPTFromPUNotFromCluster = OriginalVFPTFromPUNotFromCluster;
  object.OriginalRecoVFTracksFromVBFFromCluster = OriginalRecoVFTracksFromVBFFromCluster;
  object.OriginalRecoVFTracksFromVBFNotFromCluster = OriginalRecoVFTracksFromVBFNotFromCluster;
  object.OriginalRecoVFTracksFromPUFromCluster = OriginalRecoVFTracksFromPUFromCluster;
  object.OriginalRecoVFTracksFromPUNotFromCluster = OriginalRecoVFTracksFromPUNotFromCluster;
  object.OriginalRecoVFPTFromVBFFromCluster = OriginalRecoVFPTFromVBFFromCluster;
  object.OriginalRecoVFPTFromVBFNotFromCluster = OriginalRecoVFPTFromVBFNotFromCluster;
  object.OriginalRecoVFPTFromPUFromCluster = OriginalRecoVFPTFromPUFromCluster;
  object.OriginalRecoVFPTFromPUNotFromCluster = OriginalRecoVFPTFromPUNotFromCluster;*/
  object.IsRecoPU = IsRecoPU;
  object.IsEMCand = IsEMCand;
  object.IsConstituent = IsConstituent;
  object.BTag = BTag;
  object.TauTag = TauTag;
  object.SSV = SSV;
  object.WTag = WTag;
  object.TopTag = TopTag;
  object.HTag = HTag;
  object.Tau1=Tau1; 
  object.Tau2=Tau2; 
  object.Tau3=Tau3;
  object.NSubJets=NSubJets;
  object.MassDrop=MassDrop;
  object.TrimmedMass=TrimmedMass;
  object.Eem = Eem;
  object.Ehad = Ehad;
  object.Edges[0] = Edges[0];
  object.Edges[1] = Edges[1];
  object.Edges[2] = Edges[2];
  object.Edges[3] = Edges[3];
  object.DeltaEta = DeltaEta;
  object.DeltaPhi = DeltaPhi;
  object.Momentum = Momentum;
  object.Position = Position;
  object.PositionError = PositionError;
  object.InitialPosition = InitialPosition;
  object.D0 = D0;
  object.ErrorD0 = ErrorD0;
  object.TrueD0 = TrueD0;
  object.DZ = DZ;
  object.ErrorDZ = ErrorDZ;
  object.TrueDZ = TrueDZ;
  object.P = P;
  object.ErrorP = ErrorP;
  object.TrueP = TrueP;
  object.PT = PT;
  object.ErrorPT = ErrorPT;
  object.TruePT = TruePT;
  object.CtgTheta = CtgTheta;
  object.ErrorCtgTheta = ErrorCtgTheta;
  object.TrueCtgTheta = TrueCtgTheta;
  object.Phi = Phi;
  object.ErrorPhi = ErrorPhi;
  object.TruePhi = TruePhi;
  object.Area = Area;
  object.Chi2 = Chi2;
  object.NDF = NDF;
  object.Beta = Beta;
  object.BetaStar = BetaStar;
  object.SumPtCh = SumPtCh;
  object.SumPtChPV = SumPtChPV;
  object.SumPtChPU = SumPtChPU;
  object.MeanSqDeltaR = MeanSqDeltaR;
  object.PTD = PTD;
  object.NCharged = NCharged; 
  object.NNeutrals = NNeutrals;
  for (int i = 0 ; i < 5 ; i++) {
    object.FracPt[i] = FracPt[i];
  }

  // Copy jet timing info
  //  object.t0 = t0;
  //  object.t1 = t1;
  // object.t10 = t10;
  // object.t20 = t20;
  // object.t30 = t30;
  // object.t40 = t40;
  // object.nTimes = nTimes;

  // Copy cluster timing info
  copy(ecal_E_t.begin(),ecal_E_t.end(),back_inserter(object.ecal_E_t));

  object.fFactory = fFactory;
  object.fArray = 0;

  if(fArray && fArray->GetEntriesFast() > 0)
  {
    TIter itArray(fArray);
    TObjArray *array = object.GetCandidates();
    while((candidate = static_cast<Candidate *>(itArray.Next())))
    {
      array->Add(candidate);
    }
  }
}

//------------------------------------------------------------------------------

void Candidate::Clear(Option_t* option)
{
  SetUniqueID(0);
  ResetBit(kIsReferenced);
  Run = 0;
  Lumi = 0;
  Evt = 0;
  PID = 0;
  Status = 0;
  IsolationVar =0.;
  TrackIsolationVar =0.;
  M1 = -1; M2 = -1; D1 = -1; D2 = -1;
  Charge = 0;
  Mass = 0.0;
  ClusterIndex = -1;
  ClusterNDF = 0;
  ClusterSigma = 0;
  SumPT2 = 0;
  BTVSumPT2 = 0;
  GenDeltaZ = 0;
  GenSumPT2 = 0;
  IsPU = 0;
  /*TracksFromVBFFromCluster = 0;
  TracksFromVBFNotFromCluster = 0;
  TracksFromPUFromCluster = 0;
  TracksFromPUNotFromCluster = 0;
  PTFromVBFFromCluster = 0;
  PTFromVBFNotFromCluster = 0;
  PTFromPUFromCluster = 0;
  PTFromPUNotFromCluster = 0;
  TruePTFromVBFFromCluster = 0;
  TruePTFromVBFNotFromCluster = 0;
  TruePTFromPUFromCluster = 0;
  TruePTFromPUNotFromCluster = 0;
  RecoTracksFromVBFFromCluster = 0;
  RecoTracksFromVBFNotFromCluster = 0;
  RecoTracksFromPUFromCluster = 0;
  RecoTracksFromPUNotFromCluster = 0;
  RecoPTFromVBFFromCluster = 0;
  RecoPTFromVBFNotFromCluster = 0;
  RecoPTFromPUFromCluster = 0;
  RecoPTFromPUNotFromCluster = 0;
  RecoTruePTFromVBFFromCluster = 0;
  RecoTruePTFromVBFNotFromCluster = 0;
  RecoTruePTFromPUFromCluster = 0;
  RecoTruePTFromPUNotFromCluster = 0;
  OriginalTracksFromVBFFromCluster = 0;
  OriginalTracksFromVBFNotFromCluster = 0;
  OriginalTracksFromPUFromCluster = 0;
  OriginalTracksFromPUNotFromCluster = 0;
  OriginalPTFromVBFFromCluster = 0;
  OriginalPTFromVBFNotFromCluster = 0;
  OriginalPTFromPUFromCluster = 0;
  OriginalPTFromPUNotFromCluster = 0;
  OriginalRecoTracksFromVBFFromCluster = 0;
  OriginalRecoTracksFromVBFNotFromCluster = 0;
  OriginalRecoTracksFromPUFromCluster = 0;
  OriginalRecoTracksFromPUNotFromCluster = 0;
  OriginalRecoPTFromVBFFromCluster = 0;
  OriginalRecoPTFromVBFNotFromCluster = 0;
  OriginalRecoPTFromPUFromCluster = 0;
  OriginalRecoPTFromPUNotFromCluster = 0;
  VFTracksFromVBFFromCluster = 0;
  VFTracksFromVBFNotFromCluster = 0;
  VFTracksFromPUFromCluster = 0;
  VFTracksFromPUNotFromCluster = 0;
  VFPTFromVBFFromCluster = 0;
  VFPTFromVBFNotFromCluster = 0;
  VFPTFromPUFromCluster = 0;
  VFPTFromPUNotFromCluster = 0;
  VFTruePTFromVBFFromCluster = 0;
  VFTruePTFromVBFNotFromCluster = 0;
  VFTruePTFromPUFromCluster = 0;
  VFTruePTFromPUNotFromCluster = 0;
  RecoVFTracksFromVBFFromCluster = 0;
  RecoVFTracksFromVBFNotFromCluster = 0;
  RecoVFTracksFromPUFromCluster = 0;
  RecoVFTracksFromPUNotFromCluster = 0;
  RecoVFPTFromVBFFromCluster = 0;
  RecoVFPTFromVBFNotFromCluster = 0;
  RecoVFPTFromPUFromCluster = 0;
  RecoVFPTFromPUNotFromCluster = 0;
  RecoVFTruePTFromVBFFromCluster = 0;
  RecoVFTruePTFromVBFNotFromCluster = 0;
  RecoVFTruePTFromPUFromCluster = 0;
  RecoVFTruePTFromPUNotFromCluster = 0;
  OriginalVFTracksFromVBFFromCluster = 0;
  OriginalVFTracksFromVBFNotFromCluster = 0;
  OriginalVFTracksFromPUFromCluster = 0;
  OriginalVFTracksFromPUNotFromCluster = 0;
  OriginalVFPTFromVBFFromCluster = 0;
  OriginalVFPTFromVBFNotFromCluster = 0;
  OriginalVFPTFromPUFromCluster = 0;
  OriginalVFPTFromPUNotFromCluster = 0;
  OriginalRecoVFTracksFromVBFFromCluster = 0;
  OriginalRecoVFTracksFromVBFNotFromCluster = 0;
  OriginalRecoVFTracksFromPUFromCluster = 0;
  OriginalRecoVFTracksFromPUNotFromCluster = 0;
  OriginalRecoVFPTFromVBFFromCluster = 0;
  OriginalRecoVFPTFromVBFNotFromCluster = 0;
  OriginalRecoVFPTFromPUFromCluster = 0;
  OriginalRecoVFPTFromPUNotFromCluster = 0;*/
  IsRecoPU = 0;
  IsConstituent = 0;
  IsEMCand = 0;
  BTag = 0;
  TauTag = 0;
  SSV = -999.0;
  WTag = 0;
  TopTag = 0;
  HTag = 0;
  Tau1 = -999;
  Tau2 = -999;
  Tau3 = -999;
  NSubJets=-999;
  MassDrop = -999;
  TrimmedMass = -999;
  Eem = 0.0;
  Ehad = 0.0;
  Edges[0] = 0.0;
  Edges[1] = 0.0;
  Edges[2] = 0.0;
  Edges[3] = 0.0;
  DeltaEta = 0.0;
  DeltaPhi = 0.0;
  Momentum.SetXYZT(0.0, 0.0, 0.0, 0.0);
  Position.SetXYZT(0.0, 0.0, 0.0, 0.0);
  PositionError.SetXYZT(0.0, 0.0, 0.0, 0.0);
  InitialPosition.SetXYZT(0.0, 0.0, 0.0, 0.0);
  D0 = 0.0;
  ErrorD0 = 0.0;
  TrueD0 = 0.0;
  DZ = 0.0;
  ErrorDZ = 0.0;
  TrueDZ = 0.0;
  P = 0.0;
  ErrorP = 0.0;
  TrueP = 0.0;
  PT = 0.0;
  ErrorPT = 0.0;
  TruePT = 0.0;
  CtgTheta = 0.0;
  ErrorCtgTheta = 0.0;
  TrueCtgTheta = 0.0;
  Phi = 0.0;
  ErrorPhi = 0.0;
  TruePhi = 0.0;
  Area.SetXYZT(0.0, 0.0, 0.0, 0.0);
  Chi2 = -999.0;
  NDF = -999.0;
  Beta = -999.;
  BetaStar = -999.;
  SumPtCh = 0.0;
  SumPtChPV = 0.0;
  SumPtChPU = 0.0;
  MeanSqDeltaR = -999.;
  PTD = -999.;
  NCharged = -1;
  NNeutrals = -1;
  fArray = 0;

  ecal_E_t.clear();
}
