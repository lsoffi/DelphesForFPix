#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

#include "TH2D.h"
#include "TH1D.h"
#include "TFile.h"
#include "TLegend.h"
#include "TCanvas.h"

#define REBIN_FACTOR (16)

using namespace std;

void setStyle (TH1D *, string, string, double, double, Color_t);
void getMinAndMax (TH1D *, TH1D *, TH1D *, TH1D *, double &, double &);

void
profile (TFile *_file0, TFile *_file1, TFile *_file2, TFile *_file3)
{
  TH2D *h;
  TH1D *eff0, *eff1, *eff2, *eff3,
       *pur0, *pur1, *pur2, *pur3;

  h = (TH2D *) _file0->Get ("pvPTEfficiencyVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  eff0 = (TH1D *) h->ProfileX ();
  eff0->SetDirectory (0);
  eff0->SetName ("eff0");

  h = (TH2D *) _file1->Get ("pvPTEfficiencyVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  eff1 = (TH1D *) h->ProfileX ();
  eff1->SetDirectory (0);
  eff1->SetName ("eff1");

  h = (TH2D *) _file2->Get ("pvPTEfficiencyVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  eff2 = (TH1D *) h->ProfileX ();
  eff2->SetDirectory (0);
  eff2->SetName ("eff2");

  h = (TH2D *) _file3->Get ("pvPTEfficiencyVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  eff3 = (TH1D *) h->ProfileX ();
  eff3->SetDirectory (0);
  eff3->SetName ("eff3");

  h = (TH2D *) _file0->Get ("pvPTPurityVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  pur0 = (TH1D *) h->ProfileX ();
  pur0->SetDirectory (0);
  pur0->SetName ("pur0");

  h = (TH2D *) _file1->Get ("pvPTPurityVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  pur1 = (TH1D *) h->ProfileX ();
  pur1->SetDirectory (0);
  pur1->SetName ("pur1");

  h = (TH2D *) _file2->Get ("pvPTPurityVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  pur2 = (TH1D *) h->ProfileX ();
  pur2->SetDirectory (0);
  pur2->SetName ("pur2");

  h = (TH2D *) _file3->Get ("pvPTPurityVsNInteractions");
  h->SetDirectory (0);
  h->Rebin2D (REBIN_FACTOR, REBIN_FACTOR);
  pur3 = (TH1D *) h->ProfileX ();
  pur3->SetDirectory (0);
  pur3->SetName ("pur3");

  double minimum, maximum;
  getMinAndMax (eff0, eff1, eff2, eff3, minimum, maximum);

  setStyle (eff0, "number of interactions", "fraction of VBF momentum included in PV", minimum, maximum, kBlack);
  setStyle (eff1, "number of interactions", "fraction of VBF momentum included in PV", minimum, maximum, kRed);
  setStyle (eff2, "number of interactions", "fraction of VBF momentum included in PV", minimum, maximum, kGreen);
  setStyle (eff3, "number of interactions", "fraction of VBF momentum included in PV", minimum, maximum, kBlue);

  getMinAndMax (pur0, pur1, pur2, pur3, minimum, maximum);

  setStyle (pur0, "number of interactions", "fraction of PV momentum due to pileup tracks", minimum, maximum, kBlack);
  setStyle (pur1, "number of interactions", "fraction of PV momentum due to pileup tracks", minimum, maximum, kRed);
  setStyle (pur2, "number of interactions", "fraction of PV momentum due to pileup tracks", minimum, maximum, kGreen);
  setStyle (pur3, "number of interactions", "fraction of PV momentum due to pileup tracks", minimum, maximum, kBlue);

  TLegend *leg0 = new TLegend (0.483668, 0.669251, 0.864322, 0.869509);
  leg0->SetFillStyle (0);
  leg0->SetTextSize (0.03875969);
  leg0->AddEntry (eff0, "100#times150#mum", "p");
  leg0->AddEntry (eff1, "50#times300#mum", "p");
  leg0->AddEntry (eff2, "25#times600#mum", "p");
  leg0->AddEntry (eff3, "16#times600#mum", "p");

  TCanvas *c1 = new TCanvas ("c1", "c1", 800, 800);
  c1->SetTickx ();
  c1->SetTicky ();
  c1->cd ();
  eff0->Draw ();
  eff1->Draw ("same");
  eff2->Draw ("same");
  eff3->Draw ("same");
  leg0->Draw ("same");

  TLegend *leg1 = new TLegend (0.483668, 0.669251, 0.864322, 0.869509);
  leg1->SetFillStyle (0);
  leg1->SetTextSize (0.03875969);
  leg1->AddEntry (eff0, "100#times150#mum", "p");
  leg1->AddEntry (eff1, "50#times300#mum", "p");
  leg1->AddEntry (eff2, "25#times600#mum", "p");
  leg1->AddEntry (eff3, "16#times600#mum", "p");

  TCanvas *c2 = new TCanvas ("c2", "c2", 800, 800);
  c2->SetTickx ();
  c2->SetTicky ();
  c2->cd ();
  pur0->Draw ();
  pur1->Draw ("same");
  pur2->Draw ("same");
  pur3->Draw ("same");
  leg1->Draw ("same");
}

void
setStyle (TH1D *h, string xTitle, string yTitle, double minimum, double maximum, Color_t c)
{
  h->SetMarkerColor (c);
  h->SetMarkerStyle (20);
  h->SetMarkerSize (1.5);
  h->SetLineColor (c);
  h->SetLineStyle (1);
  h->SetLineWidth (2);

  h->GetXaxis ()->SetLabelSize ();
  h->GetXaxis ()->SetLabelOffset ();
  h->GetXaxis ()->SetTitleSize ();
  h->GetXaxis ()->SetTitleOffset ();
  h->GetXaxis ()->SetRangeUser (0.0, 200.0);
  h->GetXaxis ()->SetTitle (xTitle.c_str ());
  h->GetXaxis ()->SetNdivisions (505);

  h->GetYaxis ()->SetLabelSize ();
  h->GetYaxis ()->SetLabelOffset ();
  h->GetYaxis ()->SetTitleSize ();
  h->GetYaxis ()->SetTitleOffset (1.2);
  h->GetYaxis ()->SetRangeUser (minimum, maximum);
  h->GetYaxis ()->SetTitle (yTitle.c_str ());
  h->GetYaxis ()->SetNdivisions (505);

  h->SetStats (0);
}

void
getMinAndMax (TH1D *h0, TH1D *h1, TH1D *h2, TH1D *h3, double &minimum, double &maximum)
{
  vector<double> minima, maxima;
  double diff;

  minima.push_back (h0->GetMinimum () - h0->GetBinError (h0->GetMinimumBin ()));
  minima.push_back (h1->GetMinimum () - h1->GetBinError (h0->GetMinimumBin ()));
  minima.push_back (h2->GetMinimum () - h2->GetBinError (h0->GetMinimumBin ()));
  minima.push_back (h3->GetMinimum () - h3->GetBinError (h0->GetMinimumBin ()));

  maxima.push_back (h0->GetMaximum () + h0->GetBinError (h0->GetMaximumBin ()));
  maxima.push_back (h1->GetMaximum () + h1->GetBinError (h0->GetMaximumBin ()));
  maxima.push_back (h2->GetMaximum () + h2->GetBinError (h0->GetMaximumBin ()));
  maxima.push_back (h3->GetMaximum () + h3->GetBinError (h0->GetMaximumBin ()));

  sort (minima.begin (), minima.end ());
  sort (maxima.begin (), maxima.end ());
  diff = maxima.back () - minima.at (0);

  unsigned power;
  for (power = 1; ((int) (diff * pow (10.0, power))) < 1.0; power++);
  power = (unsigned) min ((double) power, 2.0);
  minimum = ((int) (minima.at (0) * pow (10.0, power))) / pow (10.0, power);
  maximum = min (((int) (maxima.back () * pow (10.0, power)) + 1.0) / pow (10.0, power), 1.0);
}
