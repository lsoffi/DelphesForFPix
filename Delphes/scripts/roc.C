#include <iostream>
#include <vector>

#include "TFile.h"
#include "TH1D.h"
#include "TGraphErrors.h"
#include "TCanvas.h"
#include "TLegend.h"

using namespace std;

void openFiles0 (vector<TFile *> &);
void openFiles1 (vector<TFile *> &);

void
roc ()
{
  vector<TFile *> files0, files1;
  openFiles0 (files0);
  //openFiles1 (files1);

  double smallestX = 1.0;
  vector<double> x, y, ex, ey;
  TH1D *h;
  /*x.push_back (0.0);
  y.push_back (0.0);
  ex.push_back (0.0);
  ey.push_back (0.0);*/
  for (vector<TFile *>::const_iterator file = files0.begin (); file != files0.end (); file++)
    {
      h = (TH1D *) (*file)->Get ("pvPTEfficiency");
      h->SetDirectory (0);
      x.push_back (h->GetMean ());
      ex.push_back (h->GetMeanError ());
      h = (TH1D *) (*file)->Get ("pvPTFakeRate");
      y.push_back (h->GetMean ());
      ey.push_back (h->GetMeanError ());

      if (ex.back () && x.back () - ex.back () < smallestX)
        smallestX = x.back () - ex.back ();
      cout << "(x, y): (" << x.back () << ", " << y.back () << ")" << endl;
    }
  TGraphErrors *roc0 = new TGraphErrors (x.size (), x.data (), y.data (), ex.data (), ey.data ());
  roc0->SetTitle ("");
  roc0->SetMarkerColor (kBlack);
  roc0->SetMarkerStyle (20);
  roc0->SetMarkerSize (1.5);
  roc0->SetLineColor (kBlack);
  roc0->SetLineStyle (1);
  roc0->SetLineWidth (2);

//  x.clear ();
//  y.clear ();
//  ex.clear ();
//  ey.clear ();
//  /*x.push_back (0.0);
//  y.push_back (0.0);
//  ex.push_back (0.0);
//  ey.push_back (0.0);*/
//  for (vector<TFile *>::const_iterator file = files1.begin (); file != files1.end (); file++)
//    {
//      h = (TH1D *) (*file)->Get ("pvPTEfficiency");
//      h->SetDirectory (0);
//      x.push_back (h->GetMean ());
//      ex.push_back (h->GetMeanError ());
//      h = (TH1D *) (*file)->Get ("pvPTFakeRate");
//      y.push_back (h->GetMean ());
//      ey.push_back (h->GetMeanError ());
//
//      if (ex.back () && x.back () - ex.back () < smallestX)
//        smallestX = x.back () - ex.back ();
//    }
//  TGraphErrors *roc1 = new TGraphErrors (x.size (), x.data (), y.data (), ex.data (), ey.data ());
//  roc1->SetTitle ("");
//  roc1->SetMarkerColor (kRed);
//  roc1->SetMarkerStyle (20);
//  roc1->SetMarkerSize (1.5);
//  roc1->SetLineColor (kRed);
//  roc1->SetLineStyle (1);
//  roc1->SetLineWidth (2);

  TLegend *leg = new TLegend (0.1, 0.7, 0.48, 0.9);
  leg->AddEntry (roc0, "100#times150#mum", "p");
  //leg->AddEntry (roc1, "16#times600#mum", "p");

  TCanvas *c1 = new TCanvas ("c1", "c1", 800, 800);
  c1->SetTickx ();
  c1->SetTicky ();
  c1->cd ();
  roc0->Draw ("alp");

  roc0->GetXaxis ()->SetNdivisions (505);
  //roc0->GetXaxis ()->SetLimits (smallestX / 10.0, 1.0);
  //roc0->GetXaxis ()->SetLimits (0.75, 0.77);
  roc0->GetXaxis ()->SetLimits (0, 1);
  roc0->GetXaxis ()->SetTitle ("fraction of VBF momentum included in PV");
  roc0->GetXaxis ()->SetLabelOffset ();
  roc0->GetXaxis ()->SetLabelSize ();
  roc0->GetXaxis ()->SetTitleOffset ();
  roc0->GetXaxis ()->SetTitleSize ();

  roc0->GetYaxis ()->SetNdivisions (505);
  roc0->GetYaxis ()->SetLimits (0.0, 1.0);
  roc0->GetYaxis ()->SetTitle ("fraction of PV momentum due to pileup tracks");
  roc0->GetYaxis ()->SetLabelOffset ();
  roc0->GetYaxis ()->SetLabelSize ();
  roc0->GetYaxis ()->SetTitleOffset ();
  roc0->GetYaxis ()->SetTitleSize ();

  //roc1->Draw ("lp same");
  //leg->Draw ("same");
}

void
openFiles0 (vector<TFile *> &files)
{
  /*files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale2_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale4_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale8_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale16_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale32_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale64_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale128_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale256_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale512_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scale1024_originalTracks.root"));
  files.push_back (TFile::Open ("VFPix100x150um_VFTracks_scaleInf_originalTracks.root"));*/

  files.push_back (TFile::Open ("VFPix100x150um_deltaPileup.root"));
  files.push_back (TFile::Open ("VFPix50x300um_deltaPileup.root"));
  files.push_back (TFile::Open ("VFPix25x600um_deltaPileup.root"));
  files.push_back (TFile::Open ("VFPix16x600um_deltaPileup.root"));
}

void
openFiles1 (vector<TFile *> &files)
{
  files.push_back (TFile::Open ("VFPix16x600um_sigma0p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma1p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma1p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma2p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma2p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma3p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma3p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma4p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma4p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma5p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma5p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma6p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma6p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma7p0.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma7p5.root"));
  files.push_back (TFile::Open ("VFPix16x600um_sigma8p0.root"));
}
