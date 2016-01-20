#ifndef Separator_h
#define Separator_h

/** \class Separator
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

class Separator: public DelphesModule
{
public:

  Separator();
  ~Separator();

  void Init();
  void Process();
  void Finish();

private:

  Int_t fPID;

  const TObjArray *fInputArray; //!
  TIterator *fItInputArray;
  
  TObjArray *fBottomOutputArray; //!
  TObjArray *fTopOutputArray; //!

  ClassDef(Separator, 1)
};

#endif
