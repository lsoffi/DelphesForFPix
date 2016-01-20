#include "TSystem.h"
#include "TPad.h"
#include "TChain.h"
#include "TCanvas.h"
#include "TLine.h"
#include "TArrow.h"
#include "TLegend.h"
#include "ExRootAnalysis/ExRootTreeReader.h"
#include "TClonesArray.h"
#include "TH1D.h"
#include "TH2D.h"
#include "classes/DelphesClasses.h"
#include "TFile.h"
#include "TStyle.h"
#include "TLorentzVector.h"

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <map>
#include <cmath>
#include <cstdio>
#include <signal.h>

//Events to be processed:
static const int LEN = 1;
static const int X_BIN = 600;
static const int Y_BIN = 60;
static const double X_MIN = -150;
static const double X_MAX = 150;
static const double Y_MIN = 0;
static const double Y_MAX = 5; 

using namespace std;

bool interrupted = false;
void signalHandler (int sig) { cout << "exiting..." << endl; interrupted = true; };

int
main (int argc, char *argv[])
{
  if (argc != 2)
    {
      cout << "Usage: " << argv[0] << " INPUT_FILE" << endl;
      cout << "  or:  " << argv[0] << " INPUT_LIST" << endl;
      cout << "" << endl;
      cout << endl;

      return 0;
    }
  string inputFile = argv[1], upperInputFile;
  upperInputFile.resize (inputFile.length ());
  transform (inputFile.begin (), inputFile.end (), upperInputFile.begin (), ::toupper);

  // so canvases don't appear on the screen when being created
  // very useful when running on the OSU T3 from CERN
  gROOT->SetBatch();
  gStyle->SetPadTopMargin(0.1);
  gStyle->SetPadBottomMargin(0.1);
  gStyle->SetPadLeftMargin(0.03);
  gStyle->SetPadRightMargin(0.08);

  //Create chain of root trees
  TChain chain("Delphes");

  if (upperInputFile.length () < 5 || upperInputFile.substr (upperInputFile.length () - 5, 5) != ".ROOT")
  {
    ifstream fin (inputFile);
    string line;
    while(getline(fin, line))
      {
        chain.Add(line.c_str());
      }
    fin.close();
  }
  else
    chain.Add(inputFile.c_str());

  // Create object of class ExRootTreeReader
  ExRootTreeReader *treeReader = new ExRootTreeReader(&chain);

  // Get pointers to branches used in this analysis
  TClonesArray *branchTrack = treeReader->UseBranch("Track");
  TClonesArray *branchCluster = treeReader->UseBranch("Cluster"); 
  TClonesArray *branchNPU = treeReader->UseBranch("NPU");

  //gStyle->SetOptStat(10011);
  //actually, let's turn this off for now
  gStyle->SetOptStat(0);


  TH2D *hist[LEN];
  signal (SIGINT, signalHandler);
  //Loop over a LEN Events
  for (int event = 0; event < LEN && !interrupted; event++) {

    //Load Branches
    treeReader->ReadEntry(event);

    // N.B. this is a hack put in by Andrew using the ScalarHT class                                                                                                                                    
    // it's the number of pileup interactions, it's not actually the HT                                                                                                                                 
    unsigned nInteractions = (unsigned) ((ScalarHT *) branchNPU->At(0))->HT + 1;
    int nClusters = branchCluster->GetEntries();


    // create and format the histogram for this event
    TString name = "TrackPtVsTrackZ_" + TString(Form("%d",event+1));
    TCanvas *can = new TCanvas(name,name,1600,500);

    TString title = "Event " + TString(Form("%d",event+1)) + ": ";
    title += TString(Form("%d",nInteractions)) + " Interactions, ";
    title += TString(Form("%d",nClusters)) + " Clusters";

    hist[event] = new TH2D(name, title, X_BIN, X_MIN, X_MAX, Y_BIN, Y_MIN, Y_MAX);
    hist[event]->GetXaxis()->SetTitle("track z [mm]");
    hist[event]->GetXaxis()->SetLabelOffset(0.02);
    hist[event]->GetXaxis()->SetTitleOffset(1.2);
    hist[event]->GetYaxis()->SetTitle("track p_{T} [GeV]");
    hist[event]->GetYaxis()->SetTitleOffset(0.35);


    
    TArrow *genPVArrow = new TArrow(0,0,0,0.01,0.01,"|>");
    genPVArrow->SetLineColor(3);
    genPVArrow->SetFillColor(3);
    genPVArrow->SetLineWidth(0.1);
    genPVArrow->SetAngle(40);

    vector<float> interactionPositions;
    vector<TLine *> clusterLineVector;
    Cluster *recoPV = (Cluster *) branchCluster->At(0);
    TLine *highELine = new TLine(recoPV->Z,0,recoPV->Z,Y_MAX);
    highELine->SetLineColor(1);
    highELine->SetLineWidth(0.8);
    highELine->SetLineStyle(3);

    // Draw cluster lines
    // Skip first cluster since we've already drawn it (start from 1)
    for(int iCluster = 1; iCluster < branchCluster->GetEntries(); iCluster++) {
	Cluster *cluster = (Cluster *) branchCluster->At(iCluster);
	TLine *clusterLine = new TLine(cluster->Z,0,cluster->Z,Y_MAX);
	clusterLine->SetLineWidth(0.5);
	clusterLineVector.push_back(clusterLine);
    }
   
    for(int iTrack = 0; iTrack < branchTrack->GetEntries(); iTrack++) {
        Track *track = (Track *) branchTrack->At(iTrack);
	if (track->PT < Y_MAX) hist[event]->Fill(track->Z, track->PT);
	else hist[event]->Fill(track->Z, Y_MAX-0.01); // if entry would be off the y-scale, draw it in the last bin

        if(track->IsPU==0) { // track comes from primary interaction
//           genPVArrow->SetX1(track->TrueZ);  FIXME
//           genPVArrow->SetX2(track->TrueZ); FIXME
	}
//	else if (find(interactionPositions.begin(), interactionPositions.end(), track->TrueZ) == interactionPositions.end()){ FIXME
//	  interactionPositions.push_back(track->TrueZ); FIXME
//	} FIXME
    }

    //create arrows for all the generated pileup interactions
    vector<TArrow *> interactionArrowVector;
    for(uint iInteraction = 0; iInteraction < interactionPositions.size() ; iInteraction++) {
      TArrow *interactionArrow = new TArrow(interactionPositions.at(iInteraction),0,interactionPositions.at(iInteraction),0.01,0.01,"|>");
      interactionArrow->SetLineWidth(0.1);
      interactionArrow->SetAngle(20);
      interactionArrow->SetLineColor(2);
      interactionArrow->SetFillColor(2);
      interactionArrowVector.push_back(interactionArrow);
    }
  
    //Draw and save images
    hist[event]->Draw("contz");
    for(uint iCluster = 0; iCluster < clusterLineVector.size(); iCluster++) {
      clusterLineVector.at(iCluster)->Draw();
    } 
    for(uint iInteraction = 0; iInteraction < interactionArrowVector.size(); iInteraction++) {
      interactionArrowVector.at(iInteraction)->Draw();
    } 
    highELine->Draw();
    genPVArrow->Draw();

    TLegend *leg = new TLegend(0.07,0.6,0.25,0.89);
    leg->SetBorderSize(0);
    leg->SetFillColor(0);
    leg->SetFillStyle(0);
    leg->AddEntry(genPVArrow, "Primary Gen. Interaction", "");
    if (interactionArrowVector.size() > 0) leg->AddEntry(interactionArrowVector.at(0), "Pileup Interactions", "");
    leg->AddEntry(highELine, "Highest #Sigmap_{T}^{2} Cluster", "l");
    if (clusterLineVector.size() > 0) leg->AddEntry(clusterLineVector.at(0), "Other Clusters", "l");
    leg->Draw();


    //hack to get the triangles to draw in the legend
    double x_left = X_MIN + (X_MAX-X_MIN)/13;
    double x_right = X_MIN + (X_MAX-X_MIN)/13;

    if (interactionArrowVector.size() > 0){
      TArrow *interactionArrowLabel = new TArrow(x_left,Y_MAX*0.86,x_right,Y_MAX*0.86,0.02,"|>");
      interactionArrowLabel->SetLineWidth(1);
      interactionArrowLabel->SetAngle(20);
      interactionArrowLabel->SetLineColor(2);
      interactionArrowLabel->SetFillColor(2);
      interactionArrowLabel->Draw();
    }
    TArrow *genPVArrowLabel = new TArrow(x_left,Y_MAX*0.94,x_right,Y_MAX*0.94,0.02,"|>");
    genPVArrowLabel->SetLineWidth(1);
    genPVArrowLabel->SetAngle(40);
    genPVArrowLabel->SetLineColor(3);
    genPVArrowLabel->SetFillColor(3);
    genPVArrowLabel->Draw();
    
    can->SaveAs("output/" + name + ".pdf");
    //can->Write();

  }
}
