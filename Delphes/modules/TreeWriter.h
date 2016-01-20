#ifndef TreeWriter_h
#define TreeWriter_h

/** \class TreeWriter
 *
 *  Fills ROOT tree branches.
 *
 *  $Date: 2013-05-26 02:00:39 +0200 (Sun, 26 May 2013) $
 *  $Revision: 1123 $
 *
 *
 *  \author P. Demin - UCL, Louvain-la-Neuve
 *
 */

#include "classes/DelphesModule.h"

#include "classes/DelphesClasses.h"
#include "classes/DelphesFactory.h"
#include "classes/DelphesFormula.h"

#include "ExRootAnalysis/ExRootResult.h"
#include "ExRootAnalysis/ExRootFilter.h"
#include "ExRootAnalysis/ExRootClassifier.h"
#include "ExRootAnalysis/ExRootTreeBranch.h"

#include "TROOT.h"
#include "TMath.h"
#include "TString.h"
#include "TFormula.h"
#include "TRandom3.h"
#include "TObjArray.h"
#include "TDatabasePDG.h"
#include "TLorentzVector.h"

#include <algorithm>
#include <stdexcept>
#include <iostream>
#include <sstream>

#include <map>

using namespace std;

class TClass;
class TObjArray;
class TRefArray;

class Candidate;
class ExRootTreeBranch;

class TreeWriter: public DelphesModule
{
public:

  TreeWriter();
  ~TreeWriter();

  void Init();
  void Process();
  void Finish();

private:

  void FillParticles(Candidate *candidate, TRefArray *array);

  void ProcessParticles(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessTracks(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessTowers(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessPhotons(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessElectrons(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessMuons(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessTauJets(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessJets(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessMissingET(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessIsoTracks(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessScalarHT(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessClusters(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessRho(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessWeight(ExRootTreeBranch *branch, TObjArray *array);
  void ProcessEventInfo(ExRootTreeBranch *branch, TObjArray *array);

#ifndef __CINT__
  typedef void (TreeWriter::*TProcessMethod)(ExRootTreeBranch *, TObjArray *); //!

  typedef std::map< ExRootTreeBranch *, std::pair< TProcessMethod, TObjArray * > > TBranchMap; //!

  TBranchMap fBranchMap; //!

  int fOffsetFromModifyBeamSpot;

  std::map< TClass *, TProcessMethod > fClassMap; //!
#endif

  ClassDef(TreeWriter, 1)
};

#endif
