#ifndef VFPIX_ANALYZER_TWO_VERTEX_ALGOS
#define VFPIX_ANALYZER_TWO_VERTEX_ALGOS

#include <unordered_map>
#include <string>

#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/JetReco/interface/TrackJet.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/VertexReco/interface/Vertex.h"

#include "FWCore/Framework/interface/EDAnalyzer.h"
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

class VFPixAnalyzerTwoVertexAlgo : public edm::EDAnalyzer
{
  public:
    VFPixAnalyzerTwoVertexAlgo (const edm::ParameterSet &);
    ~VFPixAnalyzerTwoVertexAlgo ();

    void analyze (const edm::Event &, const edm::EventSetup &);

  private:
    edm::Service<TFileService> fs_;
    unordered_map<string, TH1D *> oneDHists_;
    unordered_map<string, TH2D *> twoDHists_;
    unordered_map<string, TH3D *> threeDHists_;

    edm::InputTag jets_;
    edm::InputTag trackJets_;
    edm::InputTag pus_;
    edm::InputTag verticesFullSim_;
    edm::InputTag verticesDelphes_;
    edm::InputTag tracks_;
    edm::InputTag genParticles_;
    edm::InputTag simTracks_;

    void logSpace (const unsigned, const double, const double, vector<double> &) const;
    void linSpace (const unsigned, const double, const double, vector<double> &) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<reco::GenParticle> > &, const unsigned, const double, const reco::GenParticle *&) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<SimTrack> > &, const double, const SimTrack *&) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<SimTrack> > &, const double) const;
    double beta (const reco::PFJet &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, unsigned = 0) const;
    double betaStar (const reco::PFJet &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, unsigned = 0) const;
    double beta (const reco::TrackJet &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, unsigned = 0) const;
    double betaStar (const reco::TrackJet &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, unsigned = 0) const;
    void fillTrackHistograms (const reco::PFJet &, const edm::Handle<vector<reco::Track> > &, const reco::Vertex &) const;
    void fillTrackHistograms (const reco::TrackJet &, const edm::Handle<vector<reco::Track> > &, const reco::Vertex &) const;
};

#endif
