#include <iostream>

#include "VFPix/FullSimStudies/plugins/VBFQuarkProducer.h"

VBFQuarkProducer::VBFQuarkProducer (const edm::ParameterSet &cfg) :
  genParticles_ (cfg.getParameter<edm::InputTag> ("genParticles")),
  jets_ (cfg.getParameter<edm::InputTag> ("jets")),
  tracks_ (cfg.getParameter<edm::InputTag> ("tracks")),
  vertices_ (cfg.getParameter<edm::InputTag> ("vertices"))
{
  produces<vector<reco::GenParticle> > ("vbfQuarks");
  produces<vector<reco::PFJet> > ("vbfJets");
  produces<vector<reco::Track> > ("vbfJetsTracks");
  produces<vector<reco::PFJet> > ("pileupJets");
  produces<vector<reco::PFJet> > ("highSumPtPileupJets");
  produces<vector<reco::Track> > ("highSumPtPileupJetsTracks");
  produces<vector<reco::Track> > ("pvTracks");
}

VBFQuarkProducer::~VBFQuarkProducer ()
{
}

void
VBFQuarkProducer::produce (edm::Event &event, const edm::EventSetup &setup)
{
  edm::Handle<vector<reco::GenParticle> > genParticles;
  event.getByLabel (genParticles_, genParticles);
  edm::Handle<vector<reco::PFJet> > jets;
  event.getByLabel (jets_, jets);
  edm::Handle<vector<reco::Track> > tracks;
  event.getByLabel (tracks_, tracks);
  edm::Handle<vector<reco::Vertex> > vertices;
  event.getByLabel (vertices_, vertices);

  auto_ptr<vector<reco::GenParticle> > vbfQuarks (new vector<reco::GenParticle> ());
  auto_ptr<vector<reco::PFJet> > vbfJets (new vector<reco::PFJet> ());
  auto_ptr<vector<reco::Track> > vbfJetsTracks (new vector<reco::Track> ());
  auto_ptr<vector<reco::PFJet> > pileupJets (new vector<reco::PFJet> ());
  auto_ptr<vector<reco::PFJet> > highSumPtPileupJets (new vector<reco::PFJet> ());
  auto_ptr<vector<reco::Track> > highSumPtPileupJetsTracks (new vector<reco::Track> ());
  auto_ptr<vector<reco::Track> > pvTracks (new vector<reco::Track> ());

  double sumptch, sumptchpv;

  for (const auto &particle : *genParticles)
    {
      int status = particle.status (),
          pid = particle.pdgId ();

      bool isVBFquark = false ; 
      if ( status == 3 && abs(pid) < 10 && particle.numberOfMothers() > 0 ) { 
        for (unsigned int j=0; !isVBFquark && j<particle.numberOfMothers(); j++) {
          for (unsigned int k=0; k<particle.mother(j)->numberOfDaughters(); k++) {
            if ( abs(particle.mother(j)->daughter(k)->pdgId()) == 25 ) {
              isVBFquark = true ; break ;
            }
          }
        }
      }
      if (isVBFquark)
        vbfQuarks->push_back (particle);
    }
  for (const auto &quark : *vbfQuarks)
    {
      if (quark.pt () < 30.0)
        continue;

      const reco::PFJet *closestJet = NULL;
      double closestJetDeltaR = -1.0;
      for (const auto &jet : *jets)
        {
          double dR;

          if (jet.pt () < 30.0)
            continue;

          dR = deltaR (quark, jet);

          if (dR > 0.4)
            continue;

          if (dR < closestJetDeltaR || !closestJet)
            {
              closestJetDeltaR = dR;
              closestJet = &jet;
            }
        }
      if (!closestJet)
        continue;
      vbfJets->push_back (*closestJet);
    }

  for (const auto &jet : *jets)
    {
      double dR;

      if (jet.pt () < 30.0)
        continue;

      bool isMatched = false;
      for (const auto &quark : *vbfQuarks)
        {
          dR = deltaR (quark, jet);

          if ((isMatched = (dR < 0.4)))
            break;
        }
      if (isMatched)
        continue;
      pileupJets->push_back (jet);
      beta (jet, tracks, vertices, sumptch, sumptchpv);
      if (sumptch < 80.0)
        continue;
      highSumPtPileupJets->push_back (jet);
    }
  for (const auto &track : *tracks)
    {
      if (track.pt () < 0.7)
        continue;
      if (track.normalizedChi2 () > 20.0)
        continue;
      if (track.hitPattern ().pixelLayersWithMeasurement () < 2)
        continue;
      if (track.hitPattern ().trackerLayersWithMeasurement () < 5)
        continue;
      if (fabs (track.d0 () / track.d0Error ()) > 5.0)
        continue;
      for (const auto &jet : *vbfJets)
        {
          if (deltaR (track, jet) > 0.4)
            continue;
          vbfJetsTracks->push_back (track);
        }
      for (const auto &jet : *highSumPtPileupJets)
        {
          if (deltaR (track, jet) > 0.4)
            continue;
          highSumPtPileupJetsTracks->push_back (track);
        }
    }
  for (auto track = vertices->at (0).tracks_begin (); track != vertices->at (0).tracks_end (); track++)
    {
      if ((*track)->pt () < 0.7)
        continue;
      if ((*track)->normalizedChi2 () > 20.0)
        continue;
      if ((*track)->hitPattern ().pixelLayersWithMeasurement () < 2)
        continue;
      if ((*track)->hitPattern ().trackerLayersWithMeasurement () < 5)
        continue;
      if (fabs ((*track)->d0 () / (*track)->d0Error ()) > 5.0)
        continue;
      pvTracks->push_back (**track);
    }

  event.put (vbfQuarks, "vbfQuarks");
  event.put (vbfJets, "vbfJets");
  event.put (vbfJetsTracks, "vbfJetsTracks");
  event.put (pileupJets, "pileupJets");
  event.put (highSumPtPileupJets, "highSumPtPileupJets");
  event.put (highSumPtPileupJetsTracks, "highSumPtPileupJetsTracks");
  event.put (pvTracks, "pvTracks");
}

double
VBFQuarkProducer::beta (const reco::PFJet &jet, const edm::Handle<vector<reco::Track> > &tracks, const edm::Handle<vector<reco::Vertex> > &vertices, double &sumptch, double &sumptchpv, unsigned vertexIndex) const
{
  sumptchpv = sumptch = 0.0;
  for (const auto &track : *tracks)
    {
      if (track.pt () < 0.7)
        continue;
      if (track.normalizedChi2 () > 20.0)
        continue;
      if (track.hitPattern ().pixelLayersWithMeasurement () < 2)
        continue;
      if (track.hitPattern ().trackerLayersWithMeasurement () < 5)
        continue;
      if (fabs (track.d0 () / track.d0Error ()) > 5.0)
        continue;
      if (deltaR (track, jet) > 0.4)
        continue;
      sumptch += track.pt ();
    }
  if (vertices->size () > 0)
    {
      for (auto track = vertices->at (vertexIndex).tracks_begin (); track != vertices->at (vertexIndex).tracks_end (); track++)
        {
          if ((*track)->pt () < 0.7)
            continue;
          if ((*track)->normalizedChi2 () > 20.0)
            continue;
          if ((*track)->hitPattern ().pixelLayersWithMeasurement () < 2)
            continue;
          if ((*track)->hitPattern ().trackerLayersWithMeasurement () < 5)
            continue;
          if (fabs ((*track)->d0 () / (*track)->d0Error ()) > 5.0)
            continue;
          if (deltaR (**track, jet) > 0.4)
            continue;
          sumptchpv += (*track)->pt ();
        }
    }

  return (sumptch > 0.0 ? (sumptchpv / sumptch) : -999.0);
}

#include "FWCore/Framework/interface/MakerMacros.h"
DEFINE_FWK_MODULE(VBFQuarkProducer);
