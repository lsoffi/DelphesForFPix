#include <iostream>
#include <sstream>

#include "TFile.h"
#include "TH1D.h"
#include "TH2D.h"
#include "TCanvas.h"
#include "TLegend.h"
#include "TPaveText.h"
#include "TStyle.h"
#include "TGraphAsymmErrors.h"
#include "TF1.h"
#include "TMath.h"

#define REBIN_FACTOR 32

using namespace std;

void invert (TH1D * const);
template<class T> void setStyle (T * const, const int, const int, const int = 1);
double normCDF (double *, double *);
void foldHistogram (TH1D *, bool);

void
plot ()
{
  gStyle->SetOptStat (0);

  TFile *fin;
  map<string, TH1D *> jetEfficiencyNumerator, jetEfficiencyDenominator;

  fin = TFile::Open ("vbfHToTauTau_withJEC_trkExt.root");
  jetEfficiencyNumerator["fullSim"] = (TH1D *) fin->Get ("VFPixAnalyzer/pvAssociationFactored/vbfJetsFound");
  jetEfficiencyNumerator.at ("fullSim")->SetDirectory (0);
  jetEfficiencyDenominator["fullSim"] = (TH1D *) fin->Get ("VFPixAnalyzer/pvAssociationFactored/vbfQuarkEta");
  jetEfficiencyDenominator.at ("fullSim")->SetDirectory (0);
  fin->Close ();

  fin = TFile::Open ("TechnicalProposal2014_75x100um.root");
  //fin = TFile::Open ("vbfHToTauTau_withJEC_noTrkExt.root");
  jetEfficiencyNumerator["delphes"] = (TH1D *) fin->Get ("pvAssociationFactored/vbfJetsFound");
  //jetEfficiencyNumerator["delphes"] = (TH1D *) fin->Get ("VFPixAnalyzer/pvAssociationFactored/vbfJetsFound");
  jetEfficiencyNumerator.at ("delphes")->SetDirectory (0);
  jetEfficiencyDenominator["delphes"] = (TH1D *) fin->Get ("pvAssociationFactored/vbfQuarkEta");
  //jetEfficiencyDenominator["delphes"] = (TH1D *) fin->Get ("VFPixAnalyzer/pvAssociationFactored/vbfQuarkEta");
  jetEfficiencyDenominator.at ("delphes")->SetDirectory (0);
  fin->Close ();

  map<string, TGraphAsymmErrors *> jetEfficiency, jetFakeRate;
  for (map<string, TH1D *>::const_iterator design = jetEfficiencyNumerator.begin (); design != jetEfficiencyNumerator.end (); design++)
    {
      jetEfficiencyNumerator.at (design->first)->Rebin (REBIN_FACTOR);
      jetEfficiencyDenominator.at (design->first)->Rebin (REBIN_FACTOR);
      jetEfficiency[design->first] = new TGraphAsymmErrors (jetEfficiencyNumerator.at (design->first), jetEfficiencyDenominator.at (design->first), "cp");
      jetEfficiency.at (design->first)->SetName ("jetEfficiency");
      jetEfficiency.at (design->first)->GetXaxis ()->SetTitle ("VBF quark |#eta|");
      jetEfficiency.at (design->first)->GetYaxis ()->SetTitle ("jet PV association efficiency");
      if (design->first == "fullSim")
        setStyle (jetEfficiency.at (design->first), kBlack, 20);
      else if (design->first == "delphes")
        setStyle (jetEfficiency.at (design->first), kBlack, 24);
    }

  TPaveText *pt1 = new TPaveText(0.214824,0.840399,0.565327,0.886534,"brNDC");
  pt1->SetBorderSize(0);
  pt1->SetFillStyle(0);
  pt1->SetTextFont(62);
  pt1->SetTextSize(0.0374065);
  pt1->AddText("CMS Phase II Simulation");

  TPaveText *pt2 = new TPaveText(0.729899,0.92394,0.845477,0.971322,"brNDC");
  pt2->SetBorderSize(0);
  pt2->SetFillStyle(0);
  pt2->SetTextFont(42);
  pt2->SetTextSize(0.0374065);
  pt2->AddText("14 TeV, PU = 140");

  TPaveText *pt3 = new TPaveText(0.614322,0.7301,0.797739,0.797264,"brNDC");
  pt3->SetBorderSize(0);
  pt3->SetFillStyle(0);
  pt3->SetTextFont(42);
  pt3->SetTextSize(0.0349127);
  pt3->SetTextAlign(12);
  pt3->AddText("VBF H#rightarrow#tau#tau");
  pt3->AddText("with pixel extension");

  TLegend *leg = new TLegend (0.164573,0.7301,0.34799,0.797264,NULL,"brNDC");
  leg->SetBorderSize(0);
  leg->SetTextSize(0.0349127);
  leg->SetFillStyle(0);
  leg->AddEntry (jetEfficiency.at ("delphes"), "Delphes", "p");
  leg->AddEntry (jetEfficiency.at ("fullSim"), "full sim. (corrected PF jets)", "p");

  TCanvas *c1 = new TCanvas("c1", "c1",522,103,800,830);
  gStyle->SetOptStat(0);
  c1->Range(-0.86955,-0.1495536,5.91635,1.640625);
  c1->SetFillColor(0);
  c1->SetBorderMode(0);
  c1->SetBorderSize(2);
  c1->SetTickx(1);
  c1->SetTicky(1);
  c1->SetLeftMargin(0.1281407);
  c1->SetRightMargin(0.0678392);
  c1->SetTopMargin(0.07855362);
  c1->SetBottomMargin(0.08354115);
  c1->SetFrameFillStyle(0);
  c1->SetFrameBorderMode(0);
  c1->SetFrameFillStyle(0);
  c1->SetFrameBorderMode(0);

  c1->cd ();
  jetEfficiency.at ("delphes")->Clone ()->Draw ("ap");
  jetEfficiency.at ("fullSim")->Clone ()->Draw ("p same");
  pt1->Clone ()->Draw ("same");
  pt2->Clone ()->Draw ("same");
  pt3->Clone ()->Draw ("same");
  leg->Clone ()->Draw ("same");
}

void
invert (TH1D * const h)
{
  for (int i = 0; i <= h->GetXaxis ()->GetNbins () + 1; i++)
    {
      double content = h->GetBinContent (i),
             error = h->GetBinError (i);

      h->SetBinContent (i, 1.0 - content);
      h->SetBinError (i, error);
    }
}

template<class T> void
setStyle (T * const h, const int color, const int markerStyle, const int lineStyle)
{
  h->SetMarkerStyle (markerStyle);
  h->SetLineStyle (lineStyle);
  h->SetMarkerSize (1.5);
  h->SetLineWidth (1);
  h->SetMarkerColor (color);
  h->SetLineColor (color);

  h->GetXaxis ()->SetLabelSize (0.04);
  h->GetXaxis ()->SetTitleSize (0.04);
  h->GetYaxis ()->SetRangeUser (0.0, 5.0);

  h->GetYaxis ()->SetLabelSize (0.04);
  h->GetYaxis ()->SetTitleSize (0.04);
  h->GetYaxis ()->SetTitleOffset (1.5);
  h->GetYaxis ()->SetRangeUser (0.0, 1.5);
}

double
normCDF (double *x, double *par)
{
  double b = 0.5 * par[2] * (1.0 + TMath::Erf ((par[3] - par[0]) / (sqrt (2) * par[4]))) - par[1] * par[0];
  if (x[0] < par[0])
    return b + par[1] * x[0];
  else
    return 0.5 * par[2] * (1.0 + TMath::Erf ((par[3] - x[0]) / (sqrt (2) * par[4])));
}
  
void
foldHistogram (TH1D *h, bool zeroNegative)
{
  for (int i = 1; i <= h->GetXaxis ()->GetNbins (); i++)
    {
      double x = h->GetXaxis ()->GetBinCenter (i),
             content = h->GetBinContent (i),
             negContent = h->GetBinContent (h->GetXaxis ()->FindBin (-x)),
             error = h->GetBinError (i),
             negError = h->GetBinError (h->GetXaxis ()->FindBin (-x));
      if (x < 0.0)
        continue;
      else
        {
          h->SetBinContent (i, content + negContent);
          h->SetBinError (i, hypot (error, negError));
        }
    }
  for (int i = 1; zeroNegative && i <= h->GetXaxis ()->GetNbins (); i++)
    {
      double x = h->GetXaxis ()->GetBinCenter (i);
      if (x < 0.0)
        h->SetBinContent (i, 0.0);
        h->SetBinError (i, 1.0e-12);
    }
}
