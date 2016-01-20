#ifndef SimpleSecondaryVertex_h
#define SimpleSecondaryVertex_h

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

#include "classes/DelphesModule.h"
#include "classes/DelphesClasses.h"
#include <utility>
#include <algorithm>
#include <stdexcept>
#include <iostream>
#include <sstream>
#include <vector>

using namespace std;

class TObjArray;
class Candidate;
class TransientVertex;

namespace reco
{
  class SecondaryVertex;
}

class SimpleSecondaryVertex: public DelphesModule
{
public:

  SimpleSecondaryVertex();
  ~SimpleSecondaryVertex();

  void Init();
  void Process();
  void Finish();

  static bool dist3dErrorAscending (const reco::SecondaryVertex * const, const reco::SecondaryVertex * const);

private:

  const reco::CovarianceMatrix5 &covarianceMatrix (const Candidate &);
  const reco::CovarianceMatrix3 &dummyCovarianceMatrix ();
  bool isK0Short (const TransientVertex &);
  double svMass (const TransientVertex &);

  Double_t fParameterR;
  Int_t fMinTracks;

  TObjArray *fTrackInputArray;
  TIterator *fItTrackInputArray;

  TObjArray *fBeamSpotInputArray;
  TObjArray *fClusterInputArray;

  TObjArray *fInputArray;
  TIterator *fItInputArray;

  TObjArray *fOutputArray;

  bool svFitIsValid;

  ClassDef(SimpleSecondaryVertex, 1)
};

#endif
