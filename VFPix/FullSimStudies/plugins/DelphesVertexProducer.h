#ifndef DELPHES_VERTEX_PRODUCER
#define DELPHES_VERTEX_PRODUCER

#include <map>
#include <vector>
#include <unordered_set>

#include "DataFormats/Common/interface/Handle.h"

#include "FWCore/Framework/interface/EDProducer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/Utilities/interface/InputTag.h"

using namespace std;

class DelphesVertexProducer : public edm::EDProducer
{
  public:
    DelphesVertexProducer (const edm::ParameterSet &);
    ~DelphesVertexProducer ();

    void produce (edm::Event &, const edm::EventSetup &);

    static bool secondAscending (pair<unsigned, double>, pair<unsigned, double>);
    static bool secondDescending (pair<unsigned, double>, pair<unsigned, double>);

  private:
    edm::InputTag tracks_;

    double fSigma;
    double fMinPT;
    double fMaxEta;
    double fSeedMinPT;
    int fMinNDF;
    int fGrowSeeds;

    map<unsigned, map<string, double> > trackIDToDouble;
    map<unsigned, map<string, int> > trackIDToInt;
    map<unsigned, map<string, bool> > trackIDToBool;

    map<unsigned, map<string, double> > clusterIDToDouble;
    map<unsigned, map<string, int> > clusterIDToInt;
    map<unsigned, map<string, bool> > clusterIDToBool;
    map<unsigned, unordered_set<unsigned> > clusterIDToSet;
    vector<pair<unsigned, double> > trackPT;
    vector<pair<unsigned, double> > clusterSumPT2;

    void createSeeds (const edm::Handle<edm::View<reco::Track> > &);
    void growCluster (const unsigned);
    double weight (const unsigned);
    void removeTrackFromCluster (const unsigned, const unsigned);
    void addTrackToCluster (const unsigned, const unsigned);
};

#endif
