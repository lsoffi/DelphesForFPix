#ifndef VertexInfo_h
#define VertexInfo_h

/** \class VertexInfo
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

#include "classes/DelphesModule.h"
#include <utility>
#include <algorithm>
#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;

class TObjArray;

class VertexInfo: public DelphesModule
{
public:

  VertexInfo();
  ~VertexInfo();

  void Init();
  void Process();
  void Finish();

private:

  Int_t fVerbose;

  TObjArray *fInputArray;
  TIterator *fItInputArray;

  TObjArray *fOriginalTrackInputArray;
  TIterator *fItOriginalTrackInputArray;

  TObjArray *fTrackInputArray;
  TIterator *fItTrackInputArray;

  TObjArray *fVBFquarkInputArray;

  TObjArray *fJetInputArray;
  TIterator *fItJetInputArray;

  TObjArray *fClusterOutputArray;

  ClassDef(VertexInfo, 1)
};

#endif
