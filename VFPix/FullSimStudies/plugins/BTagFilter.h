#ifndef BTAG_FILTER
#define BTAG_FILTER

#include <unordered_map>
#include <string>

#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/TrackReco/interface/Track.h"

#include "FWCore/Framework/interface/EDFilter.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/ServiceRegistry/interface/Service.h"
#include "FWCore/Utilities/interface/InputTag.h"

#include "SimDataFormats/Track/interface/SimTrack.h"

#include "TH1D.h"
#include "TH2D.h"
#include "TH3D.h"

using namespace std;

class BTagFilter : public edm::EDFilter
{
  public:
    BTagFilter (const edm::ParameterSet &);
    ~BTagFilter ();

    bool filter (edm::Event &, const edm::EventSetup &);

  private:
    edm::Service<TFileService> fs_;
    unordered_map<string, unordered_map<string, TH1D *> > oneDHists_;
    unordered_map<string, unordered_map<string, TH2D *> > twoDHists_;
    unordered_map<string, unordered_map<string, TH3D *> > threeDHists_;

    edm::InputTag btags_;
    edm::InputTag genJets_;
    edm::InputTag jets_;
    edm::InputTag genParticles_;
    edm::InputTag tracks_;

    void logSpace (const unsigned, const double, const double, vector<double> &) const;
    void linSpace (const unsigned, const double, const double, vector<double> &) const;
    bool passesPUJetID (const reco::PFJet &, const edm::Handle<vector<reco::GenJet> > &) const;
    double ssv (const reco::PFJet &, const edm::Handle<reco::JetTagCollection> &) const;
    bool isHighPurity (const reco::Track &) const;
};

#endif
