#ifndef TrackSmearing_h
#define TrackSmearing_h

/** \class TrackSmearing
 *
 *  Performs transverse momentum resolution smearing.
 *
 *  $Date: 2013-02-12 14:57:44 +0100 (Tue, 12 Feb 2013) $
 *  $Revision: 905 $
 *
 *
 *  \author P. Demin - UCL, Louvain-la-Neuve
 *
 */

#include "classes/DelphesModule.h"

class TIterator;
class TObjArray;
class DelphesFormula;

class TrackSmearing: public DelphesModule
{
public:

  TrackSmearing();
  ~TrackSmearing();

  void Init();
  void Process();
  void Finish();

private:

  double ptError (const double, const double, const double, const double);

  DelphesFormula *fD0Formula; //!
  std::string fD0ResolutionFile;
  std::string fD0ResolutionHist;
  bool fUseD0Formula;

  DelphesFormula *fDZFormula; //!
  std::string fDZResolutionFile;
  std::string fDZResolutionHist;
  bool fUseDZFormula;

  DelphesFormula *fPFormula; //!
  std::string fPResolutionFile;
  std::string fPResolutionHist;
  bool fUsePFormula;

  DelphesFormula *fCtgThetaFormula; //!
  std::string fCtgThetaResolutionFile;
  std::string fCtgThetaResolutionHist;
  bool fUseCtgThetaFormula;

  DelphesFormula *fPhiFormula; //!
  std::string fPhiResolutionFile;
  std::string fPhiResolutionHist;
  bool fUsePhiFormula;

  bool fApplyToPileUp;

  TIterator *fItInputArray; //!

  const TObjArray *fInputArray; //!
  const TObjArray *fBeamSpotInputArray; //!
  
  TObjArray *fOutputArray; //!

  ClassDef(TrackSmearing, 1)
};

#endif
