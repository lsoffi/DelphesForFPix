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
#include "TParticlePDG.h"

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

#define  REPORT_EVERY         (10)

using namespace std;

bool interrupted = false;
 Int_t npu_;
  Float_t pu_zpos_[300];
  Float_t pu_sumpt_lowpt_[300];
  Float_t pu_sumpt_highpt_[300];
  Float_t pu_ntrks_lowpt_[300];
  Float_t pu_ntrks_highpt_[300];

  Float_t vxMC_;
  Float_t vyMC_;
  Float_t vzMC_;
  Int_t nvertex_;
  Float_t vx_[300];
  Float_t vy_[300];
  Float_t vz_[300];
  Float_t vntracks_[300];
  Float_t vchi2_[300];
  Float_t vndof_[300];
//----- GGH quarks
  int ngghQuark_;
  float gghQuarkPt_[30]   ;
  float gghQuarkEta_[30]  ;
  float gghQuarkPhi_[30]  ;
  float gghQuarkMass_[30] ;
  float gghQuarkStatus_[30];
  int gghQuarkPdgId_[30];
  int gghQuarkMothPdgId_[30];

  //----- Z
  int nZ_;
  float ZPt_[2]   ;
  float ZEta_[2]  ;
  float ZPhi_[2]  ;
  float ZMass_[2] ;
  float ZStatus_[2];
  int ZPdgId_[2];
 
 //----- Muons
  int nMu_;
  float MuPt_[4]   ;
  float MuEta_[4]  ;
  float MuPhi_[4]  ;
  float MuMass_[4] ;
  float MuStatus_[4];
  int MuPdgId_[4];
 
  int mH_; 

int ngenCand_;
float genCandPt_[30]   ;
float genCandEta_[30]  ;
float genCandPhi_[30]  ;
float genCandMass_[30] ;
float genCandStatus_[30];
int genCandPdgId_[30];
int genCandMothPdgId_[30];
  //----- VBF quarks
  int nvbfQuark_;
  float vbfQuarkPt_[30]   ;
  float vbfQuarkEta_[30]  ;
  float vbfQuarkPhi_[30]  ;
  float vbfQuarkMass_[30] ;
  float vbfQuarkStatus_[30];
  int vbfQuarkPdgId_[30];
  int vbfQuarkMothPdgId_[30];
//---- gen jets
  int ngenJet_;
  float genJetPt_[250];
  float genJetEta_[250];
  float genJetPhi_[250];
  float genJetMass_[250]; 
  float genJetEmE_[250]   ;
  float genJetHadrE_[250] ;
  float genJetInvE_[250]  ;
  float genJetAuxE_[250]  ;
  int genJetNconst_[250];
 //------- tracks
  int ntrk_;
  float trkPt_[9000];
  float trkEta_[9000];
  float trkPhi_[9000];

//------- trk jets
  int ntrkJet_;
  float trkJetPt_[250];
  float trkJetEta_[250];
  float trkJetPhi_[250];
  float trkJetMass_[250]; 
  float trkJetNtrk_[250]; 

//-------  jets                                                                                                                                
int nJet_;
float JetPt_[250];
float JetEta_[250];
float JetPhi_[250];
float JetMass_[250];
float JetNtrk_[250];
 

void signalHandler (int sig) { cout << "exiting..." << endl; interrupted = true; };
void analyze (const unordered_map<string, TClonesArray *> &, TTree* tree);

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
  vector<string> fileList;
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
 
 
  TFile *fout = TFile::Open (outputFile.c_str (), "recreate");
  fout->cd ();
  TTree* myTree_ = new TTree("myTree", "myTree");
  //----- gen particles
   myTree_ -> Branch("ngenCand",   &ngenCand_,     "ngenCand/I")   ;
  myTree_ -> Branch("genCandPt",   genCandPt_,    "genCandPt[ngenCand]/F")   ;
  myTree_ -> Branch("genCandEta" , genCandEta_,    "genCandEta[ngenCand]/F")  ;
  myTree_ -> Branch("genCandPhi",  genCandPhi_,    "genCandPhi[ngenCand]/F")  ;
  myTree_ -> Branch("genCandMass", genCandMass_,   "genCandMass[ngenCand]/F") ;
  myTree_ -> Branch("genCandStatus", genCandStatus_,  "genCandStatus[ngenCand]/F");
  myTree_ -> Branch("genCandPdgId", genCandPdgId_,  "genCandPdgId[ngenCand]/I");
  myTree_ -> Branch("genCandMothPdgId", genCandMothPdgId_,  "genCandMothPdgId[ngenCand]/I");
  //vbf quarks
  myTree_ -> Branch("nvbfQuark",   &nvbfQuark_,     "nvbfQuark/I")   ;
  myTree_ -> Branch("vbfQuarkPt",   vbfQuarkPt_,    "vbfQuarkPt[nvbfQuark]/F")   ;
  myTree_ -> Branch("vbfQuarkEta" , vbfQuarkEta_,    "vbfQuarkEta[nvbfQuark]/F")  ;
  myTree_ -> Branch("vbfQuarkPhi",  vbfQuarkPhi_,    "vbfQuarkPhi[nvbfQuark]/F")  ;
  myTree_ -> Branch("vbfQuarkMass", vbfQuarkMass_,   "vbfQuarkMass[nvbfQuark]/F") ;
  myTree_ -> Branch("vbfQuarkStatus", vbfQuarkStatus_,  "vbfQuarkStatus[nvbfQuark]/F");
  myTree_ -> Branch("vbfQuarkPdgId", vbfQuarkPdgId_,  "vbfQuarkPdgId[nvbfQuark]/I");
  myTree_ -> Branch("vbfQuarkMothPdgId", vbfQuarkMothPdgId_,  "vbfQuarkMothPdgId[nvbfQuark]/I");
  //genjet
  myTree_ -> Branch("ngenJet", &ngenJet_, "ngenJet/I");
  myTree_ -> Branch("genJetPt", genJetPt_, "genJetPt[ngenJet]/F");
  myTree_ -> Branch("genJetMass", genJetMass_, "genJet[ngenJet]/F");
  myTree_ -> Branch("genJetEta", genJetEta_, "genJetEta[ngenJet]/F");
  myTree_ -> Branch("genJetPhi", genJetPhi_, "genJetPhi[ngenJet]/F");
  myTree_ -> Branch("genJetEmE", genJetEmE_, "genJeEmEt[ngenJet]/F");
  myTree_ -> Branch("genJetHadrE", genJetHadrE_, "genJetHadrE[ngenJet]/F");
  myTree_ -> Branch("genJetInvE", genJetInvE_, "genJetInvE[ngenJet]/F");
  myTree_ -> Branch("genJetAuxE", genJetAuxE_, "genJetAuxE[ngenJet]/F");
  myTree_ -> Branch("genJetNconst", genJetNconst_, "genJetNconst[ngenJet]/I");
  //tracks
  myTree_ -> Branch("ntrk", &ntrk_, "ntrk/I");
  myTree_ -> Branch("trkPt", trkPt_, "trkPt[ntrk]/F");
  myTree_ -> Branch("trkEta", trkEta_, "trkEta[ntrk]/F");
  myTree_ -> Branch("trkPhi", trkPhi_, "trkPhi[ntrk]/F");
  //trkjet
  myTree_ -> Branch("ntrkJet", &ntrkJet_, "ntrkJet/I");			
  myTree_ -> Branch("trkJetPt", trkJetPt_, "trkJetPt[ntrkJet]/F");	
  myTree_ -> Branch("trkJetMass", trkJetMass_, "trkJet[ntrkJet]/F");	
  myTree_ -> Branch("trkJetEta", trkJetEta_, "trkJetEta[ntrkJet]/F");	
  myTree_ -> Branch("trkJetPhi", trkJetPhi_, "trkJetPhi[ntrkJet]/F");	
  myTree_ -> Branch("trkJetNtrk", trkJetNtrk_, "trkJetNtrk[ntrkJet]/F");

  myTree_ -> Branch("nJet", &nJet_, "nJet/I");			
  myTree_ -> Branch("JetPt", JetPt_, "JetPt[nJet]/F");	
  myTree_ -> Branch("JetMass", JetMass_, "Jet[nJet]/F");	
  myTree_ -> Branch("JetEta", JetEta_, "JetEta[nJet]/F");	
  myTree_ -> Branch("JetPhi", JetPhi_, "JetPhi[nJet]/F");	
  myTree_ -> Branch("JetNtrk", JetNtrk_, "JetNtrk[nJet]/F");


  myTree_ -> Branch("ngghQuark",   &ngghQuark_,     "ngghQuark/I")   ;
  myTree_ -> Branch("gghQuarkPt",   gghQuarkPt_,    "gghQuarkPt[ngghQuark]/F")   ;
  myTree_ -> Branch("gghQuarkEta" , gghQuarkEta_,    "gghQuarkEta[ngghQuark]/F")  ;
  myTree_ -> Branch("gghQuarkPhi",  gghQuarkPhi_,    "gghQuarkPhi[ngghQuark]/F")  ;
  myTree_ -> Branch("gghQuarkMass", gghQuarkMass_,   "gghQuarkMass[ngghQuark]/F") ;
  myTree_ -> Branch("gghQuarkStatus", gghQuarkStatus_,  "gghQuarkStatus[ngghQuark]/F");
  myTree_ -> Branch("gghQuarkPdgId", gghQuarkPdgId_,  "gghQuarkPdgId[ngghQuark]/I");
  myTree_ -> Branch("gghQuarkMothPdgId", gghQuarkMothPdgId_,  "gghQuarkMothPdgId[ngghQuark]/I");
  
  myTree_ -> Branch("nZ",   &nZ_,     "nZ/I")   ;
  myTree_ -> Branch("ZPt",   ZPt_,    "ZPt[nZ]/F")   ;
  myTree_ -> Branch("ZEta" , ZEta_,    "ZEta[nZ]/F")  ;
  myTree_ -> Branch("ZPhi",  ZPhi_,    "ZPhi[nZ]/F")  ;
  myTree_ -> Branch("ZMass", ZMass_,   "ZMass[nZ]/F") ;
  myTree_ -> Branch("ZStatus", ZStatus_,  "ZStatus[nZ]/F");
  myTree_ -> Branch("ZPdgId", ZPdgId_,  "ZPdgId[nZ]/I");
  //myTree_ -> Branch("ZMothPdgId", ZMothPdgId_,  "ZMothPdgId[nZ]/I");
 
  myTree_ -> Branch("nMu",   &nMu_,     "nMu/I")   ;
  myTree_ -> Branch("MuPt",   MuPt_,    "MuPt[nMu]/F")   ;
  myTree_ -> Branch("MuEta" , MuEta_,    "MuEta[nMu]/F")  ;
  myTree_ -> Branch("MuPhi",  MuPhi_,    "MuPhi[nMu]/F")  ;
  myTree_ -> Branch("MuMass", MuMass_,   "MuMass[nMu]/F") ;
  myTree_ -> Branch("MuStatus", MuStatus_,  "MuStatus[nMu]/F");
  myTree_ -> Branch("MuPdgId", MuPdgId_,  "MuPdgId[nMu]/I");
  //myTree_ -> Branch("MuMothPdgId", MuMothPdgId_,  "MuMothPdgId[nMu]/I");
  
   
  myTree_->Branch("npu", &npu_, "npu/I");
  myTree_->Branch("pu_zpos", &pu_zpos_, "pu_zpos[npu]/F");
  myTree_->Branch("pu_sumpt_lowpt", &pu_sumpt_lowpt_, "pu_sumpt_lowpt[npu]/F");
  myTree_->Branch("pu_sumpt_highpt", &pu_sumpt_highpt_, "pu_sumpt_highpt[npu]/F");
  myTree_->Branch("pu_ntrks_lowpt", &pu_ntrks_lowpt_, "pu_ntrks_lowpt[npu]/F");
  myTree_->Branch("pu_ntrks_highpt", &pu_ntrks_highpt_, "pu_ntrks_highpt[npu]/F");


  myTree_->Branch("vxMC",&vxMC_,"vxMC/F");
  myTree_->Branch("vyMC",&vyMC_,"vyMC/F");
  myTree_->Branch("vzMC",&vzMC_,"vzMC/F");
  myTree_->Branch("nvertex",&nvertex_,"nvertex/I");
  myTree_->Branch("vx",&vx_,"vx[nvertex]/F");
  myTree_->Branch("vy",&vy_,"vy[nvertex]/F");
  myTree_->Branch("vz",&vz_,"vz[nvertex]/F");
  myTree_->Branch("vntracks",&vntracks_,"vntracks[nvertex]/F");
  myTree_->Branch("vchi2",&vchi2_,"vchi2[nvertex]/F");
  myTree_->Branch("vndof",&vndof_,"vndof[nvertex]/F");

  myTree_->Branch("mH", &mH_, "mH/I");

  signal (SIGINT, signalHandler);
 
  //Create chain of root trees
  TChain chain("Delphes");
  for (const auto &file : fileList)
    chain.Add (file.c_str ());

  // Create object of class ExRootTreeReader
  ExRootTreeReader *treeReader = new ExRootTreeReader(&chain);
  Long64_t numberOfEntries = treeReader->GetEntries();
  cout << "================================================================================" << endl;
  cout << "processing " << numberOfEntries << " events..." << endl;
  cout << "================================================================================" << endl << endl;

  // Get pointers to branches used in this analysis
  unordered_map<string, TClonesArray *> branches;
  branches["Event"] = treeReader->UseBranch("Event");
  branches["Particle"] = treeReader->UseBranch("Particle");
  branches["VBFquarks"] = treeReader->UseBranch("VBFquarks");
  branches["UnsortedCluster"] = treeReader->UseBranch("UnsortedCluster");
  branches["NPU"] = treeReader->UseBranch("NPU");
  branches["Jet"] = treeReader->UseBranch("Jet");
  branches["JetTRK"] = treeReader->UseBranch("JetTRK");
  //branches["JetGenClosest"] = treeReader->UseBranch("JetGenClosest");
  //branches["JetGenBest"] = treeReader->UseBranch("JetGenBest");
  branches["JetNoCHS"] = treeReader->UseBranch("JetNoCHS");
  branches["BeamSpotParticle"] = treeReader->UseBranch("BeamSpotParticle");
  branches["Track"] = treeReader->UseBranch("Track");
  branches["Rho"] = treeReader->UseBranch("Rho");
  branches["GenJet"] = treeReader->UseBranch("GenJet");

  // Loop over all events
  for(Int_t entry = 0; entry < numberOfEntries && !interrupted; ++entry)
    {
      if (!(entry % REPORT_EVERY))
        cout << "processing event " << (entry + 1) << "..." << endl;
      treeReader->ReadEntry(entry);
      analyze (branches, myTree_);
    }

  myTree_->Write();
  fout->Close ();

  delete treeReader;
}

void
analyze (const unordered_map<string, TClonesArray *> &branches, TTree* tree)
{
  //  std::cout<<"fill gen particles infos"<<std::endl;
  int k = 0;
  ngenCand_ = 0;
   for(int i = 0;i<30;i++){
     genCandPt_[i] =-999.;
     genCandEta_[i]=-999.;
     genCandPhi_[i]=-999.;
     genCandMass_[i]=-999.;
     genCandStatus_[i]=-999.;
     genCandPdgId_[i]=-999;
     genCandMothPdgId_[i]=-999;
   }
   
  for (int iParticle = 0; iParticle < branches.at ("Particle")->GetEntries (); iParticle++){
    if(k<30){
    GenParticle *particle = (GenParticle *) branches.at ("Particle")->At (iParticle);
    genCandPt_[k]= particle->PT;
    genCandEta_[k]= particle->Eta;
    genCandPhi_[k]= particle->Phi;
    genCandMass_[k]= particle->Mass;
    genCandStatus_[k]= particle->Status;
    genCandPdgId_[k]= particle->PID;
    ngenCand_++;
    k++;
    }
  }

  //  std::cout<<"vbf quarks"<<std::endl;
  nvbfQuark_ = 0;
   for(int i = 0;i<30;i++){
     vbfQuarkPt_[i] =-999.;
     vbfQuarkEta_[i]=-999.;
     vbfQuarkPhi_[i]=-999.;
     vbfQuarkMass_[i]=-999.;
     vbfQuarkStatus_[i]=-999.;
     vbfQuarkPdgId_[i]=-999;
     vbfQuarkMothPdgId_[i]=-999;
   }
   int r = 0;
   vector<GenParticle *> quarks;
   for (int iQuark = 0; iQuark < branches.at ("VBFquarks")->GetEntries (); iQuark++)
    quarks.push_back ((GenParticle *) branches.at ("VBFquarks")->At (iQuark));
  if (!quarks.size ())
    {
      for (int iParticle = 0; iParticle < branches.at ("Particle")->GetEntries (); iParticle++)
        {
          GenParticle *particle = (GenParticle *) branches.at ("Particle")->At (iParticle);
          if (particle->Status != 3)
            continue;
          if (abs (particle->PID) != 5)
            continue;
          quarks.push_back (particle);
        }
    }
 
  if (quarks.size ())
    {
      for (const auto &quark : quarks)
        {
	  nvbfQuark_++;
         vbfQuarkPdgId_[r]= quark->PID;
	 vbfQuarkStatus_[r]= quark->Status;
         vbfQuarkEta_[r]= quark->Eta;
	 vbfQuarkPhi_[r]= quark->Phi;
	 vbfQuarkMass_[r]= quark->Mass;
	 vbfQuarkPt_[r]= quark->PT;
	 r++;
	}
    }

  //  std::cout<<"save gen jet informations"<<std::endl;
   ngenJet_ = 0;
   for(int i = 0;i<250;i++){
     genJetPt_[i] =-999.;
     genJetEta_[i]=-999.;
     genJetPhi_[i]=-999.;
     genJetMass_[i]=-999.;
     genJetEmE_[i]=-999.;
     genJetHadrE_[i]=-999.;
     genJetInvE_[i]=-999.;
     genJetAuxE_[i]=-999.;
     genJetNconst_[i]=-999;
 }
   int j=0;
   for (int iGenJet = 0; iGenJet < branches.at ("GenJet")->GetEntries (); iGenJet++) {
      Jet *genJet = (Jet *) branches.at ("GenJet")->At (iGenJet);
      if(genJet->PT<5)continue; 
      genJetPt_[j]=genJet->PT;
      genJetEta_[j]=genJet->Eta;
      genJetPhi_[j]=genJet->Phi;
      genJetMass_[j]=genJet->Mass;
      ngenJet_++;
      j++;

    }
   //   std::cout<<"save trk  infos"<<std::endl;
   ntrk_=0;
   for(int ll = 0;ll<9000;ll++){
     trkPt_[ll] =-999.;
     trkEta_[ll]=-999.;
     trkPhi_[ll]=-999.;
   }
   int zz=0;
   for (int iTrack = 0; iTrack < branches.at ("Track")->GetEntries (); iTrack++){
     Track *track = (Track *) branches.at ("Track")->At (iTrack);
     trkPt_[zz]=track->PT;
     trkEta_[zz]=track->Eta;
     trkPhi_[zz]=track->Phi;
     zz++;
     ntrk_++;
   }



   //   std::cout<<"trk jets"<<std::endl;
   ntrkJet_=0;
   nJet_=0;
   for(int l = 0;l<250;l++){
     trkJetPt_[l] =-999.;
     trkJetEta_[l]=-999.;
     trkJetPhi_[l]=-999.;
     trkJetMass_[l]=-999.;
     trkJetNtrk_[l]=-999.;
     JetPt_[l] =-999.;
     JetEta_[l]=-999.;
     JetPhi_[l]=-999.;
     JetMass_[l]=-999.;
     JetNtrk_[l]=-999.;
 
   }
   int z=0;
   for (int iJet = 0; iJet < branches.at ("Jet")->GetEntries (); iJet++) {
     Jet *jet = (Jet *) branches.at ("Jet")->At (iJet);
     JetPt_[z]=jet->PT;
     JetEta_[z]=jet->Eta;
     JetPhi_[z]=jet->Phi;
     JetMass_[z]=jet->Mass;
     // JetN_[z]=;
     z++;
     nJet_++;
     
    }

   //   std::cout<<"bla"<<std::endl;

  int tt=0;
  for (int tJet = 0; tJet < branches.at ("JetTRK")->GetEntries (); tJet++) {
    Jet *tjet = (Jet *) branches.at ("JetTRK")->At (tJet);
    trkJetPt_[tt]=tjet->PT;
    trkJetEta_[tt]=tjet->Eta;
    trkJetPhi_[tt]=tjet->Phi;
    trkJetMass_[tt]=tjet->Mass;
    // trkJetNtrk_[tt]=;                                                                                                                          
    tt++;
    ntrkJet_++;
     
  }




  //  std::cout<<"reconstruct H->ZZ->4L"<<std::endl;
   nZ_ = 0;
   for(int i = 0;i<2;i++){
     ZPt_[i] =-999.;
     ZEta_[i]=-999.;
     ZPhi_[i]=-999.;
     ZMass_[i]=-999.;
     ZStatus_[i]=-999.;
     ZPdgId_[i]=-999;
    
   }

   nMu_ = 0;
   for(int i = 0;i<4;i++){
     MuPt_[i] =-999.;
     MuEta_[i]=-999.;
     MuPhi_[i]=-999.;
     MuMass_[i]=-999.;
     MuStatus_[i]=-999.;
     MuPdgId_[i]=-999;
    
   }
  int t = 0;
  int mu = 0;
  //  std::cout<<"flag"<<std::endl;
  /* for (int iParticle = 0; iParticle < branches.at ("Particle")->GetEntries (); iParticle++)
   {
     std::cout<<"iParticle "<<std::endl;
          GenParticle *particle = (GenParticle *) branches.at ("Particle")->At (iParticle);
          if (particle->Status != 3)
            continue;
          if (abs (particle->PID) != 23)
            continue;
	  std::cout<<particle->PID<<std::endl;
	  GenParticle *mother1 = (GenParticle *)particle->M1;
	  GenParticle *mother2 = (GenParticle *)particle->M2;
	  std::cout<<mother1->PID<<std::endl;
	  std::cout<<mother2->PID<<std::endl;
	  if(mother1->PID==25 || mother2->PID==25){
	    ZPt_[t]= particle->PT;
	    ZEta_[t]= particle->Eta;
	    ZPhi_[t]= particle->Phi;
	    ZMass_[t]= particle->Mass;
	    ZStatus_[t]= particle->Status;
	    ZPdgId_[t]= particle->PID;
	    nZ_++;
	    t++;
	  }
	  if(t>2)continue;
   } 

 */
  // std::cout<<"flag"<<std::endl;
for (int iParticle = 0; iParticle < branches.at ("Particle")->GetEntries (); iParticle++)
    {
      GenParticle *particle = (GenParticle *) branches.at ("Particle")->At (iParticle);
      if (particle->Status != 3)
	continue;
      if (abs (particle->PID) != 13 && abs (particle->PID) != 15&& abs (particle->PID) != 11)
        continue;      
      MuPt_[mu]=particle->PT;
      MuEta_[mu]= particle->Eta;
      MuPhi_[mu]= particle->Phi;
      MuMass_[mu]= particle->Mass;
      MuStatus_[mu]= particle->Status;
      MuPdgId_[mu]= particle->PID;
      nMu_++;
      mu++;
    }


// std::cout<<"flag"<<std::endl;

  tree->Fill();
}

