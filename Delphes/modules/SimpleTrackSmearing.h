#ifndef SimpleTrackSmearing_h
#define SimpleTrackSmearing_h

/** \class SimpleTrackSmearing
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

class SimpleTrackSmearing: public DelphesModule
{
public:

  SimpleTrackSmearing();
  ~SimpleTrackSmearing();

  void Init();
  void Process();
  void Finish();

private:

  DelphesFormula *fD0Formula; //!
  std::string fD0ResolutionFile;
  std::string fD0ResolutionHist;
  bool fUseD0Formula;

  DelphesFormula *fDZFormula; //!
  std::string fDZResolutionFile;
  std::string fDZResolutionHist;
  bool fUseDZFormula;

  DelphesFormula *fPTFormula; //!
  std::string fPTResolutionFile;
  std::string fPTResolutionHist;
  bool fUsePTFormula;

  bool fApplyToPileUp;

  TIterator *fItInputArray; //!

  const TObjArray *fInputArray; //!
  const TObjArray *fBeamSpotInputArray; //!
  
  TObjArray *fOutputArray; //!

  ClassDef(SimpleTrackSmearing, 1)
};

#endif
