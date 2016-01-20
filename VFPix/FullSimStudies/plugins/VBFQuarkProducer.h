#ifndef VBF_QUARK_PRODUCER
#define VBF_QUARK_PRODUCER

#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/VertexReco/interface/Vertex.h"

#include "FWCore/Framework/interface/EDProducer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/Utilities/interface/InputTag.h"

using namespace std;

class VBFQuarkProducer : public edm::EDProducer
{
  public:
    VBFQuarkProducer (const edm::ParameterSet &);
    ~VBFQuarkProducer ();

    void produce (edm::Event &, const edm::EventSetup &);

  private:
    edm::InputTag genParticles_;
    edm::InputTag jets_;
    edm::InputTag tracks_;
    edm::InputTag vertices_;

    double beta (const reco::PFJet &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, double &, double &, unsigned = 0) const;
};

#endif
