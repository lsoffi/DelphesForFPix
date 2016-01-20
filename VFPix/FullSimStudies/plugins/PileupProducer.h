#ifndef PILEUP_PRODUCER
#define PILEUP_PRODUCER

#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/TrackReco/interface/Track.h"

#include "FWCore/Framework/interface/EDProducer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/Utilities/interface/InputTag.h"

#include "SimDataFormats/Track/interface/SimTrack.h"

using namespace std;

class PileupProducer : public edm::EDProducer
{
  public:
    PileupProducer (const edm::ParameterSet &);
    ~PileupProducer ();

    void produce (edm::Event &, const edm::EventSetup &);

  private:
    edm::InputTag tracks_;
    edm::InputTag pfCandidates_;
    edm::InputTag genParticles_;
    edm::InputTag simTracks_;

    bool isMatched (const reco::Track &, const edm::Handle<vector<SimTrack> > &, const double) const;
    bool isMatched (const reco::PFCandidate &, const edm::Handle<vector<reco::GenParticle> > &, const double) const;
};

#endif
