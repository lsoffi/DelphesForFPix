#include "TSystem.h"
#include "TChain.h"
#include "ExRootAnalysis/ExRootTreeReader.h"
#include "TClonesArray.h"
#include "TH1D.h"
#include "TH2D.h"
#include "classes/DelphesClasses.h"
#include "TFile.h"
#include "TLorentzVector.h"
#include "TThread.h"

#include <algorithm>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <map>
#include <cmath>
#include <signal.h>
#include <unordered_map>
#include <unordered_set>

#define  CPUS                 (1)
#define  REPORT_EVERY         (1)

using namespace std;

bool interrupted = false;

bool ptDescending (const pair<double, pair<Jet *, Jet *> > dijet0, const pair<double, pair<Jet *, Jet *> > dijet1) { return (dijet0.first > dijet1.first); }
void *analyze (void *);
void signalHandler (int sig) { cout << "exiting..." << endl; interrupted = true; };
bool passesPUJetID (const Jet *, const double, const string, double = -1.0, double = -1.0, bool = true, bool = true);
string getEtaRange (const Jet *, const double);

int
main (int argc, char *argv[])
{
  if (argc != 3)
    {
      cout << "Usage: " << argv[0] << " INPUT_FILE OUTPUT_FILE" << endl;
      cout << "  or:  " << argv[0] << " INPUT_LIST OUTPUT_FILE" << endl;
      cout << "Run VBF H->4mu analysis on INPUT_FILE and store output to OUTPUT_FILE. If the" << endl;
      cout << "first argument is a text file, analysis is run on each file listed inside." << endl;
      cout << endl;

      return 0;
    }
  string inputFile = argv[1], outputFile = argv[2], upperInputFile;
  upperInputFile.resize (inputFile.length ());
  transform (inputFile.begin (), inputFile.end (), upperInputFile.begin (), ::toupper);

  //Create lists of files for each thread
  vector<string> fileList, threadFileList[CPUS];
  if (upperInputFile.length () < 5 || upperInputFile.substr (upperInputFile.length () - 5, 5) != ".ROOT")
    {
      ifstream fin (inputFile.c_str ());
      string line;
      while (getline (fin, line))
        fileList.push_back (line);
      fin.close ();
    }
  else
    fileList.push_back (inputFile);

  unsigned iThread = 0,
           filesPerThread = (unsigned) (ceil (((double) fileList.size ()) / ((double) CPUS)));
  for (auto file = fileList.cbegin (); file != fileList.end (); file++)
    {
      unsigned iFile = file - fileList.begin ();
      if (iFile && !(iFile % filesPerThread))
        iThread++;
      threadFileList[iThread].push_back (*file);
    }

  // Book histograms
  unordered_map<string, unordered_map<string, TH1D *> > oneDHists;
  unordered_map<string, unordered_map<string, TH2D *> > twoDHists;

  vector<string> jetCollections;
  /*jetCollections.push_back ("UncorrectedJetNoCHS");
  jetCollections.push_back ("UncorrectedJetNoCHS_PUJetID");
  jetCollections.push_back ("UncorrectedJet");
  jetCollections.push_back ("JetNoCHS");
  jetCollections.push_back ("JetNoCHS_PUJetID");
  jetCollections.push_back ("Jet");*/
  jetCollections.push_back ("Jet_PUJetID");

  /*jetCollections.push_back ("UncorrectedPuppiJet");
  jetCollections.push_back ("UncorrectedPuppiJet_PUJetID");
  jetCollections.push_back ("PuppiJet");
  jetCollections.push_back ("PuppiJet_PUJetID");*/

  TH1::SetDefaultSumw2 ();
  oneDHists["/"]["nInteractions"] = new TH1D("nInteractions", ";number of interactions", 200, 0.0, 200.0);
  twoDHists["/"]["nClustersVsNInteractions"] = new TH2D("nClustersVsNInteractions", ";number of interactions;number of clusters", 200, 0.0, 200.0, 200, 0.0, 200.0);
  oneDHists["/"]["vbfEta"] = new TH1D("vbfEta", ";VBF quark |#eta|", 1000, 0.0, 5.0);

  oneDHists["/"]["pvTrackEfficiency"] = new TH1D("pvTrackEfficiency", ";PV track efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["pvTrackPurity"] = new TH1D("pvTrackPurity", ";PV track purity", 1000, 0.0, 1.001);
  oneDHists["/"]["pvTrackFakeRate"] = new TH1D("pvTrackFakeRate", ";PV track fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["pvPTEfficiency"] = new TH1D("pvPTEfficiency", ";PV p_{T} efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["pvPTPurity"] = new TH1D("pvPTPurity", ";PV p_{T} purity", 1000, 0.0, 1.001);
  oneDHists["/"]["pvPTFakeRate"] = new TH1D("pvPTFakeRate", ";PV p_{T} fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoTrackEfficiency"] = new TH1D("pvRecoTrackEfficiency", ";PV track efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoTrackPurity"] = new TH1D("pvRecoTrackPurity", ";PV track purity", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoTrackFakeRate"] = new TH1D("pvRecoTrackFakeRate", ";PV track fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoPTEfficiency"] = new TH1D("pvRecoPTEfficiency", ";PV p_{T} efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoPTPurity"] = new TH1D("pvRecoPTPurity", ";PV p_{T} purity", 1000, 0.0, 1.001);
  oneDHists["/"]["pvRecoPTFakeRate"] = new TH1D("pvRecoPTFakeRate", ";PV p_{T} fake rate", 1000, 0.0, 1.001);

  oneDHists["/"]["originalPVTrackEfficiency"] = new TH1D("originalPVTrackEfficiency", ";PV track efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVTrackPurity"] = new TH1D("originalPVTrackPurity", ";PV track purity", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVTrackFakeRate"] = new TH1D("originalPVTrackFakeRate", ";PV track fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVPTEfficiency"] = new TH1D("originalPVPTEfficiency", ";PV p_{T} efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVPTPurity"] = new TH1D("originalPVPTPurity", ";PV p_{T} purity", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVPTFakeRate"] = new TH1D("originalPVPTFakeRate", ";PV p_{T} fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoTrackEfficiency"] = new TH1D("originalPVRecoTrackEfficiency", ";PV track efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoTrackPurity"] = new TH1D("originalPVRecoTrackPurity", ";PV track purity", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoTrackFakeRate"] = new TH1D("originalPVRecoTrackFakeRate", ";PV track fake rate", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoPTEfficiency"] = new TH1D("originalPVRecoPTEfficiency", ";PV p_{T} efficiency", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoPTPurity"] = new TH1D("originalPVRecoPTPurity", ";PV p_{T} purity", 1000, 0.0, 1.001);
  oneDHists["/"]["originalPVRecoPTFakeRate"] = new TH1D("originalPVRecoPTFakeRate", ";PV p_{T} fake rate", 1000, 0.0, 1.001);

  twoDHists["/"]["pvTrackEfficiencyVsNInteractions"] = new TH2D("pvTrackEfficiencyVsNInteractions", ";number of interactions;PV track efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvTrackPurityVsNInteractions"] = new TH2D("pvTrackPurityVsNInteractions", ";number of interactions;PV track purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvTrackFakeRateVsNInteractions"] = new TH2D("pvTrackFakeRateVsNInteractions", ";number of interactions;PV track fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvTrackPurityVsPVTrackEfficiency"] = new TH2D("pvTrackPurityVsPVTrackEfficiency", ";PV track efficiency;PV track purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvTrackFakeRateVsPVTrackEfficiency"] = new TH2D("pvTrackFakeRateVsPVTrackEfficiency", ";PV track efficiency;PV track fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvPTEfficiencyVsNInteractions"] = new TH2D("pvPTEfficiencyVsNInteractions", ";number of interactions;PV p_{T} efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvPTPurityVsNInteractions"] = new TH2D("pvPTPurityVsNInteractions", ";number of interactions;PV p_{T} purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvPTFakeRateVsNInteractions"] = new TH2D("pvPTFakeRateVsNInteractions", ";number of interactions;PV p_{T} fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvPTPurityVsPVPTEfficiency"] = new TH2D("pvPTPurityVsPVPTEfficiency", ";PV p_{T} efficiency;PV p_{T} purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvPTFakeRateVsPVPTEfficiency"] = new TH2D("pvPTFakeRateVsPVPTEfficiency", ";PV p_{T} efficiency;PV p_{T} fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoTrackEfficiencyVsNInteractions"] = new TH2D("pvRecoTrackEfficiencyVsNInteractions", ";number of interactions;PV track efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoTrackPurityVsNInteractions"] = new TH2D("pvRecoTrackPurityVsNInteractions", ";number of interactions;PV track purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoTrackFakeRateVsNInteractions"] = new TH2D("pvRecoTrackFakeRateVsNInteractions", ";number of interactions;PV track fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoTrackPurityVsPVRecoTrackEfficiency"] = new TH2D("pvRecoTrackPurityVsPVRecoTrackEfficiency", ";PV track efficiency;PV track purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoTrackFakeRateVsPVRecoTrackEfficiency"] = new TH2D("pvRecoTrackFakeRateVsPVRecoTrackEfficiency", ";PV track efficiency;PV track fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoPTEfficiencyVsNInteractions"] = new TH2D("pvRecoPTEfficiencyVsNInteractions", ";number of interactions;PV p_{T} efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoPTPurityVsNInteractions"] = new TH2D("pvRecoPTPurityVsNInteractions", ";number of interactions;PV p_{T} purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoPTFakeRateVsNInteractions"] = new TH2D("pvRecoPTFakeRateVsNInteractions", ";number of interactions;PV p_{T} fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoPTPurityVsPVRecoPTEfficiency"] = new TH2D("pvRecoPTPurityVsPVRecoPTEfficiency", ";PV p_{T} efficiency;PV p_{T} purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["pvRecoPTFakeRateVsPVRecoPTEfficiency"] = new TH2D("pvRecoPTFakeRateVsPVRecoPTEfficiency", ";PV p_{T} efficiency;PV p_{T} fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);

  twoDHists["/"]["originalPVTrackEfficiencyVsNInteractions"] = new TH2D("originalPVTrackEfficiencyVsNInteractions", ";number of interactions;PV track efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVTrackPurityVsNInteractions"] = new TH2D("originalPVTrackPurityVsNInteractions", ";number of interactions;PV track purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVTrackFakeRateVsNInteractions"] = new TH2D("originalPVTrackFakeRateVsNInteractions", ";number of interactions;PV track fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVTrackPurityVsPVTrackEfficiency"] = new TH2D("originalPVTrackPurityVsPVTrackEfficiency", ";PV track efficiency;PV track purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVTrackFakeRateVsPVTrackEfficiency"] = new TH2D("originalPVTrackFakeRateVsPVTrackEfficiency", ";PV track efficiency;PV track fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVPTEfficiencyVsNInteractions"] = new TH2D("originalPVPTEfficiencyVsNInteractions", ";number of interactions;PV p_{T} efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVPTPurityVsNInteractions"] = new TH2D("originalPVPTPurityVsNInteractions", ";number of interactions;PV p_{T} purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVPTFakeRateVsNInteractions"] = new TH2D("originalPVPTFakeRateVsNInteractions", ";number of interactions;PV p_{T} fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVPTPurityVsPVPTEfficiency"] = new TH2D("originalPVPTPurityVsPVPTEfficiency", ";PV p_{T} efficiency;PV p_{T} purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVPTFakeRateVsPVPTEfficiency"] = new TH2D("originalPVPTFakeRateVsPVPTEfficiency", ";PV p_{T} efficiency;PV p_{T} fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoTrackEfficiencyVsNInteractions"] = new TH2D("originalPVRecoTrackEfficiencyVsNInteractions", ";number of interactions;PV track efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoTrackPurityVsNInteractions"] = new TH2D("originalPVRecoTrackPurityVsNInteractions", ";number of interactions;PV track purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoTrackFakeRateVsNInteractions"] = new TH2D("originalPVRecoTrackFakeRateVsNInteractions", ";number of interactions;PV track fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoTrackPurityVsPVRecoTrackEfficiency"] = new TH2D("originalPVRecoTrackPurityVsPVRecoTrackEfficiency", ";PV track efficiency;PV track purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoTrackFakeRateVsPVRecoTrackEfficiency"] = new TH2D("originalPVRecoTrackFakeRateVsPVRecoTrackEfficiency", ";PV track efficiency;PV track fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoPTEfficiencyVsNInteractions"] = new TH2D("originalPVRecoPTEfficiencyVsNInteractions", ";number of interactions;PV p_{T} efficiency", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoPTPurityVsNInteractions"] = new TH2D("originalPVRecoPTPurityVsNInteractions", ";number of interactions;PV p_{T} purity", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoPTFakeRateVsNInteractions"] = new TH2D("originalPVRecoPTFakeRateVsNInteractions", ";number of interactions;PV p_{T} fake rate", 200, 0.0, 200.0, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoPTPurityVsPVRecoPTEfficiency"] = new TH2D("originalPVRecoPTPurityVsPVRecoPTEfficiency", ";PV p_{T} efficiency;PV p_{T} purity", 1000, 0.0, 1.001, 1000, 0.0, 1.001);
  twoDHists["/"]["originalPVRecoPTFakeRateVsPVRecoPTEfficiency"] = new TH2D("originalPVRecoPTFakeRateVsPVRecoPTEfficiency", ";PV p_{T} efficiency;PV p_{T} fake rate", 1000, 0.0, 1.001, 1000, 0.0, 1.001);

  for (const auto &jetCollection : jetCollections)
    {
      oneDHists[jetCollection]["vbfJetsFound"] = new TH1D("vbfJetsFound", ";number of interactions", 200, 0.0, 200.0);
      oneDHists[jetCollection]["vbfJetsMatched"] = new TH1D("vbfJetsMatched", ";number of interactions", 200, 0.0, 200.0);

      oneDHists[jetCollection]["vbfJetsFound_VBFEta"] = new TH1D("vbfJetsFound_VBFEta", ";VBF quark |#eta|", 1000, 0.0, 5.0);
      oneDHists[jetCollection]["vbfJetsMatched_VBFEta"] = new TH1D("vbfJetsMatched_VBFEta", ";VBF quark |#eta|", 1000, 0.0, 5.0);

      twoDHists[jetCollection]["vbfPTDiffVsNInteractions"] = new TH2D("vbfPTDiffVsNInteractions", ";number of interactions;#Deltap_{T}^{VBF} [GeV]", 200, 0.0, 200.0, 1000, -100.0, 100.001);
      twoDHists[jetCollection]["vbfMassDiffVsNInteractions"] = new TH2D("vbfMassDiffVsNInteractions", ";number of interactions;#Deltam^{VBF} [GeV]", 200, 0.0, 200.0, 1000, -100.0, 100.001);
      twoDHists[jetCollection]["vbfPTDiffVsVBFPT"] = new TH2D("vbfPTDiffVsVBFPT", ";p_{T, gen}^{VBF};#Deltap_{T}^{VBF} [GeV]", 1000, 0.0, 1000.0, 1000, -100.0, 100.001);
      twoDHists[jetCollection]["vbfMassDiffVsVBFMass"] = new TH2D("vbfMassDiffVsVBFMass", ";m_{gen}^{VBF};#Deltam^{VBF} [GeV]", 1000, 0.0, 1000.0, 1000, -100.0, 100.001);
      twoDHists[jetCollection]["vbfPTDiffVsVBFEta"] = new TH2D("vbfPTDiffVsVBFEta", ";#eta_{gen}^{VBF};#Deltap_{T}^{VBF} [GeV]", 1000, -5.0, 5.0, 1000, -100.0, 100.001);

      oneDHists[jetCollection]["vbfPTDiff"] = new TH1D("vbfPTDiff", ";#Deltap_{T}^{VBF} [GeV]", 100000, -1000.0, 1000.001);
      oneDHists[jetCollection]["vbfMassDiff"] = new TH1D("vbfMassDiff", ";#Deltam^{VBF} [GeV]", 100000, -1000.0, 1000.001);

      oneDHists[jetCollection]["jetEta"] = new TH1D("jetEta", ";jet #eta", 1000, -5.0, 5.0);
      oneDHists[jetCollection]["jetPT"] = new TH1D("jetPt", ";jet p_{T} [GeV]", 1000, 0.0, 1000.0);

      oneDHists[jetCollection]["betaCut_eta0To1p5"] = new TH1D("betaCut_eta0To1p5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCutMatched_eta0To1p5"] = new TH1D("betaCutMatched_eta0To1p5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCut_eta1p5To3"] = new TH1D("betaCut_eta1p5To3", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCutMatched_eta1p5To3"] = new TH1D("betaCutMatched_eta1p5To3", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCut_eta3ToTrackerEdge"] = new TH1D("betaCut_eta3ToTrackerEdge", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCutMatched_eta3ToTrackerEdge"] = new TH1D("betaCutMatched_eta3ToTrackerEdge", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCut_etaTrackerEdgeTo5"] = new TH1D("betaCut_etaTrackerEdgeTo5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["betaCutMatched_etaTrackerEdgeTo5"] = new TH1D("betaCutMatched_etaTrackerEdgeTo5", ";cut on #beta", 50, 0.0, 1.02);

      oneDHists[jetCollection]["msdrCut_eta0To1p5"] = new TH1D("msdrCut_eta0To1p5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCutMatched_eta0To1p5"] = new TH1D("msdrCutMatched_eta0To1p5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCut_eta1p5To3"] = new TH1D("msdrCut_eta1p5To3", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCutMatched_eta1p5To3"] = new TH1D("msdrCutMatched_eta1p5To3", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCut_eta3ToTrackerEdge"] = new TH1D("msdrCut_eta3ToTrackerEdge", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCutMatched_eta3ToTrackerEdge"] = new TH1D("msdrCutMatched_eta3ToTrackerEdge", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCut_etaTrackerEdgeTo5"] = new TH1D("msdrCut_etaTrackerEdgeTo5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["msdrCutMatched_etaTrackerEdgeTo5"] = new TH1D("msdrCutMatched_etaTrackerEdgeTo5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);

      oneDHists[jetCollection]["puBetaCut_eta0To1p5"] = new TH1D("puBetaCut_eta0To1p5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCutMatched_eta0To1p5"] = new TH1D("puBetaCutMatched_eta0To1p5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCut_eta1p5To3"] = new TH1D("puBetaCut_eta1p5To3", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCutMatched_eta1p5To3"] = new TH1D("puBetaCutMatched_eta1p5To3", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCut_eta3ToTrackerEdge"] = new TH1D("puBetaCut_eta3ToTrackerEdge", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCutMatched_eta3ToTrackerEdge"] = new TH1D("puBetaCutMatched_eta3ToTrackerEdge", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCut_etaTrackerEdgeTo5"] = new TH1D("puBetaCut_etaTrackerEdgeTo5", ";cut on #beta", 50, 0.0, 1.02);
      oneDHists[jetCollection]["puBetaCutMatched_etaTrackerEdgeTo5"] = new TH1D("puBetaCutMatched_etaTrackerEdgeTo5", ";cut on #beta", 50, 0.0, 1.02);

      oneDHists[jetCollection]["puMSDRCut_eta0To1p5"] = new TH1D("puMSDRCut_eta0To1p5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCutMatched_eta0To1p5"] = new TH1D("puMSDRCutMatched_eta0To1p5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCut_eta1p5To3"] = new TH1D("puMSDRCut_eta1p5To3", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCutMatched_eta1p5To3"] = new TH1D("puMSDRCutMatched_eta1p5To3", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCut_eta3ToTrackerEdge"] = new TH1D("puMSDRCut_eta3ToTrackerEdge", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCutMatched_eta3ToTrackerEdge"] = new TH1D("puMSDRCutMatched_eta3ToTrackerEdge", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCut_etaTrackerEdgeTo5"] = new TH1D("puMSDRCut_etaTrackerEdgeTo5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
      oneDHists[jetCollection]["puMSDRCutMatched_etaTrackerEdgeTo5"] = new TH1D("puMSDRCutMatched_etaTrackerEdgeTo5", ";cut on #LT#DeltaR^{2}#GT", 50, 0.0, 0.102);
    }

  // Launch threads, each runs the analyze function
  unsigned iEvent = 0;
  vector<char **> args;
  vector<TThread *> threads;
  stringstream ss;
  signal (SIGINT, signalHandler);
  for (iThread = 0; iThread < CPUS; iThread++)
    {
      args.push_back ((char **) calloc (4, sizeof (char *)));
      args.back ()[0] = (char *) &iEvent;
      args.back ()[1] = (char *) &oneDHists;
      args.back ()[2] = (char *) &twoDHists;
      args.back ()[3] = (char *) &threadFileList[iThread];
      ss.str ("");
      ss << iThread;
      threads.push_back (new TThread (("thread " + ss.str ()).c_str (), analyze, (void *) args.back ()));
      threads.back ()->Run ();
    }
  for (const auto &thread : threads)
    thread->Join ();

  // Write resulting histograms
  TFile *fout = TFile::Open (outputFile.c_str (), "recreate");
  fout->cd ();
  for (const auto &jetCollection : oneDHists)
    {
      fout->mkdir (jetCollection.first.c_str ());
      fout->cd (jetCollection.first.c_str ());
      for (unordered_map<string, TH1D *>::const_iterator oneDHist = jetCollection.second.begin (); oneDHist != jetCollection.second.end (); oneDHist++)
        oneDHist->second->Write ();
      fout->cd ("..");
    }
  for (const auto &jetCollection : twoDHists)
    {
      fout->cd (jetCollection.first.c_str ());
      for (unordered_map<string, TH2D *>::const_iterator twoDHist = jetCollection.second.begin (); twoDHist != jetCollection.second.end (); twoDHist++)
        twoDHist->second->Write ();
      fout->cd ("..");
    }
  fout->Close ();
}

void *
analyze (void *args)
{
  TThread::Lock ();
  string name = TThread::Self ()->GetName ();
  unsigned *iEvent = ((unsigned **) args)[0];
  unordered_map<string, unordered_map<string, TH1D *> > *oneDHists = ((unordered_map<string, unordered_map<string, TH1D *> > **) args)[1];
  unordered_map<string, unordered_map<string, TH2D *> > *twoDHists = ((unordered_map<string, unordered_map<string, TH2D *> > **) args)[2];
  vector<string> *threadFileList = ((vector<string> **) args)[3];

  vector<string> jetCollections;
  /*jetCollections.push_back ("UncorrectedJetNoCHS");
  jetCollections.push_back ("UncorrectedJetNoCHS_PUJetID");
  jetCollections.push_back ("UncorrectedJet");
  jetCollections.push_back ("JetNoCHS");
  jetCollections.push_back ("JetNoCHS_PUJetID");
  jetCollections.push_back ("Jet");*/
  jetCollections.push_back ("Jet_PUJetID");

  /*jetCollections.push_back ("UncorrectedPuppiJet");
  jetCollections.push_back ("UncorrectedPuppiJet_PUJetID");
  jetCollections.push_back ("PuppiJet");
  jetCollections.push_back ("PuppiJet_PUJetID");*/

  TLorentzVector p0, p1, vbfQuarks[2];
  double vbfPT0 = numeric_limits<int>::min (),
         vbfPT1 = numeric_limits<int>::min (),
         vbfMass = numeric_limits<int>::min (),
         vbfEta0 = numeric_limits<int>::min (),
         vbfEta1 = numeric_limits<int>::min ();

  //Create chain of root trees
  TChain chain("Delphes");
  for (const auto &file : (*threadFileList))
    chain.Add (file.c_str ());

  // Create object of class ExRootTreeReader
  ExRootTreeReader *treeReader = new ExRootTreeReader(&chain);
  Long64_t numberOfEntries = treeReader->GetEntries();
  cout << name << ": processing " << numberOfEntries << " events..." << endl << endl;

  // Get pointers to branches used in this analysis
  TClonesArray *branchVBFquarks = treeReader->UseBranch("VBFquarks");
  TClonesArray *branchCluster = treeReader->UseBranch("Cluster");
  TClonesArray *branchRho = treeReader->UseBranch("Rho");
  TClonesArray *branchNPU = treeReader->UseBranch("NPU");
  TClonesArray *branchGenJet = treeReader->UseBranch("GenJet");
  unordered_map<string, TClonesArray *> branchJet;
  for (const auto &jetCollection : jetCollections)
    {
      string name = jetCollection;
      if (name.find ("PUJetID") != string::npos)
        name = name.substr (0, name.length () - 8);
      branchJet[jetCollection] = treeReader->UseBranch (name.c_str ());
    }
  TThread::UnLock ();

  // Loop over all events
  for(Int_t entry = 0; entry < numberOfEntries && !interrupted; ++entry)
    {
      // Load selected branches with data from specified event
      TThread::Lock ();
      if (!(*iEvent % REPORT_EVERY))
        cout << name << ": processing event " << (*iEvent + 1) << "..." << endl;
      treeReader->ReadEntry(entry);
      treeReader->ReadEntry(entry);
      unsigned nRho = branchRho->GetEntries (),
               nCluster = branchCluster->GetEntries ();
      unsigned nInteractions = (unsigned) ((ScalarHT *) branchNPU->At (0))->HT + 1;
      Cluster *pv = (Cluster *) branchCluster->At (0);
      TThread::UnLock ();

      if (!nCluster)
        continue;

      //////////////////////////////////////////////////////////////////////////
      // Get limit of tracker acceptance
      //////////////////////////////////////////////////////////////////////////

      double trackerAcceptance = 0.0;
      for (unsigned iRho = 0; iRho < nRho; iRho++)
        {
          Rho *rho = (Rho *) branchRho->At (iRho);
          if (rho->Edges[0] > trackerAcceptance)
            trackerAcceptance = rho->Edges[0];
        }
      //////////////////////////////////////////////////////////////////////////

      //////////////////////////////////////////////////////////////////////////
      // Get VBF quark momentum four-vectors
      //////////////////////////////////////////////////////////////////////////

      GenParticle *quark0 = NULL,
                  *quark1 = NULL;
      if (branchVBFquarks->GetEntries ())
        {
          quark0 = (GenParticle *) branchVBFquarks->At (0);
          quark1 = (GenParticle *) branchVBFquarks->At (1);
          vbfQuarks[0].SetPxPyPzE (quark0->Px, quark0->Py, quark0->Pz, quark0->E);
          vbfQuarks[1].SetPxPyPzE (quark1->Px, quark1->Py, quark1->Pz, quark1->E);

          vbfPT0 = quark0->PT;
          vbfPT1 = quark1->PT;
          vbfMass = (vbfQuarks[0] + vbfQuarks[1]).M ();
          vbfEta0 = quark0->Eta;
          vbfEta1 = quark1->Eta;
        }
      //////////////////////////////////////////////////////////////////////////

      //////////////////////////////////////////////////////////////////////////
      // Selection of VBF jets
      //////////////////////////////////////////////////////////////////////////
      unordered_map<string, pair<Jet *, Jet *> > vbfJets;
      vector<pair<double, pair<Jet *, Jet *> > > vbfJetCandidates;
      pair<double, double> vbfJetDeltaR;
      for (const auto &jetCollection : jetCollections)
        {
          vbfJets[jetCollection] = make_pair ((Jet *) NULL, (Jet *) NULL);
          vbfJetCandidates.clear ();
          vbfJetDeltaR = make_pair (-1.0, -1.0);
          for (int iJet0 = 0; iJet0 < branchJet.at (jetCollection)->GetEntries (); iJet0++)
            {
              Jet *jet0 = (Jet *) branchJet.at (jetCollection)->At (iJet0);
              if (jet0->PT < 30.0)
                continue;
              if (fabs (jet0->Eta) > 5.0)
                continue;
              if (!passesPUJetID (jet0, trackerAcceptance, jetCollection))
                continue;
              p0.SetPtEtaPhiM (jet0->PT, jet0->Eta, jet0->Phi, jet0->Mass);
              for (int iJet1 = iJet0 + 1; iJet1 < branchJet.at (jetCollection)->GetEntries (); iJet1++)
                {
                  Jet *jet1 = (Jet *) branchJet.at (jetCollection)->At (iJet1);
                  if (jet1->PT < 30.0)
                    continue;
                  if (fabs (jet1->Eta) > 5.0)
                    continue;
                  if (!passesPUJetID (jet1, trackerAcceptance, jetCollection))
                    continue;
                  p1.SetPtEtaPhiM (jet1->PT, jet1->Eta, jet1->Phi, jet1->Mass);

                  if ((p0 + p1).M () < 500.0)
                    continue;
                  if (p0.Eta () * p1.Eta () > 0)
                    continue;
                  if (fabs (p0.Eta () - p1.Eta ()) < 3.0)
                    continue;
                  if (p0.DeltaPhi (p1) > 1.0)
                    continue;

                  vbfJetCandidates.push_back (make_pair (max (jet0->PT, jet1->PT), make_pair (jet0, jet1)));
                }
            }
          sort (vbfJetCandidates.begin (), vbfJetCandidates.end (), ptDescending);
          if (vbfJetCandidates.size ())
            vbfJets.at (jetCollection) = vbfJetCandidates.at (0).second;
        }
      //////////////////////////////////////////////////////////////////////////

      //////////////////////////////////////////////////////////////////////////
      // Collection of general jet information
      //////////////////////////////////////////////////////////////////////////
      unordered_map<string, vector<double> > jetEta, jetPT;
      for (const auto &jetCollection : jetCollections)
        {
          jetEta[jetCollection] = vector<double> ();
          jetPT[jetCollection] = vector<double> ();
          for (int iJet = 0; iJet < branchJet.at (jetCollection)->GetEntries (); iJet++)
            {
              Jet *jet = (Jet *) branchJet.at (jetCollection)->At (iJet);
              if (!passesPUJetID (jet, trackerAcceptance, jetCollection))
                continue;
              if (fabs (jet->Eta) > 5.0)
                continue;
              if (jet->PT < 30.0)
                continue;

              jetEta.at (jetCollection).push_back (jet->Eta);
              jetPT.at (jetCollection).push_back (jet->PT);
            }
        }
      //////////////////////////////////////////////////////////////////////////

      //////////////////////////////////////////////////////////////////////////
      // Selection of PU jets
      //////////////////////////////////////////////////////////////////////////
      unordered_map<string, unordered_map<unsigned, unordered_map<string, unordered_set<Jet *> > > > vbfPUJets_betaCuts, puJets_betaCuts, matchedJets_betaCuts, matchedGenJets_betaCuts, jets_betaCuts, genJets_betaCuts;
      unordered_map<string, unordered_map<unsigned, unordered_map<string, unordered_set<Jet *> > > > vbfPUJets_msdrCuts, puJets_msdrCuts, matchedJets_msdrCuts, matchedGenJets_msdrCuts, jets_msdrCuts, genJets_msdrCuts;
      for (const auto &jetCollection : jetCollections)
        {
          TAxis *betaCuts = oneDHists->at (jetCollection).at ("betaCut_eta0To1p5")->GetXaxis (),
                *msdrCuts = oneDHists->at (jetCollection).at ("msdrCut_eta0To1p5")->GetXaxis ();
          for (int bin = 1; bin <= betaCuts->GetNbins (); bin++)
            {
              double betaCut = betaCuts->GetBinLowEdge (bin);
              unsigned index = (unsigned) (betaCut * 1000000.0 + 1.0);

              vbfPUJets_betaCuts["0To1p5"];
              puJets_betaCuts["0To1p5"];
              matchedJets_betaCuts["0To1p5"];
              matchedGenJets_betaCuts["0To1p5"];
              jets_betaCuts["0To1p5"];
              genJets_betaCuts["0To1p5"];

              vbfPUJets_betaCuts["1p5To3"];
              puJets_betaCuts["1p5To3"];
              matchedJets_betaCuts["1p5To3"];
              matchedGenJets_betaCuts["1p5To3"];
              jets_betaCuts["1p5To3"];
              genJets_betaCuts["1p5To3"];

              vbfPUJets_betaCuts["3ToTrackerEdge"];
              puJets_betaCuts["3ToTrackerEdge"];
              matchedJets_betaCuts["3ToTrackerEdge"];
              matchedGenJets_betaCuts["3ToTrackerEdge"];
              jets_betaCuts["3ToTrackerEdge"];
              genJets_betaCuts["3ToTrackerEdge"];

              vbfPUJets_betaCuts["TrackerEdgeTo5"];
              puJets_betaCuts["TrackerEdgeTo5"];
              matchedJets_betaCuts["TrackerEdgeTo5"];
              matchedGenJets_betaCuts["TrackerEdgeTo5"];
              jets_betaCuts["TrackerEdgeTo5"];
              genJets_betaCuts["TrackerEdgeTo5"];

              vbfPUJets_betaCuts["0To1p5"][index];
              puJets_betaCuts["0To1p5"][index];
              matchedJets_betaCuts["0To1p5"][index];
              matchedGenJets_betaCuts["0To1p5"][index];
              jets_betaCuts["0To1p5"][index];
              genJets_betaCuts["0To1p5"][index];

              vbfPUJets_betaCuts["1p5To3"][index];
              puJets_betaCuts["1p5To3"][index];
              matchedJets_betaCuts["1p5To3"][index];
              matchedGenJets_betaCuts["1p5To3"][index];
              jets_betaCuts["1p5To3"][index];
              genJets_betaCuts["1p5To3"][index];

              vbfPUJets_betaCuts["3ToTrackerEdge"][index];
              puJets_betaCuts["3ToTrackerEdge"][index];
              matchedJets_betaCuts["3ToTrackerEdge"][index];
              matchedGenJets_betaCuts["3ToTrackerEdge"][index];
              jets_betaCuts["3ToTrackerEdge"][index];
              genJets_betaCuts["3ToTrackerEdge"][index];

              vbfPUJets_betaCuts["TrackerEdgeTo5"][index];
              puJets_betaCuts["TrackerEdgeTo5"][index];
              matchedJets_betaCuts["TrackerEdgeTo5"][index];
              matchedGenJets_betaCuts["TrackerEdgeTo5"][index];
              jets_betaCuts["TrackerEdgeTo5"][index];
              genJets_betaCuts["TrackerEdgeTo5"][index];

              vbfPUJets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              jets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_betaCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              jets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_betaCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              jets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_betaCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              jets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_betaCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();

              for (int iJet = 0; iJet < branchJet.at (jetCollection)->GetEntries (); iJet++)
                {
                  Jet *jet = (Jet *) branchJet.at (jetCollection)->At (iJet);
                  if (!passesPUJetID (jet, trackerAcceptance, jetCollection, betaCut, -1.0, true, false))
                    continue;
                  if (fabs (jet->Eta) > 5.0)
                    continue;
                  if (jet->PT < 30.0)
                    continue;
                  p0.SetPtEtaPhiM (jet->PT, jet->Eta, jet->Phi, jet->Mass);
                  jets_betaCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);

                  double deltaR0, deltaR1;
                  if (quark0 && quark1)
                    {
                      deltaR0 = p0.DeltaR (vbfQuarks[0]);
                      deltaR1 = p0.DeltaR (vbfQuarks[1]);
                      if (deltaR0 > 1.0 && deltaR1 > 1.0)
                        vbfPUJets_betaCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                    }

                  bool isMatched = false, isPU = true;
                  for (int iGenJet = 0; iGenJet < branchGenJet->GetEntries (); iGenJet++)
                    {
                      Jet *genJet = (Jet *) branchGenJet->At (iGenJet);
                      if (fabs (genJet->Eta) > 5.0)
                        continue;
                      if (genJet->PT < 30.0)
                        continue;
                      p1.SetPtEtaPhiM (genJet->PT, genJet->Eta, genJet->Phi, genJet->Mass);

                      isMatched = isMatched || (p1.DeltaR (p0) < 0.1);
                      isPU = isPU && (p1.DeltaR (p0) > 1.0);

                      if (p1.DeltaR (p0) < 0.1)
                        matchedGenJets_betaCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (genJet);
                    }
                  if (isMatched)
                    matchedJets_betaCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                  if (isPU)
                    puJets_betaCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                }
              for (int iGenJet = 0; iGenJet < branchGenJet->GetEntries (); iGenJet++)
                {
                  Jet *genJet = (Jet *) branchGenJet->At (iGenJet);
                  if (fabs (genJet->Eta) > 5.0)
                    continue;
                  if (genJet->PT < 30.0)
                    continue;
                  genJets_betaCuts.at (getEtaRange (genJet, trackerAcceptance)).at (index).at (jetCollection).insert (genJet);
                }
            }
          for (int bin = 1; bin <= msdrCuts->GetNbins (); bin++)
            {
              double msdrCut = msdrCuts->GetBinLowEdge (bin);
              unsigned index = (unsigned) (msdrCut * 1000000.0 + 1.0);

              vbfPUJets_msdrCuts["0To1p5"];
              puJets_msdrCuts["0To1p5"];
              matchedJets_msdrCuts["0To1p5"];
              matchedGenJets_msdrCuts["0To1p5"];
              jets_msdrCuts["0To1p5"];
              genJets_msdrCuts["0To1p5"];

              vbfPUJets_msdrCuts["1p5To3"];
              puJets_msdrCuts["1p5To3"];
              matchedJets_msdrCuts["1p5To3"];
              matchedGenJets_msdrCuts["1p5To3"];
              jets_msdrCuts["1p5To3"];
              genJets_msdrCuts["1p5To3"];

              vbfPUJets_msdrCuts["3ToTrackerEdge"];
              puJets_msdrCuts["3ToTrackerEdge"];
              matchedJets_msdrCuts["3ToTrackerEdge"];
              matchedGenJets_msdrCuts["3ToTrackerEdge"];
              jets_msdrCuts["3ToTrackerEdge"];
              genJets_msdrCuts["3ToTrackerEdge"];

              vbfPUJets_msdrCuts["TrackerEdgeTo5"];
              puJets_msdrCuts["TrackerEdgeTo5"];
              matchedJets_msdrCuts["TrackerEdgeTo5"];
              matchedGenJets_msdrCuts["TrackerEdgeTo5"];
              jets_msdrCuts["TrackerEdgeTo5"];
              genJets_msdrCuts["TrackerEdgeTo5"];

              vbfPUJets_msdrCuts["0To1p5"][index];
              puJets_msdrCuts["0To1p5"][index];
              matchedJets_msdrCuts["0To1p5"][index];
              matchedGenJets_msdrCuts["0To1p5"][index];
              jets_msdrCuts["0To1p5"][index];
              genJets_msdrCuts["0To1p5"][index];

              vbfPUJets_msdrCuts["1p5To3"][index];
              puJets_msdrCuts["1p5To3"][index];
              matchedJets_msdrCuts["1p5To3"][index];
              matchedGenJets_msdrCuts["1p5To3"][index];
              jets_msdrCuts["1p5To3"][index];
              genJets_msdrCuts["1p5To3"][index];

              vbfPUJets_msdrCuts["3ToTrackerEdge"][index];
              puJets_msdrCuts["3ToTrackerEdge"][index];
              matchedJets_msdrCuts["3ToTrackerEdge"][index];
              matchedGenJets_msdrCuts["3ToTrackerEdge"][index];
              jets_msdrCuts["3ToTrackerEdge"][index];
              genJets_msdrCuts["3ToTrackerEdge"][index];

              vbfPUJets_msdrCuts["TrackerEdgeTo5"][index];
              puJets_msdrCuts["TrackerEdgeTo5"][index];
              matchedJets_msdrCuts["TrackerEdgeTo5"][index];
              matchedGenJets_msdrCuts["TrackerEdgeTo5"][index];
              jets_msdrCuts["TrackerEdgeTo5"][index];
              genJets_msdrCuts["TrackerEdgeTo5"][index];

              vbfPUJets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              jets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_msdrCuts["0To1p5"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              jets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_msdrCuts["1p5To3"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              jets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_msdrCuts["3ToTrackerEdge"][index][jetCollection] = unordered_set<Jet *> ();

              vbfPUJets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              puJets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedJets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              matchedGenJets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              jets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();
              genJets_msdrCuts["TrackerEdgeTo5"][index][jetCollection] = unordered_set<Jet *> ();

              for (int iJet = 0; iJet < branchJet.at (jetCollection)->GetEntries (); iJet++)
                {
                  Jet *jet = (Jet *) branchJet.at (jetCollection)->At (iJet);
                  if (!passesPUJetID (jet, trackerAcceptance, jetCollection, -1.0, msdrCut, false, true))
                    continue;
                  if (fabs (jet->Eta) > 5.0)
                    continue;
                  if (jet->PT < 30.0)
                    continue;
                  p0.SetPtEtaPhiM (jet->PT, jet->Eta, jet->Phi, jet->Mass);
                  jets_msdrCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);

                  double deltaR0, deltaR1;
                  if (quark0 && quark1)
                    {
                      deltaR0 = p0.DeltaR (vbfQuarks[0]);
                      deltaR1 = p0.DeltaR (vbfQuarks[1]);
                      if (deltaR0 > 1.0 && deltaR1 > 1.0)
                        vbfPUJets_msdrCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                    }

                  bool isMatched = false, isPU = true;
                  for (int iGenJet = 0; iGenJet < branchGenJet->GetEntries (); iGenJet++)
                    {
                      Jet *genJet = (Jet *) branchGenJet->At (iGenJet);
                      if (fabs (genJet->Eta) > 5.0)
                        continue;
                      if (genJet->PT < 30.0)
                        continue;
                      p1.SetPtEtaPhiM (genJet->PT, genJet->Eta, genJet->Phi, genJet->Mass);

                      isMatched = isMatched || (p1.DeltaR (p0) < 0.1);
                      isPU = isPU && (p1.DeltaR (p0) > 1.0);

                      if (p1.DeltaR (p0) < 0.1)
                        matchedGenJets_msdrCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (genJet);
                    }
                  if (isMatched)
                    matchedJets_msdrCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                  if (isPU)
                    puJets_msdrCuts.at (getEtaRange (jet, trackerAcceptance)).at (index).at (jetCollection).insert (jet);
                }
              for (int iGenJet = 0; iGenJet < branchGenJet->GetEntries (); iGenJet++)
                {
                  Jet *genJet = (Jet *) branchGenJet->At (iGenJet);
                  if (fabs (genJet->Eta) > 5.0)
                    continue;
                  if (genJet->PT < 30.0)
                    continue;
                  genJets_msdrCuts.at (getEtaRange (genJet, trackerAcceptance)).at (index).at (jetCollection).insert (genJet);
                }
            }
        }
      //////////////////////////////////////////////////////////////////////////

      TThread::Lock ();
      oneDHists->at ("/").at ("nInteractions")->Fill (nInteractions);
      oneDHists->at ("/").at ("nInteractions")->Fill (nInteractions);
      twoDHists->at ("/").at ("nClustersVsNInteractions")->Fill (nInteractions, nCluster);
      if (quark0 && quark1)
        {
          oneDHists->at ("/").at ("vbfEta")->Fill (fabs (vbfEta0));
          oneDHists->at ("/").at ("vbfEta")->Fill (fabs (vbfEta1));
        }
      for (const auto &jetCollection : jetCollections)
        {
          if (vbfJets.at (jetCollection).first && vbfJets.at (jetCollection).second)
            {
              p0.SetPtEtaPhiM (vbfJets.at (jetCollection).first->PT, vbfJets.at (jetCollection).first->Eta, vbfJets.at (jetCollection).first->Phi, vbfJets.at (jetCollection).first->Mass);
              p1.SetPtEtaPhiM (vbfJets.at (jetCollection).second->PT, vbfJets.at (jetCollection).second->Eta, vbfJets.at (jetCollection).second->Phi, vbfJets.at (jetCollection).second->Mass);

              double deltaR00, deltaR01, deltaR10, deltaR11;
              double vbfPTDiff0, vbfPTDiff1, vbfMassDiff;
              if (quark0 && quark1)
                {
                  deltaR00 = p0.DeltaR (vbfQuarks[0]);
                  deltaR01 = p0.DeltaR (vbfQuarks[1]);
                  deltaR10 = p1.DeltaR (vbfQuarks[0]);
                  deltaR11 = p1.DeltaR (vbfQuarks[1]);

                  vbfPTDiff0 = vbfJets.at (jetCollection).first->PT - vbfPT0;
                  vbfPTDiff1 = vbfJets.at (jetCollection).second->PT - vbfPT1;
                  vbfMassDiff = (p0 + p1).M () - vbfMass;

                  oneDHists->at (jetCollection).at ("vbfJetsFound_VBFEta")->Fill (fabs (vbfEta0));
                  oneDHists->at (jetCollection).at ("vbfJetsFound_VBFEta")->Fill (fabs (vbfEta1));

                  twoDHists->at (jetCollection).at ("vbfPTDiffVsNInteractions")->Fill (nInteractions, vbfPTDiff0);
                  twoDHists->at (jetCollection).at ("vbfPTDiffVsVBFPT")->Fill (vbfPT0, vbfPTDiff0);
                  twoDHists->at (jetCollection).at ("vbfPTDiffVsVBFEta")->Fill (vbfEta0, vbfPTDiff0);
                  oneDHists->at (jetCollection).at ("vbfPTDiff")->Fill (vbfPTDiff0);

                  twoDHists->at (jetCollection).at ("vbfPTDiffVsNInteractions")->Fill (nInteractions, vbfPTDiff1);
                  twoDHists->at (jetCollection).at ("vbfPTDiffVsVBFPT")->Fill (vbfPT1, vbfPTDiff1);
                  twoDHists->at (jetCollection).at ("vbfPTDiffVsVBFEta")->Fill (vbfEta1, vbfPTDiff1);
                  oneDHists->at (jetCollection).at ("vbfPTDiff")->Fill (vbfPTDiff1);

                  twoDHists->at (jetCollection).at ("vbfMassDiffVsNInteractions")->Fill (nInteractions, vbfMassDiff);
                  twoDHists->at (jetCollection).at ("vbfMassDiffVsVBFMass")->Fill (vbfMass, vbfMassDiff);
                  oneDHists->at (jetCollection).at ("vbfMassDiff")->Fill (vbfMassDiff);

                  if (deltaR00 < 0.1 || deltaR10 < 0.1)
                    {
                      oneDHists->at (jetCollection).at ("vbfJetsMatched")->Fill (nInteractions);
                      oneDHists->at (jetCollection).at ("vbfJetsMatched_VBFEta")->Fill (fabs (vbfEta0));
                    }
                  if (deltaR01 < 0.1 || deltaR11 < 0.1)
                    {
                      oneDHists->at (jetCollection).at ("vbfJetsMatched")->Fill (nInteractions);
                      oneDHists->at (jetCollection).at ("vbfJetsMatched_VBFEta")->Fill (fabs (vbfEta1));
                    }
                }

              oneDHists->at (jetCollection).at ("vbfJetsFound")->Fill (nInteractions);
              oneDHists->at (jetCollection).at ("vbfJetsFound")->Fill (nInteractions);
            }
          for (const auto &eta : jetEta.at (jetCollection))
            oneDHists->at (jetCollection).at ("jetEta")->Fill (eta);
          for (const auto &pt : jetPT.at (jetCollection))
            oneDHists->at (jetCollection).at ("jetPT")->Fill (pt);

          for (const auto &etaRange : vbfPUJets_betaCuts)
            {
              for (const auto &index : etaRange.second)
                {
                  double betaCut = index.first / 1000000.0;

                  unsigned nPUJets = puJets_betaCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nMatchedGenJets = matchedGenJets_betaCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nJets = jets_betaCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nGenJets = genJets_betaCuts.at (etaRange.first).at (index.first).at (jetCollection).size ();

                  oneDHists->at (jetCollection).at ("betaCut_eta" + etaRange.first)->Fill (betaCut, nGenJets);
                  oneDHists->at (jetCollection).at ("betaCutMatched_eta" + etaRange.first)->Fill (betaCut, nMatchedGenJets);
                  oneDHists->at (jetCollection).at ("puBetaCut_eta" + etaRange.first)->Fill (betaCut, nJets);
                  oneDHists->at (jetCollection).at ("puBetaCutMatched_eta" + etaRange.first)->Fill (betaCut, nPUJets);
                }
            }
          for (const auto &etaRange : vbfPUJets_msdrCuts)
            {
              for (const auto &index : etaRange.second)
                {
                  double msdrCut = index.first / 1000000.0;

                  unsigned nPUJets = puJets_msdrCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nMatchedGenJets = matchedGenJets_msdrCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nJets = jets_msdrCuts.at (etaRange.first).at (index.first).at (jetCollection).size (),
                           nGenJets = genJets_msdrCuts.at (etaRange.first).at (index.first).at (jetCollection).size ();

                  oneDHists->at (jetCollection).at ("msdrCut_eta" + etaRange.first)->Fill (msdrCut, nGenJets);
                  oneDHists->at (jetCollection).at ("msdrCutMatched_eta" + etaRange.first)->Fill (msdrCut, nMatchedGenJets);
                  oneDHists->at (jetCollection).at ("puMSDRCut_eta" + etaRange.first)->Fill (msdrCut, nJets);
                  oneDHists->at (jetCollection).at ("puMSDRCutMatched_eta" + etaRange.first)->Fill (msdrCut, nPUJets);
                }
            }
        }

//      double trackEfficiency = pv->VFTracksFromVBFFromCluster / ((double) (pv->VFTracksFromVBFFromCluster + pv->VFTracksFromVBFNotFromCluster)), FIXME
//             trackPurity = pv->VFTracksFromVBFFromCluster / ((double) (pv->VFTracksFromVBFFromCluster + pv->VFTracksFromPUFromCluster)), FIXME
//             ptEfficiency = pv->VFPTFromVBFFromCluster / ((double) (pv->VFPTFromVBFFromCluster + pv->VFPTFromVBFNotFromCluster)), FIXME
//             ptPurity = pv->VFPTFromVBFFromCluster / ((double) (pv->VFPTFromVBFFromCluster + pv->VFPTFromPUFromCluster)); FIXME
//      double recoTrackEfficiency = pv->RecoVFTracksFromVBFFromCluster / ((double) (pv->RecoVFTracksFromVBFFromCluster + pv->RecoVFTracksFromVBFNotFromCluster)), FIXME
//             recoTrackPurity = pv->RecoVFTracksFromVBFFromCluster / ((double) (pv->RecoVFTracksFromVBFFromCluster + pv->RecoVFTracksFromPUFromCluster)), FIXME
//             recoPTEfficiency = pv->RecoVFPTFromVBFFromCluster / ((double) (pv->RecoVFPTFromVBFFromCluster + pv->RecoVFPTFromVBFNotFromCluster)), FIXME
//             recoPTPurity = pv->RecoVFPTFromVBFFromCluster / ((double) (pv->RecoVFPTFromVBFFromCluster + pv->RecoVFPTFromPUFromCluster)); FIXME
//      double originalTrackEfficiency = pv->VFTracksFromVBFFromCluster / ((double) (pv->OriginalVFTracksFromVBFFromCluster + pv->OriginalVFTracksFromVBFNotFromCluster)), FIXME
//             originalTrackPurity = pv->VFTracksFromVBFFromCluster / ((double) (pv->OriginalVFTracksFromVBFFromCluster + pv->OriginalVFTracksFromPUFromCluster)), FIXME
//             originalPTEfficiency = pv->VFTruePTFromVBFFromCluster / ((double) (pv->OriginalVFPTFromVBFFromCluster + pv->OriginalVFPTFromVBFNotFromCluster)), FIXME
//             originalPTPurity = pv->VFTruePTFromVBFFromCluster / ((double) (pv->OriginalVFPTFromVBFFromCluster + pv->OriginalVFPTFromPUFromCluster)); FIXME
//      double originalRecoTrackEfficiency = pv->RecoVFTracksFromVBFFromCluster / ((double) (pv->OriginalRecoVFTracksFromVBFFromCluster + pv->OriginalRecoVFTracksFromVBFNotFromCluster)), FIXME
//             originalRecoTrackPurity = pv->RecoVFTracksFromVBFFromCluster / ((double) (pv->OriginalRecoVFTracksFromVBFFromCluster + pv->OriginalRecoVFTracksFromPUFromCluster)), FIXME
//             originalRecoPTEfficiency = pv->RecoVFTruePTFromVBFFromCluster / ((double) (pv->OriginalRecoVFPTFromVBFFromCluster + pv->OriginalRecoVFPTFromVBFNotFromCluster)), FIXME
//             originalRecoPTPurity = pv->RecoVFTruePTFromVBFFromCluster / ((double) (pv->OriginalRecoVFPTFromVBFFromCluster + pv->OriginalRecoVFPTFromPUFromCluster)); FIXME
// FIXME
//      oneDHists->at ("/").at ("pvTrackEfficiency")->Fill (trackEfficiency); FIXME
//      oneDHists->at ("/").at ("pvTrackPurity")->Fill (trackPurity); FIXME
//      oneDHists->at ("/").at ("pvTrackFakeRate")->Fill (1.0 - trackPurity); FIXME
//      twoDHists->at ("/").at ("pvTrackEfficiencyVsNInteractions")->Fill (nInteractions, trackEfficiency); FIXME
//      twoDHists->at ("/").at ("pvTrackPurityVsNInteractions")->Fill (nInteractions, trackPurity); FIXME
//      twoDHists->at ("/").at ("pvTrackFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - trackPurity); FIXME
//      twoDHists->at ("/").at ("pvTrackPurityVsPVTrackEfficiency")->Fill (trackEfficiency, trackPurity); FIXME
//      twoDHists->at ("/").at ("pvTrackFakeRateVsPVTrackEfficiency")->Fill (trackEfficiency, 1.0 - trackPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("pvPTEfficiency")->Fill (ptEfficiency); FIXME
//      oneDHists->at ("/").at ("pvPTPurity")->Fill (ptPurity); FIXME
//      oneDHists->at ("/").at ("pvPTFakeRate")->Fill (1.0 - ptPurity); FIXME
//      twoDHists->at ("/").at ("pvPTEfficiencyVsNInteractions")->Fill (nInteractions, ptEfficiency); FIXME
//      twoDHists->at ("/").at ("pvPTPurityVsNInteractions")->Fill (nInteractions, ptPurity); FIXME
//      twoDHists->at ("/").at ("pvPTFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - ptPurity); FIXME
//      twoDHists->at ("/").at ("pvPTPurityVsPVPTEfficiency")->Fill (ptEfficiency, ptPurity); FIXME
//      twoDHists->at ("/").at ("pvPTFakeRateVsPVPTEfficiency")->Fill (ptEfficiency, 1.0 - ptPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("pvRecoTrackEfficiency")->Fill (recoTrackEfficiency); FIXME
//      oneDHists->at ("/").at ("pvRecoTrackPurity")->Fill (recoTrackPurity); FIXME
//      oneDHists->at ("/").at ("pvRecoTrackFakeRate")->Fill (1.0 - recoTrackPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoTrackEfficiencyVsNInteractions")->Fill (nInteractions, recoTrackEfficiency); FIXME
//      twoDHists->at ("/").at ("pvRecoTrackPurityVsNInteractions")->Fill (nInteractions, recoTrackPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoTrackFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - recoTrackPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoTrackPurityVsPVRecoTrackEfficiency")->Fill (recoTrackEfficiency, recoTrackPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoTrackFakeRateVsPVRecoTrackEfficiency")->Fill (recoTrackEfficiency, 1.0 - recoTrackPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("pvRecoPTEfficiency")->Fill (recoPTEfficiency); FIXME
//      oneDHists->at ("/").at ("pvRecoPTPurity")->Fill (recoPTPurity); FIXME
//      oneDHists->at ("/").at ("pvRecoPTFakeRate")->Fill (1.0 - recoPTPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoPTEfficiencyVsNInteractions")->Fill (nInteractions, recoPTEfficiency); FIXME
//      twoDHists->at ("/").at ("pvRecoPTPurityVsNInteractions")->Fill (nInteractions, recoPTPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoPTFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - recoPTPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoPTPurityVsPVRecoPTEfficiency")->Fill (recoPTEfficiency, recoPTPurity); FIXME
//      twoDHists->at ("/").at ("pvRecoPTFakeRateVsPVRecoPTEfficiency")->Fill (recoPTEfficiency, 1.0 - recoPTPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("originalPVTrackEfficiency")->Fill (originalTrackEfficiency); FIXME
//      oneDHists->at ("/").at ("originalPVTrackPurity")->Fill (originalTrackPurity); FIXME
//      oneDHists->at ("/").at ("originalPVTrackFakeRate")->Fill (1.0 - originalTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVTrackEfficiencyVsNInteractions")->Fill (nInteractions, originalTrackEfficiency); FIXME
//      twoDHists->at ("/").at ("originalPVTrackPurityVsNInteractions")->Fill (nInteractions, originalTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVTrackFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - originalTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVTrackPurityVsPVTrackEfficiency")->Fill (originalTrackEfficiency, originalTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVTrackFakeRateVsPVTrackEfficiency")->Fill (originalTrackEfficiency, 1.0 - originalTrackPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("originalPVPTEfficiency")->Fill (originalPTEfficiency); FIXME
//      oneDHists->at ("/").at ("originalPVPTPurity")->Fill (originalPTPurity); FIXME
//      oneDHists->at ("/").at ("originalPVPTFakeRate")->Fill (1.0 - originalPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVPTEfficiencyVsNInteractions")->Fill (nInteractions, originalPTEfficiency); FIXME
//      twoDHists->at ("/").at ("originalPVPTPurityVsNInteractions")->Fill (nInteractions, originalPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVPTFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - originalPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVPTPurityVsPVPTEfficiency")->Fill (originalPTEfficiency, originalPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVPTFakeRateVsPVPTEfficiency")->Fill (originalPTEfficiency, 1.0 - originalPTPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("originalPVRecoTrackEfficiency")->Fill (originalRecoTrackEfficiency); FIXME
//      oneDHists->at ("/").at ("originalPVRecoTrackPurity")->Fill (originalRecoTrackPurity); FIXME
//      oneDHists->at ("/").at ("originalPVRecoTrackFakeRate")->Fill (1.0 - originalRecoTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoTrackEfficiencyVsNInteractions")->Fill (nInteractions, originalRecoTrackEfficiency); FIXME
//      twoDHists->at ("/").at ("originalPVRecoTrackPurityVsNInteractions")->Fill (nInteractions, originalRecoTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoTrackFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - originalRecoTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoTrackPurityVsPVRecoTrackEfficiency")->Fill (originalRecoTrackEfficiency, originalRecoTrackPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoTrackFakeRateVsPVRecoTrackEfficiency")->Fill (originalRecoTrackEfficiency, 1.0 - originalRecoTrackPurity); FIXME
// FIXME
//      oneDHists->at ("/").at ("originalPVRecoPTEfficiency")->Fill (originalRecoPTEfficiency); FIXME
//      oneDHists->at ("/").at ("originalPVRecoPTPurity")->Fill (originalRecoPTPurity); FIXME
//      oneDHists->at ("/").at ("originalPVRecoPTFakeRate")->Fill (1.0 - originalRecoPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoPTEfficiencyVsNInteractions")->Fill (nInteractions, originalRecoPTEfficiency); FIXME
//      twoDHists->at ("/").at ("originalPVRecoPTPurityVsNInteractions")->Fill (nInteractions, originalRecoPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoPTFakeRateVsNInteractions")->Fill (nInteractions, 1.0 - originalRecoPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoPTPurityVsPVRecoPTEfficiency")->Fill (originalRecoPTEfficiency, originalRecoPTPurity); FIXME
//      twoDHists->at ("/").at ("originalPVRecoPTFakeRateVsPVRecoPTEfficiency")->Fill (originalRecoPTEfficiency, 1.0 - originalRecoPTPurity); FIXME

      (*iEvent)++;
      TThread::UnLock ();
    }

  return NULL;
}

bool
passesPUJetID (const Jet *jet, const double trackerAcceptance, const string jetCollection, double betaCut, double msdrCut, bool applyBeta, bool applyMSDR)
{
  bool pass = false;

  if (jetCollection.find ("PUJetID") != string::npos)
    {
      if (fabs (jet->Eta) < 1.5)
        {
          (betaCut < 0.0) && (betaCut = 0.13);
          (msdrCut < 0.0) && (msdrCut = 0.07);
        }
      else if (fabs (jet->Eta) < trackerAcceptance)
        {
          (betaCut < 0.0) && (betaCut = 0.15);
          (msdrCut < 0.0) && (msdrCut = 0.07);
        }
      else if (fabs (jet->Eta) < 5.0)
        {
          (betaCut < 0.0) && (betaCut = numeric_limits<int>::min ());
          (msdrCut < 0.0) && (msdrCut = 0.01);
        }
      else
        {
          betaCut = numeric_limits<int>::max ();
          msdrCut = numeric_limits<int>::min ();
        }
      !applyBeta && (betaCut = numeric_limits<int>::min ());
      !applyMSDR && (msdrCut = numeric_limits<int>::max ());
      pass = (jet->Beta > betaCut) && (jet->MeanSqDeltaR < msdrCut);
    }
  else
    pass = true;

  return pass;
}

string
getEtaRange (const Jet *jet, const double trackerAcceptance)
{
  if (fabs (jet->Eta) < 1.5)
    return "0To1p5";
  else if (fabs (jet->Eta) < 3.0)
    return "1p5To3";
  //else if (fabs (jet->Eta) < trackerAcceptance)
  else if (fabs (jet->Eta) < 4.0)
    return "3ToTrackerEdge";
  else if (fabs (jet->Eta) < 5.0)
    return "TrackerEdgeTo5";
  return "";
}
