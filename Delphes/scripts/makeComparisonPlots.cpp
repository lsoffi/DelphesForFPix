#include "TSystem.h"
#include "TChain.h"
#include "ExRootAnalysis/ExRootTreeReader.h"
#include "TClonesArray.h"
#include "TH1D.h"
#include "TH2D.h"
#include "classes/DelphesClasses.h"
#include "TFile.h"
#include "TLorentzVector.h"
#include "TCanvas.h"
#include "TLegend.h"
#include "TList.h"
#include "TKey.h"

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <map>
#include <cmath>
#include <signal.h>

using namespace std;

struct histogram {
  TLegend *leg;
  vector<TH1D *> h;
  Double_t  max = 0;
  string directory = "";
};

//some globals for convienience
map<string, histogram> histos;
string line;
string inputFile = "", outputFile = "stacked_histograms.root";
bool normalized = false;
bool pdf = false;
bool ylog = false;
bool addOverUnderFlow = false;
int rebin = -1;
pair<bool, double> ymin(false, 0);
pair<bool, double> ymax(false, 0);

void setOptions(int argc, char* argv[]) {
	for (int i = 1; i< argc; i++) {
		if(strlen(argv[i]) == 2 && argv[i][0]=='-') {
			char c = argv[i][1];
			switch(c) {
				case 'h':
					cout<<"Usage:"<<endl;
					cout<<"-h, --help                                       Show usage options"<<endl;
					cout<<"-i [file name], --input=[file name]		Input file"<<endl;
					cout<<"-o [file name], --output=[file name]	      	Output file"<<endl;
					cout<<"-u, --unit-area					Normalize all samples to unit area"<<endl;
					cout<<"-b [rebin factor], --rebin=[rebin factor]	Rebin all histograms"<<endl;
					cout<<"-p, --pdf					Save pdf files for all the plots made"<<endl;
					cout<<"--ymin=[ymin]					Set minimum value of y axis"<<endl;
					cout<<"--ymax=[ymax]					Set maximum value of y axis"<<endl;
					cout<<"--ylog						Set y axis to logarithmic scale"<<endl;
					cout<<"-O, --addOverUnderFlow                           Add the overflow and underflow entries to the first and last bins"<<endl; 
					break; 
				case 'i':
					inputFile = argv[i+1];
					break;
				case 'o':
					outputFile = argv[i+1];
                                        break;
				case 'O':
					addOverUnderFlow = true;
					break;
				case 'u': 
					normalized = true;
					break;
				case 'b':
					rebin = atoi(argv[i+1]);
					break;		
				case 'p':
					pdf = true;
					break;	
			}
		} else if (argv[i][0]=='-' && argv[i][1]=='-') {
			string arg = argv[i];
			string val = arg.substr(arg.find("=")+1);
			arg = arg.substr(0, arg.find("="));
			if(arg.compare("--input")==0) {
                               inputFile = val.c_str();
                        }
			if(arg.compare("--output")==0) {
                                outputFile = val.c_str();
                        }
			if(arg.compare("--unit-area")==0) {
                                normalized = true;
                        }
			if(arg.compare("--ymin")==0) {
				ymin.first = true;
				ymin.second = stod(val);
			}
			if(arg.compare("--ymax")==0) {
                                ymax.first = true;
                                ymax.second = stod(val);
                        }
			if(arg.compare("--rebin")==0) {
				rebin = atoi(val.c_str());
			}
			if(arg.compare("--pdf")==0) {
				pdf = true;
			}
			if(arg.compare("--ylog")==0) {
				ylog = true;
			}
			if(arg.compare("--addOverUnderFlow")) {
				addOverUnderFlow = true;
			}
			if(arg.compare("--help")==0) {
				cout<<"Usage:"<<endl;
				cout<<"-h, --help					Show usage options"<<endl;
                                cout<<"-i [file name], --input=[file name]              Input file"<<endl;
                                cout<<"-o [file name], --output=[file name]             Output file"<<endl;
                                cout<<"-u, --unit-area                                  Normalize all samples to unit area"<<endl;
                                cout<<"-b [rebin factor], --rebin=[rebin factor]        Rebin all histograms"<<endl;
                                cout<<"-p, --pdf                                        Save pdf files for all the plots made"<<endl;
                                cout<<"--ymin=[ymin]                                    Set minimum value of y axis"<<endl;
                                cout<<"--ymax=[ymax]                                    Set maximum value of y axis"<<endl;
				cout<<"--ylog                                           Set y axis to logarithmic scale"<<endl;
				cout<<"-O, --addOverUnderFlow 				Add the overflow and underflow entries to the first and last bins"<<endl;					
			}
		}
	}
}

void openList(TDirectoryFile *dir) {
	TList *list = dir->GetListOfKeys();
       	for (int i = 0; i < list->GetSize(); i++) {
        	string name = ((TKey *)list->At(i))->GetName();
		if(0 == strcmp(((TKey *)list->At(i))->GetClassName(), "TDirectoryFile")) {
			openList((TDirectoryFile *)dir->Get(name.c_str()));
		}
                if(0 == strcmp(((TKey *)list->At(i))->GetClassName(), "TH1D")) {
   	             TH1D *thist = (TH1D *)dir->Get(name.c_str());
                     if(histos.insert(make_pair(name, histogram())).second) {
          	          histos[name].leg = new TLegend(0.777299, 0.743644, 0.997126, 0.936441);
                          histos[name].leg->SetHeader(name.c_str());
                     }
                     histos[name].leg->AddEntry(thist, line.c_str(), "l");
                     thist->SetStats(false);
		     if(rebin != -1) {
		     	thist->Rebin(rebin);
		     }
		     if(addOverUnderFlow) {
			int nbins = thist->GetNbinsX();
			thist->SetBinContent(1, thist->GetBinContent(1) + thist->GetBinContent(0));
			thist->SetBinContent(nbins, thist->GetBinContent(nbins) + thist->GetBinContent(nbins+1));

			thist->SetBinError(1, sqrt(pow(thist->GetBinError(1), 2) + pow(thist->GetBinError(0), 2)));
			thist->SetBinError(1, sqrt(pow(thist->GetBinError(nbins), 2) + pow(thist->GetBinError(nbins+1), 2)));
		     }
		     if(ymin.first) {
			thist->SetAxisRange(ymin.second, thist->GetMaximum(), "Y");
		     }
		     if(ymax.first) {
                        thist->SetAxisRange(thist->GetMinimum(), ymax.second, "Y");
                     }
                     histos[name].h.push_back(thist);
                     if (histos[name].max < thist->GetMaximum()) {
   	                   histos[name].max = thist->GetMaximum();
         	     }
                }
 	}
}



int main (int argc, char *argv[]){
	setOptions(argc, argv);	
	if (inputFile.compare("")==0) {
		cout<<"An input file must be provided"<<endl;
		cout<<"Type "<<argv[0]<<" -h for help"<<endl;
	}
	
	//batch mode (no graphics)
	gROOT->SetBatch();  //needed?
 	
	//fill an array of histograms
	ifstream fin (inputFile);
    	//string line;
	vector<int> colors = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		
    	while(getline(fin, line)) {
		TFile *f  = new TFile(line.c_str());
		line = "Pile Up "+line.substr(line.find("pu")+2,line.find(".root")-line.find("pu")-2);
		//line = line.substr(line.find("_")+1,line.find(".root")-line.find("_")-1);
		openList(f);
	}

    	fin.close();

	//draw those histograms
	TFile *fout = TFile::Open(outputFile.c_str(), "recreate");

	for (map<string, histogram>::iterator hmap = histos.begin(); hmap != histos.end(); hmap++ ) {
		TCanvas can(hmap->first.c_str());
		if(ylog){
			can.SetLogy();
		}
		histogram hist = hmap->second;
		can.cd();
		//Double_t scale = gPad->GetUymax() /(1.1*hist.max);
		hist.h.at(0)->SetLineColor(colors.at(0));
		//hist.h.at(0)->Scale(scale);
		if(normalized) {
			hist.h.at(0)->DrawNormalized("HIST");
		} else {
			hist.h.at(0)->Draw("HIST");
		}
		for (unsigned j = 1; j < hist.h.size(); j++) {
			TH1D *h = hist.h.at(j);
			h->SetLineColor(colors.at(j%colors.size()));
			//h->Scale(scale);
			if(normalized) {
				h->DrawNormalized("HIST same");
			} else {
				h->Draw("HIST same");
			}
		}
		hist.leg->Draw();
		if(pdf) {
			can.SaveAs(strcat((char *)hist.leg->GetHeader(), ".pdf"));
		}
		fout->cd();
		can.Write();
	}
  	fout->Close();	
}
