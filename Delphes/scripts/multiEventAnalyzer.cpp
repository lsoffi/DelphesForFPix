#include "TSystem.h"
#include "TChain.h"
#include "ExRootAnalysis/ExRootTreeReader.h"
#include "TClonesArray.h"
#include "TH1D.h"
#include "TH2D.h"
#include "classes/DelphesClasses.h"
#include "TFile.h"
#include "TLorentzVector.h"
#include "TDirectory.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <map>
#include <cmath>
#include <signal.h>

#define REPORT_EVERY (100)

using namespace std;

bool interrupted = false;
void signalHandler (int sig) { cout << "exiting..." << endl; interrupted = true; };

int
main (int argc, char *argv[])
{
  if (argc != 3)
    {
      cout << "Usage: " << argv[0] << " INPUT_FILE OUTPUT_FILE" << endl;
      cout << "  or:  " << argv[0] << " INPUT_LIST OUTPUT_FILE" << endl;
      cout << "Run vertexing performance analysis on INPUT_FILE and store output to OUTPUT_FILE. If the" << endl;
      cout << "first argument is a text file, analysis is run on each file listed inside." << endl;
      cout << endl;

      return 0;
    }
  string inputFile = argv[1], outputFile = argv[2], upperInputFile;
  upperInputFile.resize (inputFile.length ());
  transform (inputFile.begin (), inputFile.end (), upperInputFile.begin (), ::toupper);

  // so canvases don't appear on the screen when being created
  // very useful when running on the OSU T3 from CERN
  gROOT->SetBatch();

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
  Long64_t numberOfEntries = treeReader->GetEntries();
  cout << "processing " << numberOfEntries << " events..." << endl << endl;

  // Get pointers to branches used in this analysis
  TClonesArray *branchTrack = treeReader->UseBranch("Track");
  TClonesArray *branchNPU = treeReader->UseBranch("NPU");
  TClonesArray *branchCluster = treeReader->UseBranch("Cluster");
  TClonesArray *branchVBFquarks = treeReader->UseBranch("VBFquarks");


  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Book histograms
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////

  TH1::SetDefaultSumw2();

  // VBF Quark Histograms
  TH1D *hVBFQuarkEta   = new TH1D("VBFQuarkEta", ";VBF quark #eta", 1000, -5.0, 5.0);
  TH1D *hVBFQuarkPt   = new TH1D("VBFQuarkPt", ";VBF quark p_{T} [GeV]", 1000, 0.0, 1000.0);
  TH2D *hVBFQuarkEtaVsPhi   = new TH2D("VBFQuarkPt", ";VBF quark #phi;VBF quark #eta", 500, -3.5, 3.5, 500, -5.0, 5.0);

  // Track Histograms
  TH1D *hTrackPt   = new TH1D("TrackPt", "; Track p_{T} [GeV]", 400, 0.0, 200.0);
  TH1D *hVBFTrackPt   = new TH1D("VBFTrackPt", ";VBF track p_{T} [GeV]", 400, 0.0, 200.0);
  TH1D *hPUTrackPt   = new TH1D("PUTrackPt", ";PU track p_{T} [GeV]", 400, 0.0, 200.0);
  TH1D *hTrackX = new TH1D("TrackX", "; Track x [mm]", 300, -3, 3);
  TH1D *hTrackY = new TH1D("TrackY", "; Track y [mm]", 300, -3, 3);
  TH1D *hTrackZ = new TH1D("TrackZ", "; Track z [mm]", 300, -300, 300);

  TH1D *hTrackEX = new TH1D("TrackEX", "; Track #sigma_{x} [mm]", 100, 0, 1);
  TH1D *hTrackEY = new TH1D("TrackEY", "; Track #sigma_{y} [mm]", 100, 0, 1);
  TH1D *hTrackEZ = new TH1D("TrackEZ", "; Track #sigma_{z} [mm]", 100, 0, 20);

  TH1D *hTrackXSmearingShift = new TH1D("TrackXSmearingShift", "; Track x_{smeared} - x_{true} [mm]", 100, -2, 2);
  TH1D *hTrackYSmearingShift = new TH1D("TrackYSmearingShift", "; Track y_{smeared} - y_{true} [mm]", 100, -2, 2);
  TH1D *hTrackZSmearingShift = new TH1D("TrackZSmearingShift", "; Track z_{smeared} - z_{true} [mm]", 100, -50, 50);

  TH1D *hTrackDisplacementClusterX = new TH1D("TrackDisplacementClusterX", "; |Track x - Cluster x| [mm]", 100, 0, 10);
  TH1D *hTrackDisplacementClusterY = new TH1D("TrackDisplacementClusterY", "; |Track y - Cluster y| [mm]", 100, 0, 10);
  TH1D *hTrackDisplacementClusterZ = new TH1D("TrackDisplacementClusterZ", "; |Track z - Cluster z| [mm]", 100, 0, 300);

  TH1D *hTrackDisplacementInteractionX = new TH1D("TrackDisplacementInteractionX", "; |Track x - Interaction x| [mm]", 100, 0, 10);
  TH1D *hTrackDisplacementInteractionY = new TH1D("TrackDisplacementInteractionY", "; |Track y - Interaction y| [mm]", 100, 0, 10);
  TH1D *hTrackDisplacementInteractionZ = new TH1D("TrackDisplacementInteractionZ", "; |Track z - Interaction z| [mm]", 100, 0, 50);

  // Cluster Histograms
  TH1D *hClusterX = new TH1D("ClusterX", "; Cluster x [mm]", 300, -3, 3);
  TH1D *hClusterEX = new TH1D("ClusterEX", "; Cluster #sigmax [mm]", 100, 0, 0.1);
  TH1D *hClusterY = new TH1D("ClusterY", "; Cluster y [mm]", 300, -3, 3);
  TH1D *hClusterEY = new TH1D("ClusterEY", "; Cluster #sigmay [mm]", 100, 0, 0.1);
  TH1D *hClusterZ = new TH1D("ClusterZ", "; Cluster z [mm]", 300, -300, 300);
  TH1D *hClusterEZ = new TH1D("ClusterEZ", "; Cluster #sigmaz [mm]", 100, 0, 0.1);
  TH2D *hClusterTransversePosition = new TH2D("ClusterTransversePosition", "; Cluster x [mm]; Cluster y [mm]", 300, -3,3, 300, -3, 3);
  TH2D *hClusterRZPosition = new TH2D("ClusterRZPosition", "; Cluster z [mm]; Cluster r [mm]", 100, -300, 300, 100, 0, 1.5);

  // Reco PV Histograms
  TH1D *hRecoPVX = new TH1D("RecoPVX", "; Reco PV x [mm]", 300, -3, 3);
  TH1D *hRecoPVY = new TH1D("RecoPVY", "; Reco PV y [mm]", 300, -3, 3);
  TH1D *hRecoPVZ = new TH1D("RecoPVZ", "; Reco PV z [mm]", 300, -300, 300);
  TH1D *hRecoPVTrackPurity = new TH1D("RecoPVTrackPurity", "; Fraction of Reco PV tracks from primary interaction", 101, 0, 1.01);
  TH1D *hRecoPVMomentumPurity = new TH1D("RecoPVMomentumPurity", "; Fraction of Reco PV momentum from primary interaction", 101, 0, 1.01);
  TH2D *hRecoPVTransversePosition = new TH2D("RecoPVTransversePosition", "; Reco PV x [mm]; Reco PV y [mm]", 300, -3, 3, 300, -3, 3);
  TH2D *hRecoPVRZPosition = new TH2D("RecoPVRZPosition", "; RecoPV z [mm]; RecoPV r [mm]", 100, -300, 300, 100, 0, 1.5);

  // Gen PV Histograms
  TH1D *hGenPVX = new TH1D("GenPVX", "; Gen PV x [mm]", 300, -3, 3);
  TH1D *hGenPVY = new TH1D("GenPVY", "; Gen PV y [mm]", 300, -3, 3);
  TH1D *hGenPVZ = new TH1D("GenPVZ", "; Gen PV z [mm]", 300, -300, 300);
  TH2D *hGenPVTransversePosition = new TH2D("GenPVTransversePosition", "; Gen PV x [mm]; Gen PV y [mm]", 300, -3, 3, 300, -3, 3);
  TH2D *hGenPVRZPosition = new TH2D("GenPVRZPosition", "; Gen PV z [mm]; Gen PV r [mm]", 100, -300, 300, 100, 0, 1.5);

  // PV Comparison Histograms
  TH1D *hPVdisplacementZ = new TH1D("PVdisplacementZ", "; z_{gen PV} - z_{reco PV} [mm]", 200, -10, 10);
  TH1D *hAbsPVdisplacementZ = new TH1D("AbsPVdisplacementZ", ";|z_{gen PV} - z_{reco PV}| [mm]", 200, 0, 10);
  TH2D *hZRecoPVVsZGenPV = new TH2D("ZRecoPVVsZGenPV", "; z_{gen PV} [mm]; z_{reco PV} [mm]", 1000, -150, 150, 1000, -150, 150);
  TH2D *hNumTracksRecoPVVsNumTracksGenPV = new TH2D("NumTracksRecoPVVsNumTracksGenPV", ";number of tracks in Gen PV;number of tracks in Reco PV", 300, 0, 300, 300, 0, 300);
  TH2D *hPtRecoPVVsPtGenPV = new TH2D("PtRecoPVVsPtGenPV", ";#Sigma p_{T} of tracks in Gen PV;#Sigma p_{T} of tracks in Reco PV", 200, 0, 600, 200, 0, 600);

  // Size Histograms
  TH1D *hNumTracksPerEvent   = new TH1D("NumTracksPerEvent",   "; Num. of Tracks Per Event",   100,  0.0, 10000);
  TH1D *hNumTracksPerCluster = new TH1D("NumTracksPerCluster", "; Num. of Tracks Per Cluster", 100, 0.0, 500.0);
  TH1D *hNumClustersPerEvent = new TH1D("NumClustersPerEvent", "; Num. of Clusters Per Event", 100,  0.0, 100.0 );
  TH1D *hNumInteractionsPerEvent = new TH1D("NumInteractionsPerEvent", "; Num. of Interactions Per Event", 201,  0.0, 201.0 );
  TH2D *hNumClustersVsNumInteractions = new TH2D("NumClustersVsNumInteractions", ";number of interactions;number of clusters", 200, 0.0, 200.0, 200, 0.0, 200.0);
  TH2D *hPVDisplacementVsNumInteractions = new TH2D("PVDisplacementVsNInteractions", ";|z_{gen PV} - z_{reco PV}| [mm];number of interactions", 1000, 0, 10, 201, 0.0, 201.0);

  // Other Histograms
  TH1D *hClusteredTrackFraction = new TH1D("ClusteredTrackFraction", "; Fraction of tracks successfully clustered", 101, 0, 1.01);
  TH1D *hClusteredMomentumFraction = new TH1D("ClusteredMomentumFraction", "; Fraction of track p_{T} successfully clustered", 101, 0, 1.01);
  TH2D *hCorrectPrimaryVertex = new TH2D("CorrectPrimaryVertex", "; Number of Pileup Vertices; True/False Correct PV", 200, 0, 200, 2, 0, 1);


  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  // Begin loop over all events
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////

  signal (SIGINT, signalHandler);
  for (Int_t entry = 0; entry < numberOfEntries && !interrupted; ++entry)
    {

      // Load selected branches with data from specified event
      if(!(entry % REPORT_EVERY))
        cout << "processing event " << (entry + 1) << "..." << endl;

      treeReader->ReadEntry(entry);

      // N.B. this is a hack put in by Andrew using the ScalarHT class
      // it's the number of pileup interactions, it's not actually the HT
      unsigned nInteractions = (unsigned) ((ScalarHT *) branchNPU->At(0))->HT + 1;
      unsigned nClusters = branchCluster->GetEntries();

      hNumInteractionsPerEvent->Fill(nInteractions);
      hNumClustersPerEvent->Fill(nClusters);
      hNumClustersVsNumInteractions->Fill(nInteractions,nClusters);
      hNumTracksPerEvent->Fill(branchTrack->GetEntries());

      // the cluster branch is sorted by sum pt**2, so first entry is the reconstructed primary vertex
      Cluster *recoPV = (Cluster *) branchCluster->At(0);

      double genPVX = 0;
      double genPVY = 0;
      double genPVZ = 0;

      int nUnclusteredTracks = 0;
      int nClusteredTracks = 0;
      double unclusteredMomentum = 0;
      double clusteredMomentum = 0;

      int nTracksInGenPV = 0;
      int nTracksInRecoPV = 0;
      double momentumInGenPV = 0;
      double momentumInRecoPV = 0;
      double recoPVtrackPurity = 0;
      double recoPVmomentumPurity = 0;

      map<int, double> clusterXPositionMap; // < cluster index , weighted average X position >
      map<int, double> clusterYPositionMap; // < cluster index , weighted average Y position >
      map<int, double> clusterZPositionMap; // < cluster index , weighted average Z position >

      map<int, double> interactionXPositionMap; // < interaction index , weighted average X position >
      map<int, double> interactionXWeightMap; // < interaction index , sum of weights >                                                                                                                   
      map<int, double> interactionYPositionMap; // < interaction index , weighted average Y position >
      map<int, double> interactionYWeightMap; // < interaction index , sum of weights >                                                                                                                   
      map<int, double> interactionZPositionMap; // < interaction index , weighted average Z position >
      map<int, double> interactionZWeightMap; // < interaction index , sum of weights >                                                                                                                   

      for (int iVBFquark = 0; iVBFquark < branchVBFquarks->GetEntries (); iVBFquark++)
        {
          GenParticle *vbfQuark = (GenParticle *) branchVBFquarks->At (iVBFquark);
          hVBFQuarkEta->Fill (vbfQuark->Eta);
          hVBFQuarkPt->Fill (vbfQuark->PT);
          hVBFQuarkEtaVsPhi->Fill (vbfQuark->Phi, vbfQuark->Eta);
        }

      ///////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////////
      // Begin loop over all clusters in the event
      ///////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////////

      for(int iCluster = 0; iCluster < branchCluster->GetEntries(); iCluster++)
        {
          Cluster *cluster = (Cluster *) branchCluster->At(iCluster);

	  hNumTracksPerCluster->Fill(cluster->NDF);
	  
          clusterXPositionMap[cluster->Index] = cluster->X;
          clusterYPositionMap[cluster->Index] = cluster->Y;
          clusterZPositionMap[cluster->Index] = cluster->Z;

          //fill corresponding histograms

          hClusterX->Fill(cluster->X);
          hClusterEX->Fill(cluster->ErrorX);
          hClusterY->Fill(cluster->Y);
          hClusterEY->Fill(cluster->ErrorY);
          hClusterZ->Fill(cluster->Z);
          hClusterEZ->Fill(cluster->ErrorZ);
          hClusterTransversePosition->Fill(cluster->X,cluster->Y);
          double clusterRadius = sqrt(cluster->X * cluster->X + cluster->Y * cluster->Y);
          hClusterRZPosition->Fill(cluster->Z,clusterRadius);
        }


      ///////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////////
      // Begin loop over all tracks in the event
      ///////////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////////

      for(int iTrack = 0; iTrack < branchTrack->GetEntries(); iTrack++){

	Track *track = (Track *) branchTrack->At(iTrack);

        if (abs (track->PID) != 13) // N.B.: this will only work for H->4mu
          {
            if (track->IsPU)
              hPUTrackPt->Fill (track->PT);
            else
              hVBFTrackPt->Fill (track->PT);
          }

	hTrackPt->Fill(track->PT);          
	hTrackX->Fill(track->X);
	hTrackY->Fill(track->Y);
	hTrackZ->Fill(track->Z);
//	hTrackEX->Fill(track->ErrorX); FIXME
//	hTrackEY->Fill(track->ErrorY); FIXME
//	hTrackEZ->Fill(track->ErrorZ); FIXME
//	hTrackXSmearingShift->Fill(track->X-track->TrueX); FIXME
//	hTrackYSmearingShift->Fill(track->Y-track->TrueY); FIXME
//	hTrackZSmearingShift->Fill(track->Z-track->TrueZ); FIXME


	// calculate amount of tracks/pt that was clustered
	if(track->ClusterIndex >= 0){ //this means it was clustered
	  nClusteredTracks++;
	  clusteredMomentum += track->PT;
	}
	else{
	  nUnclusteredTracks++;
	  unclusteredMomentum += track->PT;
	}

	// calculate and store useful information about the generated and reconstructed primary vertices	
	if (track->IsPU==0){ // it's a track from the GEN PV
//	  genPVX += track->TrueX; FIXME
//	  genPVY += track->TrueY; FIXME
//	  genPVZ += track->TrueZ; FIXME
	  nTracksInGenPV++;
	  momentumInGenPV += track->PT;
	}
	if (track->ClusterIndex==recoPV->Index){ // comes from the RECO primary vertex
	  nTracksInRecoPV++;
	  momentumInRecoPV += track->PT;
	  if (track->IsPU==0){ // also comes from the GEN primary vertex
	    recoPVtrackPurity++;
	    recoPVmomentumPurity += track->PT;
	  }
	}

	// store the positions of each generated interaction
	if (!interactionXPositionMap.count (track->IsPU))
	  {
	    interactionXPositionMap[track->IsPU] = 0.0;
	    interactionXWeightMap[track->IsPU] = 0.0;
	  }
//	interactionXPositionMap[track->IsPU] += track->TrueX; FIXME
	interactionXWeightMap[track->IsPU] += 1.0;
	if (!interactionYPositionMap.count (track->IsPU))
	  {
	    interactionYPositionMap[track->IsPU] = 0.0;
	    interactionYWeightMap[track->IsPU] = 0.0;
	  }
//	interactionYPositionMap[track->IsPU] += track->TrueY; FIXME
	interactionYWeightMap[track->IsPU] += 1.0;
	if (!interactionZPositionMap.count (track->IsPU))
	  {
	    interactionZPositionMap[track->IsPU] = 0.0;
	    interactionZWeightMap[track->IsPU] = 0.0;
	  }
//	interactionZPositionMap[track->IsPU] += track->TrueZ; FIXME
	interactionZWeightMap[track->IsPU] += 1.0;

      } // end loop over all tracks

      for(map<int, double>::const_iterator interaction = interactionXPositionMap.begin (); interaction != interactionXPositionMap.end (); interaction++)
        {
          interactionXPositionMap.at(interaction->first) /= interactionXWeightMap.at(interaction->first);
          interactionYPositionMap.at(interaction->first) /= interactionYWeightMap.at(interaction->first);
          interactionZPositionMap.at(interaction->first) /= interactionZWeightMap.at(interaction->first);
        }

      if(recoPVtrackPurity == 0)
	{
	  hCorrectPrimaryVertex->Fill(nInteractions, 0);
	}
      if(recoPVtrackPurity > 0 && recoPVtrackPurity <=1)
	{
	  hCorrectPrimaryVertex->Fill(nInteractions, 1);
	}

      genPVX /= nTracksInGenPV;
      genPVY /= nTracksInGenPV;
      genPVZ /= nTracksInGenPV;
      recoPVtrackPurity /= nTracksInRecoPV;
      recoPVmomentumPurity /= momentumInRecoPV;

      hRecoPVTrackPurity->Fill(recoPVtrackPurity);
      hRecoPVMomentumPurity->Fill(recoPVmomentumPurity);
      hNumTracksRecoPVVsNumTracksGenPV->Fill(nTracksInGenPV,recoPV->NDF);
      hPtRecoPVVsPtGenPV->Fill(momentumInGenPV,momentumInRecoPV);

      hClusteredTrackFraction->Fill(float(nClusteredTracks)/(nClusteredTracks+nUnclusteredTracks));
      hClusteredMomentumFraction->Fill(clusteredMomentum/(clusteredMomentum+unclusteredMomentum));

      hRecoPVX->Fill(recoPV->X);
      hRecoPVY->Fill(recoPV->Y);
      hRecoPVZ->Fill(recoPV->Z);
      hRecoPVTransversePosition->Fill(recoPV->X,recoPV->Y);

      hGenPVX->Fill(genPVX);
      hGenPVY->Fill(genPVY);
      hGenPVZ->Fill(genPVZ);
      hGenPVTransversePosition->Fill(genPVX,genPVY);

      double pvRadius = sqrt(recoPV->X * recoPV->X + recoPV->Y * recoPV->Y);
      double genPVRadius = sqrt(genPVX * genPVX + genPVY * genPVY);

      hRecoPVRZPosition->Fill(recoPV->Z,pvRadius);
      hGenPVRZPosition->Fill(genPVZ,genPVRadius);

      hPVdisplacementZ->Fill(genPVZ - recoPV->Z);
      hAbsPVdisplacementZ->Fill(fabs(genPVZ - recoPV->Z));
      hZRecoPVVsZGenPV->Fill(genPVZ, recoPV->Z);
      hPVDisplacementVsNumInteractions->Fill(fabs(genPVZ - recoPV->Z), nInteractions);



      //re-loop over all the tracks and fill the special histograms
      for(int iTrack = 0; iTrack < branchTrack->GetEntries(); iTrack++)
        {
          Track *track = (Track *) branchTrack->At(iTrack);
	  if (track->ClusterIndex >=0){//only include clustered tracks
	    
	    hTrackDisplacementClusterX->Fill(fabs(track->X - clusterXPositionMap.at(track->ClusterIndex)));
	    hTrackDisplacementClusterY->Fill(fabs(track->Y - clusterYPositionMap.at(track->ClusterIndex)));
	    hTrackDisplacementClusterZ->Fill(fabs(track->Z - clusterZPositionMap.at(track->ClusterIndex)));
	  }
          hTrackDisplacementInteractionX->Fill(fabs(track->X - interactionXPositionMap.at(track->IsPU)));
          hTrackDisplacementInteractionY->Fill(fabs(track->Y - interactionYPositionMap.at(track->IsPU)));
          hTrackDisplacementInteractionZ->Fill(fabs(track->Z - interactionZPositionMap.at(track->IsPU)));
        }



    } // end loop over events


  // Save resulting histograms
  TFile *fout = TFile::Open(outputFile.c_str(), "recreate");


  fout->cd();
  TDirectory *vbfQuarkFolder = fout->mkdir("VBF Quark Histograms");
  vbfQuarkFolder->cd();

  // VBF Quark Histograms
  hVBFQuarkEta->Write ();
  hVBFQuarkPt->Write ();
  hVBFQuarkEtaVsPhi->Write ();


  fout->cd();
  TDirectory *trackFolder = fout->mkdir("Track Histograms");
  trackFolder->cd();

  // Track Histograms
  hTrackPt->Write();
  hVBFTrackPt->Write();
  hPUTrackPt->Write();
  hTrackX->Write();
  hTrackY->Write();
  hTrackZ->Write();
  hTrackEX->Write();
  hTrackEY->Write();
  hTrackEZ->Write();
  hTrackXSmearingShift->Write();
  hTrackYSmearingShift->Write();
  hTrackZSmearingShift->Write();
  hTrackDisplacementClusterX->Write();
  hTrackDisplacementClusterY->Write();
  hTrackDisplacementClusterZ->Write();
  hTrackDisplacementInteractionX->Write();
  hTrackDisplacementInteractionY->Write();
  hTrackDisplacementInteractionZ->Write();


  fout->cd();
  TDirectory *clusterFolder = fout->mkdir("Cluster Histograms");
  clusterFolder->cd();

  // Cluster Histograms
  hClusterX->Write();
  hClusterEX->Write();
  hClusterY->Write();
  hClusterEY->Write();
  hClusterZ->Write();
  hClusterEZ->Write();
  hNumTracksPerCluster->Write();
  hClusterTransversePosition->Write();
  hClusterRZPosition->Write();


  fout->cd();
  TDirectory *eventFolder = fout->mkdir("Event Histograms");
  eventFolder->cd();

  // Reco PV Histograms
  hRecoPVX->Write();
  hRecoPVY->Write();
  hRecoPVZ->Write();
  hRecoPVTrackPurity->Write();
  hRecoPVMomentumPurity->Write();
    
  // Gen PV Histograms
  hGenPVX->Write();
  hGenPVY->Write();
  hGenPVZ->Write();
  
  // Size Histograms
  hNumTracksPerEvent->Write();
  hNumClustersPerEvent->Write();
  hNumInteractionsPerEvent->Write();

  // 2D Histograms
  hNumClustersVsNumInteractions->Write();
  hRecoPVTransversePosition->Write();
  hGenPVTransversePosition->Write();

  hRecoPVRZPosition->Write();
  hGenPVRZPosition->Write();
  hPVDisplacementVsNumInteractions->Write();

  hCorrectPrimaryVertex->Write();

  // Gen/Reco PV Comparison Histograms
  hNumTracksRecoPVVsNumTracksGenPV->Write();
  hPtRecoPVVsPtGenPV->Write();
  hPVdisplacementZ->Write();
  hAbsPVdisplacementZ->Write();
  hZRecoPVVsZGenPV->Write();

  // Other Histograms
  hClusteredTrackFraction->Write();
  hClusteredMomentumFraction->Write();

  fout->Close();
}
