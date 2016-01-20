#include <iostream>
#include <sstream>
#include <vector>
#include <unordered_set>
#include <unordered_map>

#include "TLorentzVector.h"

#include "DataFormats/BTauReco/interface/JetTag.h"
#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/DetId/interface/DetId.h"
#include "DataFormats/JetReco/interface/GenJet.h"
#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/SiPixelDetId/interface/PixelSubdetector.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "SimDataFormats/PileupSummaryInfo/interface/PileupSummaryInfo.h"

#include "VFPix/FullSimStudies/plugins/BTagFilter.h"

enum TrackQuality { undefQuality=-1, loose=0, tight=1, highPurity=2, confirmed=3, goodIterative=4, looseSetWithPV=5, highPuritySetWithPV=6, qualitySize=7 };

BTagFilter::BTagFilter (const edm::ParameterSet &cfg) :
  btags_ (cfg.getParameter<edm::InputTag> ("btags")),
  genJets_ (cfg.getParameter<edm::InputTag> ("genJets")),
  jets_ (cfg.getParameter<edm::InputTag> ("jets")),
  genParticles_ (cfg.getParameter<edm::InputTag> ("genParticles")),
  tracks_ (cfg.getParameter<edm::InputTag> ("tracks"))
{
  vector<double> jetPtBins;
  logSpace  (1000,  0.0,   4.0,  jetPtBins);

  TH1::SetDefaultSumw2 ();
  TFileDirectory jetDir = fs_->mkdir ("jets"),
                 jetEfficiencyDir = fs_->mkdir ("jetEfficiency"),
                 jetFakeRateDir = fs_->mkdir ("jetFakeRate");

  oneDHists_["jets"];
  oneDHists_["jetEfficiency"];
  oneDHists_["jetFakeRate"];

  oneDHists_.at ("jets")["jetEta"]   = jetDir.make<TH1D> ("jetEta", ";jet #eta", 1000, -5.0, 5.0);
  oneDHists_.at ("jets")["jetPt"]    = jetDir.make<TH1D> ("jetPt", ";jet p_{T} [GeV]", jetPtBins.size () - 1, jetPtBins.data ());
  oneDHists_.at ("jets")["jetSSV"]   = jetDir.make<TH1D> ("jetSSV", ";jet SSV discriminator", 1000, 0.0, 10.0);

  oneDHists_.at ("jetEfficiency")["bQuarkEta"]   = jetEfficiencyDir.make<TH1D> ("bQuarkEta", ";bottom quark |#eta|", 1000, 0.0, 5.0);
  oneDHists_.at ("jetEfficiency")["bJetFromBQuarkFound"]   = jetEfficiencyDir.make<TH1D> ("bJetFromBQuarkFound", ";bottom quark |#eta|", 1000, 0.0, 5.0);
  oneDHists_.at ("jetEfficiency")["jetFromBQuarkFound"]   = jetEfficiencyDir.make<TH1D> ("jetFromBQuarkFound", ";bottom quark |#eta|", 1000, 0.0, 5.0);

  oneDHists_.at ("jetFakeRate")["jetEta"]   = jetFakeRateDir.make<TH1D> ("jetEta", ";jet |#eta|", 1000, 0.0, 5.0);
  oneDHists_.at ("jetFakeRate")["jetMatchedToUDSG"]   = jetFakeRateDir.make<TH1D> ("jetMatchedToUDSG", ";jet |#eta|", 1000, 0.0, 5.0);
  oneDHists_.at ("jetFakeRate")["bJetMatchedToUDSG"]   = jetFakeRateDir.make<TH1D> ("bJetMatchedToUDSG", ";jet |#eta|", 1000, 0.0, 5.0);
}

BTagFilter::~BTagFilter ()
{
}

bool
BTagFilter::filter (edm::Event &event, const edm::EventSetup &setup)
{
  edm::Handle<reco::JetTagCollection> btags;
  event.getByLabel (btags_, btags);
  edm::Handle<vector<reco::GenJet> > genJets;
  event.getByLabel (genJets_, genJets);
  edm::Handle<vector<reco::PFJet> > jets;
  event.getByLabel (jets_, jets);
  edm::Handle<vector<reco::GenParticle> > genParticles;
  event.getByLabel (genParticles_, genParticles);
  edm::Handle<vector<reco::Track> > tracks;
  event.getByLabel (tracks_, tracks);

  for (const auto &track : *tracks)
    {
      if (!isHighPurity (track))
        continue;
      cout << "track algorithm: " << track.algoName () << endl;
    }

  for (const auto &jet : *jets)
    {
      if (!passesPUJetID (jet, genJets))
        continue;
      if (jet.pt () < 30.0)
        continue;
      if (fabs (jet.eta ()) > 5.0)
        continue;

      oneDHists_.at ("jets").at ("jetEta")->Fill (jet.eta ());
      oneDHists_.at ("jets").at ("jetPt")->Fill (jet.pt ());
      oneDHists_.at ("jets").at ("jetSSV")->Fill (ssv (jet, btags));
    }

  vector<const reco::GenParticle *> bQuarks, lightPartons;
  for (const auto &genParticle : *genParticles)
    {
      if (genParticle.status () != 3)
        continue;
      if (abs (genParticle.pdgId ()) == 5)
        bQuarks.push_back (&genParticle);
      if (abs (genParticle.pdgId ()) < 4 || abs (genParticle.pdgId ()) == 9 || abs (genParticle.pdgId ()) == 21)
        lightPartons.push_back (&genParticle);
    }

  bool isFullyEfficient = true;
  for (const auto &bQuark : bQuarks)
    {
      if (bQuark->pt () < 30.0)
        continue;

      TLorentzVector p0;
      p0.SetPtEtaPhiE (bQuark->pt (), bQuark->eta (), bQuark->phi (), bQuark->energy ());

      oneDHists_.at ("jetEfficiency").at ("bQuarkEta")->Fill (fabs (bQuark->eta ()));

      bool foundAMatch = false;
      for (const auto &jet : *jets)
        {
          if (jet.pt () < 30.0)
            continue;

          TLorentzVector p1;
          p1.SetPtEtaPhiE (jet.pt (), jet.eta (), jet.phi (), jet.energy ());

          if (p0.DeltaR (p1) > 0.4)
            continue;
          foundAMatch = true;

          oneDHists_.at ("jetEfficiency").at ("jetFromBQuarkFound")->Fill (fabs (bQuark->eta ()));
          if (ssv (jet, btags) > 0.0)
            oneDHists_.at ("jetEfficiency").at ("bJetFromBQuarkFound")->Fill (fabs (bQuark->eta ()));
          else
            isFullyEfficient = false;
        }
      isFullyEfficient = isFullyEfficient && foundAMatch;
    }

  for (const auto &jet : *jets)
    {
      if (jet.pt () < 30.0)
        continue;

      TLorentzVector p0;
      p0.SetPtEtaPhiE (jet.pt (), jet.eta (), jet.phi (), jet.energy ());

      oneDHists_.at ("jetFakeRate").at ("jetEta")->Fill (fabs (jet.eta ()));

      for (const auto &lightParton : lightPartons)
        {
          if (lightParton->pt () < 30.0)
            continue;

          TLorentzVector p1;
          p1.SetPtEtaPhiE (lightParton->pt (), lightParton->eta (), lightParton->phi (), lightParton->energy ());

          if (p0.DeltaR (p1) > 0.4)
            continue;

          oneDHists_.at ("jetFakeRate").at ("jetMatchedToUDSG")->Fill (fabs (jet.eta ()));
          if (ssv (jet, btags) > 0.0)
            oneDHists_.at ("jetFakeRate").at ("bJetMatchedToUDSG")->Fill (fabs (jet.eta ()));
        }
    }

  return isFullyEfficient;
}

void
BTagFilter::logSpace (const unsigned n, const double a, const double b, vector<double> &bins) const
{
  double step = (b - a) / ((double) n);

  bins.clear ();
  for (double i = a; i < b + 0.5 * step; i += step)
    bins.push_back (pow (10.0, i));
}

void
BTagFilter::linSpace (const unsigned n, const double a, const double b, vector<double> &bins) const
{
  double step = (b - a) / ((double) n);

  bins.clear ();
  for (double i = a; i < b + 0.5 * step; i += step)
    bins.push_back (i);
}

bool
BTagFilter::passesPUJetID (const reco::PFJet &jet, const edm::Handle<vector<reco::GenJet> > &genJets) const
{
  for (const auto &genJet : *genJets)
    {
      if (genJet.pt () < 30.0)
        continue;
      if (fabs (genJet.eta ()) > 5.0)
        continue;
      if (deltaR (genJet, jet) > 0.4)
        continue;
      return true;
    }
  return false;
}

double
BTagFilter::ssv (const reco::PFJet &jet, const edm::Handle<reco::JetTagCollection> &btags) const
{
  double closestJetDeltaR = -1.0, closestJetBTag = -999.0;
  for (const auto &btag : *btags)
    {
      double dR = deltaR (*btag.first, jet);
      if (dR < closestJetDeltaR || closestJetDeltaR < 0.0)
        {
          closestJetDeltaR = dR;
          closestJetBTag = btag.second;
        }
    }
  return (closestJetDeltaR < 1.0e-6 ? closestJetBTag : -999.0);
}

bool
BTagFilter::isHighPurity (const reco::Track &track) const
{
  return (track.qualityMask () & (1 << TrackQuality::highPurity)) >> TrackQuality::highPurity;
}

#include "FWCore/Framework/interface/MakerMacros.h"
DEFINE_FWK_MODULE(BTagFilter);
