#ifndef VFPIX_ANALYZER
#define VFPIX_ANALYZER

#include <unordered_map>
#include <string>

#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include "DataFormats/HepMCCandidate/interface/GenParticle.h"
#include "DataFormats/JetReco/interface/PFJet.h"
#include "DataFormats/JetReco/interface/TrackJet.h"
#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"
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

class VFPixAnalyzer : public edm::EDAnalyzer
{
  public:
    VFPixAnalyzer (const edm::ParameterSet &);
    ~VFPixAnalyzer ();

    void analyze (const edm::Event &, const edm::EventSetup &);

  private:
    edm::Service<TFileService> fs_;
    unordered_map<string, TH1D *> oneDHists_;
    unordered_map<string, TH2D *> twoDHists_;
    unordered_map<string, TH3D *> threeDHists_;

    edm::InputTag jets_;
    edm::InputTag jetsNoCHS_;
    edm::InputTag trackJets_;
    edm::InputTag pus_;
    edm::InputTag vertices_;
    edm::InputTag tracks_;
    edm::InputTag genParticles_;
    edm::InputTag simTracks_;
    edm::InputTag pfCandidates_;

    void logSpace (const unsigned, const double, const double, vector<double> &) const;
    void linSpace (const unsigned, const double, const double, vector<double> &) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<reco::GenParticle> > &, const unsigned, const double, const reco::GenParticle *&) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<SimTrack> > &, const double, const SimTrack *&) const;
    bool isMatched (const reco::Track &, const edm::Handle<vector<SimTrack> > &, const double) const;
    template<class T> double beta (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, double &, double &, unsigned = 0) const;
    template<class T> double betaStar (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, double &, double &, unsigned = 0) const;
    template<class T> double beta_dz (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, const double, double &, double &, unsigned = 0) const;
    template<class T> double betaStar_dz (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, const double, double &, double &, unsigned = 0) const;
    template<class T> double beta_dzSig (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, const double, double &, double &, unsigned = 0) const;
    template<class T> double betaStar_dzSig (const T &, const edm::Handle<vector<reco::Track> > &, const edm::Handle<vector<reco::Vertex> > &, const double, double &, double &, unsigned = 0) const;
    template<class T> void fillTrackHistograms (const T &, const edm::Handle<vector<reco::Track> > &, const reco::Vertex &) const;
    double genSumPt2 (const vector<reco::GenParticle> &) const;
    bool isGoodTrack (const reco::Track &, const bool = true) const;
    bool isMatchedToTrack (const reco::GenParticle &, const vector<reco::Track> &, const double) const;
    bool isMatchedToPFChargedHadron (const reco::GenParticle &, const vector<reco::PFCandidate> &, const double, bool &) const;
};

#endif
