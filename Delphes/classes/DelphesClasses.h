#ifndef DelphesClasses_h
#define DelphesClasses_h

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

// Dependencies (#includes)

#include "TRef.h"
#include "TObject.h"
#include "TRefArray.h"
#include "TLorentzVector.h"

#include <vector>

#include "classes/SortableObject.h"

#include "Math/SVector.h"
#include "Math/SMatrix.h"
#include "Math/BinaryOperators.h"
#include "Math/Vector3D.h"
#include "Math/Point3D.h"

#define TrackReco_Vector_h
#define TrackReco_Error_h
#define Math_Vector3D_h
#define Math_Point3D_h

namespace math
{
  template<unsigned int N>
  struct VectorD {
    typedef ROOT::Math::SVector<double, N> type;
  };

  template<unsigned int N>
  struct VectorF {
    typedef ROOT::Math::SVector<float, N> type;
  };

  template<unsigned int N>
  struct Vector {
    typedef typename VectorD<N>::type type;
  };

  template<unsigned int N>
  struct ErrorD {
    typedef ROOT::Math::SMatrix<double, N, N, ROOT::Math::MatRepSym<double, N> > type;
  };

  template<unsigned int N>
  struct ErrorF {
    typedef ROOT::Math::SMatrix<float, N, N, ROOT::Math::MatRepSym<float, N> > type;
  };

  template<unsigned int N>
  struct Error {
    typedef typename ErrorD<N>::type type;
  };

  typedef ROOT::Math::DisplacementVector3D<ROOT::Math::Cartesian3D<double> > XYZVectorD;

  typedef ROOT::Math::DisplacementVector3D<ROOT::Math::Cartesian3D<float> > XYZVectorF;

  typedef XYZVectorD XYZVector;

  typedef ROOT::Math::PositionVector3D<ROOT::Math::Cartesian3D<double> > XYZPointD;

  typedef ROOT::Math::PositionVector3D<ROOT::Math::Cartesian3D<float> > XYZPointF;

  typedef XYZPointD XYZPoint;
}

namespace reco
{
  typedef math::Vector<3>::type ParameterVector3;
  typedef math::Error<3>::type CovarianceMatrix3;
  typedef math::Vector<5>::type ParameterVector5;
  typedef math::Error<5>::type CovarianceMatrix5;
  typedef math::XYZVector Vector;
  typedef math::XYZPoint Point;
  enum {
      i_qoverp = 0,
      i_lambda,
      i_phi,
      i_dxy,
      i_dsz
  };
}

namespace fastjet {
  class PseudoJet;
}


class DelphesFactory;

//---------------------------------------------------------------------------

class Event: public TObject
{
public:

  Long64_t EventNumber; // event number
  Long64_t LumiNumber; // lumi number
  Long64_t RunNumber; // run number

  Float_t ReadTime;
  Float_t ProcTime;  

  ClassDef(Event, 1)
};

//---------------------------------------------------------------------------

class LHCOEvent: public Event
{
public:

  Int_t Trigger; // trigger word

  ClassDef(LHCOEvent, 1)
};

//---------------------------------------------------------------------------

class LHEFEvent: public Event
{
public:

  Int_t ProcessID; // subprocess code for the event | hepup.IDPRUP

  Float_t Weight; // weight for the event | hepup.XWGTUP
  Float_t ScalePDF; // scale in GeV used in the calculation of the PDFs in the event | hepup.SCALUP
  Float_t AlphaQED; // value of the QED coupling used in the event | hepup.AQEDUP
  Float_t AlphaQCD; // value of the QCD coupling used in the event | hepup.AQCDUP

  ClassDef(LHEFEvent, 2)
};

//---------------------------------------------------------------------------

class HepMCEvent: public Event
{
public:

  Int_t ProcessID; // unique signal process id | signal_process_id()
  Int_t MPI; // number of multi parton interactions | mpi () 

  Float_t Weight; // weight for the event

  Float_t Scale; // energy scale, see hep-ph/0109068 | event_scale()
  Float_t AlphaQED; // QED coupling, see hep-ph/0109068 | alphaQED()
  Float_t AlphaQCD; // QCD coupling, see hep-ph/0109068 | alphaQCD()

  Int_t ID1; // flavour code of first parton | pdf_info()->id1()
  Int_t ID2; // flavour code of second parton | pdf_info()->id2()     

  Float_t X1; // fraction of beam momentum carried by first parton ("beam side") | pdf_info()->x1()
  Float_t X2; // fraction of beam momentum carried by second parton ("target side") | pdf_info()->x2()

  Float_t ScalePDF; // Q-scale used in evaluation of PDF's (in GeV) | pdf_info()->scalePDF()

  Float_t PDF1; // PDF (id1, x1, Q) | pdf_info()->pdf1()
  Float_t PDF2; // PDF (id2, x2, Q) | pdf_info()->pdf2()

  ClassDef(HepMCEvent, 2)
};

//---------------------------------------------------------------------------

class GenParticle: public SortableObject
{
public:
  Int_t PID; // particle HEP ID number | hepevt.idhep[number]

  Int_t Status; // particle status | hepevt.isthep[number]
  Int_t IsPU; // 0 or 1 for particles from pile-up interactions
                  // Reflects decision ncoprorating z vertex resolution  
  
  Int_t M1; // particle 1st mother | hepevt.jmohep[number][0] - 1
  Int_t M2; // particle 2nd mother | hepevt.jmohep[number][1] - 1

  Int_t D1; // particle 1st daughter | hepevt.jdahep[number][0] - 1
  Int_t D2; // particle last daughter | hepevt.jdahep[number][1] - 1

  Int_t Charge; // particle charge

  Float_t Mass; // particle mass

  Float_t E; // particle energy | hepevt.phep[number][3]
  Float_t Px; // particle momentum vector (x component) | hepevt.phep[number][0]
  Float_t Py; // particle momentum vector (y component) | hepevt.phep[number][1]
  Float_t Pz; // particle momentum vector (z component) | hepevt.phep[number][2]

  Float_t PT; // particle transverse momentum
  Float_t Eta; // particle pseudorapidity
  Float_t Phi; // particle azimuthal angle

  Float_t Rapidity; // particle rapidity

  Float_t T; // particle vertex position (t component) | hepevt.vhep[number][3]
  Float_t X; // particle vertex position (x component) | hepevt.vhep[number][0]
  Float_t Y; // particle vertex position (y component) | hepevt.vhep[number][1]
  Float_t Z; // particle vertex position (z component) | hepevt.vhep[number][2]

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }
  
  TLorentzVector P4();

  ClassDef(GenParticle, 1)
};

//---------------------------------------------------------------------------

class MissingET: public TObject
{
public:
  Float_t MET; // mising transverse energy
  Float_t Phi; // mising energy azimuthal angle

  ClassDef(MissingET, 1)
};

//---------------------------------------------------------------------------

class ScalarHT: public TObject
{
public:
  Float_t HT; // scalar sum of transverse momenta

  ClassDef(ScalarHT, 1)
};

//---------------------------------------------------------------------------

class Cluster: public SortableObject
{
public:
  Int_t Index;
  Int_t NDF;
  Double_t Sigma;
  Double_t SumPT2;
  Double_t BTVSumPT2;
  Double_t GenDeltaZ;
  Double_t GenSumPT2;

/*  Int_t TracksFromVBFFromCluster;
  Int_t TracksFromVBFNotFromCluster;
  Int_t TracksFromPUFromCluster;
  Int_t TracksFromPUNotFromCluster;
  Double_t PTFromVBFFromCluster;
  Double_t PTFromVBFNotFromCluster;
  Double_t PTFromPUFromCluster;
  Double_t PTFromPUNotFromCluster;
  Double_t TruePTFromVBFFromCluster;
  Double_t TruePTFromVBFNotFromCluster;
  Double_t TruePTFromPUFromCluster;
  Double_t TruePTFromPUNotFromCluster;

  Int_t RecoTracksFromVBFFromCluster;
  Int_t RecoTracksFromVBFNotFromCluster;
  Int_t RecoTracksFromPUFromCluster;
  Int_t RecoTracksFromPUNotFromCluster;
  Double_t RecoPTFromVBFFromCluster;
  Double_t RecoPTFromVBFNotFromCluster;
  Double_t RecoPTFromPUFromCluster;
  Double_t RecoPTFromPUNotFromCluster;
  Double_t RecoTruePTFromVBFFromCluster;
  Double_t RecoTruePTFromVBFNotFromCluster;
  Double_t RecoTruePTFromPUFromCluster;
  Double_t RecoTruePTFromPUNotFromCluster;

  Int_t OriginalTracksFromVBFFromCluster;
  Int_t OriginalTracksFromVBFNotFromCluster;
  Int_t OriginalTracksFromPUFromCluster;
  Int_t OriginalTracksFromPUNotFromCluster;
  Double_t OriginalPTFromVBFFromCluster;
  Double_t OriginalPTFromVBFNotFromCluster;
  Double_t OriginalPTFromPUFromCluster;
  Double_t OriginalPTFromPUNotFromCluster;

  Int_t OriginalRecoTracksFromVBFFromCluster;
  Int_t OriginalRecoTracksFromVBFNotFromCluster;
  Int_t OriginalRecoTracksFromPUFromCluster;
  Int_t OriginalRecoTracksFromPUNotFromCluster;
  Double_t OriginalRecoPTFromVBFFromCluster;
  Double_t OriginalRecoPTFromVBFNotFromCluster;
  Double_t OriginalRecoPTFromPUFromCluster;
  Double_t OriginalRecoPTFromPUNotFromCluster;

  Int_t VFTracksFromVBFFromCluster;
  Int_t VFTracksFromVBFNotFromCluster;
  Int_t VFTracksFromPUFromCluster;
  Int_t VFTracksFromPUNotFromCluster;
  Double_t VFPTFromVBFFromCluster;
  Double_t VFPTFromVBFNotFromCluster;
  Double_t VFPTFromPUFromCluster;
  Double_t VFPTFromPUNotFromCluster;
  Double_t VFTruePTFromVBFFromCluster;
  Double_t VFTruePTFromVBFNotFromCluster;
  Double_t VFTruePTFromPUFromCluster;
  Double_t VFTruePTFromPUNotFromCluster;

  Int_t RecoVFTracksFromVBFFromCluster;
  Int_t RecoVFTracksFromVBFNotFromCluster;
  Int_t RecoVFTracksFromPUFromCluster;
  Int_t RecoVFTracksFromPUNotFromCluster;
  Double_t RecoVFPTFromVBFFromCluster;
  Double_t RecoVFPTFromVBFNotFromCluster;
  Double_t RecoVFPTFromPUFromCluster;
  Double_t RecoVFPTFromPUNotFromCluster;
  Double_t RecoVFTruePTFromVBFFromCluster;
  Double_t RecoVFTruePTFromVBFNotFromCluster;
  Double_t RecoVFTruePTFromPUFromCluster;
  Double_t RecoVFTruePTFromPUNotFromCluster;

  Int_t OriginalVFTracksFromVBFFromCluster;
  Int_t OriginalVFTracksFromVBFNotFromCluster;
  Int_t OriginalVFTracksFromPUFromCluster;
  Int_t OriginalVFTracksFromPUNotFromCluster;
  Double_t OriginalVFPTFromVBFFromCluster;
  Double_t OriginalVFPTFromVBFNotFromCluster;
  Double_t OriginalVFPTFromPUFromCluster;
  Double_t OriginalVFPTFromPUNotFromCluster;

  Int_t OriginalRecoVFTracksFromVBFFromCluster;
  Int_t OriginalRecoVFTracksFromVBFNotFromCluster;
  Int_t OriginalRecoVFTracksFromPUFromCluster;
  Int_t OriginalRecoVFTracksFromPUNotFromCluster;
  Double_t OriginalRecoVFPTFromVBFFromCluster;
  Double_t OriginalRecoVFPTFromVBFNotFromCluster;
  Double_t OriginalRecoVFPTFromPUFromCluster;
  Double_t OriginalRecoVFPTFromPUNotFromCluster;*/

  Double_t X;
  Double_t Y;
  Double_t Z;
  Double_t ErrorX;
  Double_t ErrorY;
  Double_t ErrorZ;

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  ClassDef(Cluster, 1)
};

//---------------------------------------------------------------------------

class Rho: public TObject
{
 public:
  Float_t Rho; // rho energy density
  Float_t Edges[2]; // pseudorapidity range edges
  
  ClassDef(Rho, 1)
    };

//---------------------------------------------------------------------------

class Weight: public TObject
{
public:
  Float_t Weight; // weight for the event

  ClassDef(Weight, 1)
};

//---------------------------------------------------------------------------

class Photon: public SortableObject
{
public:

  Float_t PT; // photon transverse momentum
  Float_t Eta; // photon pseudorapidity
  Float_t Phi; // photon azimuthal angle

  Float_t E; // photon energy
  
  Float_t EhadOverEem; // ratio of the hadronic versus electromagnetic energy deposited in the calorimeter
  Float_t IsolationVar; 

  Float_t TOuter; // time at calorimeter face

  TRefArray Particles; // references to generated particles

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(Photon, 3)
};

//---------------------------------------------------------------------------

class Electron: public SortableObject
{
public:

  Float_t PT; // electron transverse momentum
  Float_t Eta; // electron pseudorapidity
  Float_t Phi; // electron azimuthal angle

  Int_t Charge; // electron charge

  Float_t EhadOverEem; // ratio of the hadronic versus electromagnetic energy deposited in the calorimeter
  Float_t IsolationVar; // Sum of chHadEt, NeutralHadEt, and  GammaEt

  Float_t TOuter; // Time at calorimeter face

  TRef Particle; // reference to generated particle

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(Electron, 3)
};

//---------------------------------------------------------------------------

class Muon: public SortableObject
{
public:

  Float_t PT; // muon transverse momentum
  Float_t Eta; // muon pseudorapidity
  Float_t Phi; // muon azimuthal angle

  Int_t Charge; // muon charge
  Float_t IsolationVar; 

  TRef Particle; // reference to generated particle

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(Muon, 2)
};


//---------------------------------------------------------------------------

class IsoTrack: public SortableObject
{
public:

  Float_t PT; // IsoTrack transverse momentum
  Float_t Eta; // IsoTrack pseudorapidity
  Float_t Phi; // IsoTrack azimuthal angle

  Int_t Charge; // IsoTrack charge
  Float_t IsolationVar; 
  Int_t IsEMCand; // Whether it is a Electron/Muon candidate

  TRef Particle; // reference to generated particle

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(IsoTrack, 3)
};

//---------------------------------------------------------------------------

class Jet: public SortableObject
{
public:

  Float_t PT; // jet transverse momentum
  Float_t Eta; // jet pseudorapidity
  Float_t Phi; // jet azimuthal angle

  Float_t Mass; // jet invariant mass

  Float_t DeltaEta;  // jet radius in pseudorapidity
  Float_t DeltaPhi;  // jet radius in azimuthal angle

  UInt_t WTag;
  UInt_t TopTag;
  UInt_t HTag;

  Float_t Tau1;
  Float_t Tau2;
  Float_t Tau3;

  UInt_t NSubJets;
  Float_t MassDrop;
  Float_t TrimmedMass;

  Float_t Beta, BetaStar; // dZ;
  Float_t SumPtCh, SumPtChPV, SumPtChPU;
  Float_t MeanSqDeltaR, PTD;
  Int_t NCharged, NNeutrals;
  Float_t  FracPt[5]; // [0] <--> 0.0 < dR < 0.1,  [1] <--> 0.1 < dR < 0.2,  etc.

  // These are experimental and not currently planned to be used
  //  Float_t t0,t1,t10,t20,t30,t40; // Jet timing (at calorimeter) with ecal deposit (particle) level smearing by 0,1,10,20,30,40 ps
  //  Int_t nTimes;

  Float_t AreaX,AreaY,AreaZ,AreaT; // 4-vector area
  
  UInt_t BTag; // 0 or 1 for a jet that has been tagged as containing a heavy quark
  UInt_t TauTag; // 0 or 1 for a jet that has been tagged as a tau
  Double_t SSV;

  Int_t Charge; // tau charge

  Float_t EhadOverEem; // ratio of the hadronic versus electromagnetic energy deposited in the calorimeter

  TRefArray Constituents; // references to constituents
  TRefArray Particles; // references to generated particles

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();
  TLorentzVector AreaP4();

  ClassDef(Jet, 4)
};

//---------------------------------------------------------------------------

class Track: public SortableObject 
{
public:  
  Int_t PID; // HEP ID number

  Int_t Charge; // track charge

  Float_t D0; // track transverse momentum
  Float_t ErrorD0; // track transverse momentum error
  Float_t TrueD0; // track transverse momentum error

  Float_t DZ; // track transverse momentum
  Float_t ErrorDZ; // track transverse momentum error
  Float_t TrueDZ; // track transverse momentum error

  Float_t P; // track transverse momentum
  Float_t ErrorP; // track transverse momentum error
  Float_t TrueP; // track transverse momentum error

  Float_t PT; // track transverse momentum
  Float_t ErrorPT; // track transverse momentum error
  Float_t TruePT; // track transverse momentum error

  Float_t CtgTheta; // track transverse momentum
  Float_t ErrorCtgTheta; // track transverse momentum error
  Float_t TrueCtgTheta; // track transverse momentum error

  Float_t Phi; // track azimuthal angle
  Float_t ErrorPhi; // track azimuthal angle
  Float_t TruePhi; // track azimuthal angle

  Float_t Eta; // track pseudorapidity

  Float_t Chi2;
  Float_t NDF;

  Float_t EtaOuter; // track pseudorapidity at the tracker edge
  Float_t PhiOuter; // track azimuthal angle at the tracker edge

  Float_t X; // track vertex position (x component)
  Float_t Y; // track vertex position (y component)
  Float_t Z; // track vertex position (z component)

  Float_t XOuter; // track position (x component) at the tracker edge
  Float_t YOuter; // track position (y component) at the tracker edge
  Float_t ZOuter; // track position (z component) at the tracker edge

  Int_t IsRecoPU; // Assigned by charged hadron subtractor where applicable
                  // Reflects decision ncoprorating z vertex resolution
  Int_t ClusterIndex;
  Int_t IsPU;

  Float_t T; // track vertex time: I think this is cheating, but I guess no more than (X,Y,Z)
  Float_t TOuter; // track time at tracker edge

  TRef Particle; // reference to generated particle

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(Track, 2)
};

//---------------------------------------------------------------------------

class Tower: public SortableObject 
{
public:
  Float_t ET; // calorimeter tower transverse energy
  Float_t Eta; // calorimeter tower pseudorapidity
  Float_t Phi; // calorimeter tower azimuthal angle

  Float_t E; // calorimeter tower energy

  Float_t Eem; // calorimeter tower electromagnetic energy
  Float_t Ehad; // calorimeter tower hadronic energy

  Float_t Edges[4]; // calorimeter tower edges

  Float_t TOuter; // ecal deposit time, averaged by sqrt(EM energy) over all particles, not smeared
  Float_t nTimes;

  TRefArray Particles; // references to generated particles

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  TLorentzVector P4();

  ClassDef(Tower, 2)
};

//---------------------------------------------------------------------------

class Candidate: public SortableObject 
{
  friend class DelphesFactory;

public:
  Candidate();

  Int_t Run, Lumi, Evt;

  Int_t PID;

  Int_t Status;
  Int_t M1, M2, D1, D2;

  Int_t Charge;

  Float_t Mass;
  Float_t IsolationVar;
  Float_t TrackIsolationVar;

  
  Int_t IsPU;
  Int_t ClusterIndex;
  Int_t ClusterNDF;
  Double_t ClusterSigma;
  Double_t SumPT2;
  Double_t BTVSumPT2;
  Double_t GenDeltaZ;
  Double_t GenSumPT2;

/*  Int_t TracksFromVBFFromCluster;
  Int_t TracksFromVBFNotFromCluster;
  Int_t TracksFromPUFromCluster;
  Int_t TracksFromPUNotFromCluster;
  Double_t PTFromVBFFromCluster;
  Double_t PTFromVBFNotFromCluster;
  Double_t PTFromPUFromCluster;
  Double_t PTFromPUNotFromCluster;
  Double_t TruePTFromVBFFromCluster;
  Double_t TruePTFromVBFNotFromCluster;
  Double_t TruePTFromPUFromCluster;
  Double_t TruePTFromPUNotFromCluster;

  Int_t RecoTracksFromVBFFromCluster;
  Int_t RecoTracksFromVBFNotFromCluster;
  Int_t RecoTracksFromPUFromCluster;
  Int_t RecoTracksFromPUNotFromCluster;
  Double_t RecoPTFromVBFFromCluster;
  Double_t RecoPTFromVBFNotFromCluster;
  Double_t RecoPTFromPUFromCluster;
  Double_t RecoPTFromPUNotFromCluster;
  Double_t RecoTruePTFromVBFFromCluster;
  Double_t RecoTruePTFromVBFNotFromCluster;
  Double_t RecoTruePTFromPUFromCluster;
  Double_t RecoTruePTFromPUNotFromCluster;

  Int_t OriginalTracksFromVBFFromCluster;
  Int_t OriginalTracksFromVBFNotFromCluster;
  Int_t OriginalTracksFromPUFromCluster;
  Int_t OriginalTracksFromPUNotFromCluster;
  Double_t OriginalPTFromVBFFromCluster;
  Double_t OriginalPTFromVBFNotFromCluster;
  Double_t OriginalPTFromPUFromCluster;
  Double_t OriginalPTFromPUNotFromCluster;

  Int_t OriginalRecoTracksFromVBFFromCluster;
  Int_t OriginalRecoTracksFromVBFNotFromCluster;
  Int_t OriginalRecoTracksFromPUFromCluster;
  Int_t OriginalRecoTracksFromPUNotFromCluster;
  Double_t OriginalRecoPTFromVBFFromCluster;
  Double_t OriginalRecoPTFromVBFNotFromCluster;
  Double_t OriginalRecoPTFromPUFromCluster;
  Double_t OriginalRecoPTFromPUNotFromCluster;

  Int_t VFTracksFromVBFFromCluster;
  Int_t VFTracksFromVBFNotFromCluster;
  Int_t VFTracksFromPUFromCluster;
  Int_t VFTracksFromPUNotFromCluster;
  Double_t VFPTFromVBFFromCluster;
  Double_t VFPTFromVBFNotFromCluster;
  Double_t VFPTFromPUFromCluster;
  Double_t VFPTFromPUNotFromCluster;
  Double_t VFTruePTFromVBFFromCluster;
  Double_t VFTruePTFromVBFNotFromCluster;
  Double_t VFTruePTFromPUFromCluster;
  Double_t VFTruePTFromPUNotFromCluster;

  Int_t RecoVFTracksFromVBFFromCluster;
  Int_t RecoVFTracksFromVBFNotFromCluster;
  Int_t RecoVFTracksFromPUFromCluster;
  Int_t RecoVFTracksFromPUNotFromCluster;
  Double_t RecoVFPTFromVBFFromCluster;
  Double_t RecoVFPTFromVBFNotFromCluster;
  Double_t RecoVFPTFromPUFromCluster;
  Double_t RecoVFPTFromPUNotFromCluster;
  Double_t RecoVFTruePTFromVBFFromCluster;
  Double_t RecoVFTruePTFromVBFNotFromCluster;
  Double_t RecoVFTruePTFromPUFromCluster;
  Double_t RecoVFTruePTFromPUNotFromCluster;

  Int_t OriginalVFTracksFromVBFFromCluster;
  Int_t OriginalVFTracksFromVBFNotFromCluster;
  Int_t OriginalVFTracksFromPUFromCluster;
  Int_t OriginalVFTracksFromPUNotFromCluster;
  Double_t OriginalVFPTFromVBFFromCluster;
  Double_t OriginalVFPTFromVBFNotFromCluster;
  Double_t OriginalVFPTFromPUFromCluster;
  Double_t OriginalVFPTFromPUNotFromCluster;

  Int_t OriginalRecoVFTracksFromVBFFromCluster;
  Int_t OriginalRecoVFTracksFromVBFNotFromCluster;
  Int_t OriginalRecoVFTracksFromPUFromCluster;
  Int_t OriginalRecoVFTracksFromPUNotFromCluster;
  Double_t OriginalRecoVFPTFromVBFFromCluster;
  Double_t OriginalRecoVFPTFromVBFNotFromCluster;
  Double_t OriginalRecoVFPTFromPUFromCluster;
  Double_t OriginalRecoVFPTFromPUNotFromCluster;*/

  Int_t IsRecoPU; // Assigned by charged hadron subtractor where applicable
                  // Reflects decision ncoprorating z vertex resolution
  Int_t IsConstituent;
  Int_t IsEMCand; // Whether it is a Electron/Muon candidate
  
  UInt_t BTag;
  UInt_t TauTag;
  Double_t SSV;

  UInt_t WTag;
  UInt_t TopTag;
  UInt_t HTag;

  Float_t Tau1;
  Float_t Tau2;
  Float_t Tau3;

  UInt_t NSubJets;
  Float_t MassDrop;
  Float_t TrimmedMass;

  Float_t Eem;
  Float_t Ehad;

  Float_t Edges[4];
  Float_t DeltaEta;
  Float_t DeltaPhi;

  TLorentzVector Momentum, Position, PositionError, InitialPosition, Area;

  Double_t Chi2;
  Double_t NDF;

  Double_t D0;
  Double_t ErrorD0;
  Double_t TrueD0;

  Double_t DZ;
  Double_t ErrorDZ;
  Double_t TrueDZ;

  Double_t P;
  Double_t ErrorP;
  Double_t TrueP;

  Double_t PT;
  Double_t ErrorPT;
  Double_t TruePT;

  Double_t CtgTheta;
  Double_t ErrorCtgTheta;
  Double_t TrueCtgTheta;

  Double_t Phi;
  Double_t ErrorPhi;
  Double_t TruePhi;

  Float_t Beta, BetaStar;
  Float_t SumPtCh, SumPtChPV, SumPtChPU;
  Float_t MeanSqDeltaR, PTD;
  Int_t NCharged, NNeutrals;
  Float_t  FracPt[5]; // [0] <--> 0.0 < dR < 0.1,  [1] <--> 0.1 < dR < 0.2,  etc.
  //  Float_t t0,t1,t10,t20,t30,t40; // Jet timing (at calorimeter) with ecal deposit (particle) level smearing by 0,1,10,20,30,40 ps
  Int_t nTimes;

  std::vector<std::pair<float,float> > ecal_E_t; 

  static CompBase *fgCompare; //!
  const CompBase *GetCompare() const { return fgCompare; }

  void AddCandidate(Candidate *object);
  TObjArray *GetCandidates();

  Bool_t Overlaps(const Candidate *object) const;

  virtual void Copy(TObject &object) const;
  virtual TObject *Clone(const char *newname = "") const;
  virtual void Clear(Option_t* option = ""); 

private:
  DelphesFactory *fFactory; //!
  TObjArray *fArray; //!
  
  void SetFactory(DelphesFactory *factory) { fFactory = factory; }

  ClassDef(Candidate, 1)
};

#endif // DelphesClasses_h
