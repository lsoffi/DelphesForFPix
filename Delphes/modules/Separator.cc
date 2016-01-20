
/** \class Separator
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

#include "modules/Separator.h"

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

#include <algorithm> 
#include <stdexcept>
#include <iostream>
#include <sstream>

using namespace std;

//------------------------------------------------------------------------------

Separator::Separator() :
  fPID(0), fItInputArray(0)
{
}

//------------------------------------------------------------------------------

Separator::~Separator()
{
}

//------------------------------------------------------------------------------

void Separator::Init()
{
  fPID = GetInt("PID", 0);

  fInputArray = ImportArray(GetString("InputArray", "VertexFinder/tracks"));
  fItInputArray = fInputArray->MakeIterator();

  ExRootConfParam param = GetParam("OutputArray");
  fBottomOutputArray = ExportArray(param[0].GetString());
  fTopOutputArray = ExportArray(param[1].GetString());
}

//------------------------------------------------------------------------------

void Separator::Finish()
{
  if(fItInputArray) delete fItInputArray;
}

//------------------------------------------------------------------------------

void Separator::Process()
{
  Candidate *candidate;

  fItInputArray->Reset();
  while((candidate = static_cast<Candidate*>(fItInputArray->Next())))
  {
    candidate = static_cast<Candidate*>(candidate->Clone());
    if (abs (candidate->PID) == fPID)
      fBottomOutputArray->Add(candidate);
    else
      fTopOutputArray->Add(candidate);
  }
}

//------------------------------------------------------------------------------
