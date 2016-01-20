#include <iostream>

#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"

#include "VFPix/FullSimStudies/plugins/PileupProducer.h"

PileupProducer::PileupProducer (const edm::ParameterSet &cfg) :
  tracks_ (cfg.getParameter<edm::InputTag> ("tracks")),
  pfCandidates_ (cfg.getParameter<edm::InputTag> ("pfCandidates")),
  genParticles_ (cfg.getParameter<edm::InputTag> ("genParticles")),
  simTracks_ (cfg.getParameter<edm::InputTag> ("simTracks"))
{
  produces<vector<reco::Track> > ("pileupTracks");
  produces<vector<reco::Track> > ("primaryTracks");
  produces<vector<reco::PFCandidate> > ("pileupNeutrals");
  produces<vector<reco::PFCandidate> > ("primaryNeutrals");
  produces<vector<reco::GenParticle> > ("status3");
}

PileupProducer::~PileupProducer ()
{
}

void
PileupProducer::produce (edm::Event &event, const edm::EventSetup &setup)
{
  edm::Handle<vector<reco::Track> > tracks;
  event.getByLabel (tracks_, tracks);
  edm::Handle<vector<reco::PFCandidate> > pfCandidates;
  event.getByLabel (pfCandidates_, pfCandidates);
  edm::Handle<vector<reco::GenParticle> > genParticles;
  event.getByLabel (genParticles_, genParticles);
  edm::Handle<vector<SimTrack> > simTracks;
  event.getByLabel (simTracks_, simTracks);

  auto_ptr<vector<reco::Track> > pileupTracks (new vector<reco::Track> ());
  auto_ptr<vector<reco::Track> > primaryTracks (new vector<reco::Track> ());
  auto_ptr<vector<reco::PFCandidate> > pileupNeutrals (new vector<reco::PFCandidate> ());
  auto_ptr<vector<reco::PFCandidate> > primaryNeutrals (new vector<reco::PFCandidate> ());
  auto_ptr<vector<reco::GenParticle> > status3 (new vector<reco::GenParticle> ());

  for (const auto &track : *tracks)
    {
      if (!isMatched (track, simTracks, 0.01))
        pileupTracks->push_back (track);
      else
        primaryTracks->push_back (track);
    }
  for (const auto &pfCandidate : *pfCandidates)
    {
      if (pfCandidate.charge ())
        continue;
      if (!isMatched (pfCandidate, genParticles, 0.01))
        pileupNeutrals->push_back (pfCandidate);
      else
        primaryNeutrals->push_back (pfCandidate);
    }
  for (const auto &genParticle : *genParticles)
    {
      if (genParticle.status () != 3)
        break;
      status3->push_back (genParticle);
    }
  event.put (pileupTracks, "pileupTracks");
  event.put (primaryTracks, "primaryTracks");
  event.put (pileupNeutrals, "pileupNeutrals");
  event.put (primaryNeutrals, "primaryNeutrals");
  event.put (status3, "status3");
}

bool
PileupProducer::isMatched (const reco::Track &track, const edm::Handle<vector<SimTrack> > &simTracks, const double maxDeltaR) const
{
  for (const auto &simTrack : *simTracks)
    {
      double dR = deltaR (track.eta (), track.phi (), simTrack.momentum ().Eta (), simTrack.momentum ().Phi ());
      if (dR > maxDeltaR)
        continue;

      return true;
    }
  return false;
}

bool
PileupProducer::isMatched (const reco::PFCandidate &pfCandidate, const edm::Handle<vector<reco::GenParticle> > &genParticles, const double maxDeltaR) const
{
  for (const auto &genParticle : *genParticles)
    {
      if (genParticle.status () != 1
       || genParticle.numberOfDaughters () != 0
       || (genParticle.charge () != 0 && pfCandidate.charge () == 0)
       || (genParticle.charge () == 0 && pfCandidate.charge () != 0))
        continue;

      double dR = deltaR (pfCandidate, genParticle);
      if (dR > maxDeltaR)
        continue;

      return true;
    }
  return false;
}

#include "FWCore/Framework/interface/MakerMacros.h"
DEFINE_FWK_MODULE(PileupProducer);
