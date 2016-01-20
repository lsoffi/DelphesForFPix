#include <iostream>
#include <sstream>
#include <vector>
#include <unordered_set>

#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/DetId/interface/DetId.h"
#include "DataFormats/SiPixelDetId/interface/PixelSubdetector.h"
#include "SimDataFormats/PileupSummaryInfo/interface/PileupSummaryInfo.h"

#include "VFPix/FullSimStudies/plugins/VFPixAnalyzerTwoVertexAlgo.h"

VFPixAnalyzerTwoVertexAlgo::VFPixAnalyzerTwoVertexAlgo (const edm::ParameterSet &cfg) :
  jets_ (cfg.getParameter<edm::InputTag> ("jets")),
  trackJets_ (cfg.getParameter<edm::InputTag> ("trackJets")),
  pus_ (cfg.getParameter<edm::InputTag> ("pus")),
  verticesFullSim_ (cfg.getParameter<edm::InputTag> ("verticesFullSim")),
  verticesDelphes_ (cfg.getParameter<edm::InputTag> ("verticesDelphes")),
  tracks_ (cfg.getParameter<edm::InputTag> ("tracks")),
  genParticles_ (cfg.getParameter<edm::InputTag> ("genParticles")),
  simTracks_ (cfg.getParameter<edm::InputTag> ("simTracks"))
{
  vector<double> jetPtBins, trackPtBins, fineTrackPtBins, vertexPt2Bins, vertexTrackPtBins, ptErrorBins, d0ErrorBins, dzErrorBins, xErrorBins, yErrorBins, trackErrorPtBins, trackErrorBins, trackEtaBins,
                 ptDeltaBins, d0DeltaBins, dzDeltaBins, trackDeltaPtBins, trackDeltaBins;
  logSpace  (100,  0.0,   4.0,  jetPtBins);
  logSpace  (100,   -1.0,  1.0,  trackPtBins);
  logSpace  (100,  -1.0,  3.0,  fineTrackPtBins);
  logSpace  (100,  -1.0,  8.0,  vertexPt2Bins);
  logSpace  (100,  -2.0,  2.0,  vertexTrackPtBins);
  logSpace  (100,  -2.0,  5.0,  ptErrorBins);
  logSpace  (100,  -5.0,  0.0,  d0ErrorBins);
  logSpace  (100,  -5.0,  1.0,  dzErrorBins);
  linSpace  (100,  -10.0, 10.0,  ptDeltaBins);
  linSpace  (100,  -0.1,  0.1,  d0DeltaBins);
  linSpace  (100,  -0.05,  0.05,  dzDeltaBins);
  logSpace  (100,  -5.0,  1.0,  xErrorBins);
  logSpace  (100,  -5.0,  1.0,  yErrorBins);
  logSpace  (100,   -1.0,  3.0,  trackErrorPtBins);
  logSpace  (100,  -6.0,  6.0,  trackErrorBins);

  linSpace  (50,    0.0,   5.0,  trackEtaBins);

  TH1::SetDefaultSumw2 ();
  TFileDirectory vertexDir = fs_->mkdir ("vertices");

  twoDHists_["pvX"] = vertexDir.make<TH2D> ("pvX", ";delphes PV x [cm];full-sim PV x [cm]", 100, -0.1, 0.1, 100, -0.1, 0.1);
  twoDHists_["pvY"] = vertexDir.make<TH2D> ("pvY", ";delphes PV y [cm];full-sim PV y [cm]", 100, -0.1, 0.1, 100, -0.1, 0.1);
  twoDHists_["pvZ"] = vertexDir.make<TH2D> ("pvZ", ";delphes PV z [cm];full-sim PV z [cm]", 100, -30.0, 30.0, 100, -30.0, 30.0);
  twoDHists_["pvXError"] = vertexDir.make<TH2D> ("pvXError", ";delphes PV #sigma_{x} [cm];full-sim PV #sigma_{x} [cm]", 100, 0.0, 0.01, 100, 0.0, 0.01);
  twoDHists_["pvYError"] = vertexDir.make<TH2D> ("pvYError", ";delphes PV #sigma_{y} [cm];full-sim PV #sigma_{y} [cm]", 100, 0.0, 0.01, 100, 0.0, 0.01);
  twoDHists_["pvZError"] = vertexDir.make<TH2D> ("pvZError", ";delphes PV #sigma_{z} [cm];full-sim PV #sigma_{z} [cm]", 100, 0.0, 0.1, 100, 0.0, 0.1);
  twoDHists_["pvDeltaX"] = vertexDir.make<TH2D> ("pvDeltaX", ";delphes PV x_{true} - x_{reco} [cm];full-sim PV x_{true} - x_{reco} [cm]", 100, -0.1, 0.1, 100, -0.1, 0.1);
  twoDHists_["pvDeltaY"] = vertexDir.make<TH2D> ("pvDeltaY", ";delphes PV y_{true} - y_{reco} [cm];full-sim PV y_{true} - y_{reco} [cm]", 100, -0.1, 0.1, 100, -0.1, 0.1);
  twoDHists_["pvDeltaZ"] = vertexDir.make<TH2D> ("pvDeltaZ", ";delphes PV z_{true} - z_{reco} [cm];full-sim PV z_{true} - z_{reco} [cm]", 100, -20.0, 20.0, 100, -20.0, 20.0);
  twoDHists_["pvNDF"] = vertexDir.make<TH2D> ("pvNDF", ";delphes PV NDF;full-sim PV NDF", 100, 0.0, 500.0, 100, 0.0, 500.0);
  twoDHists_["pvNTracks"] = vertexDir.make<TH2D> ("pvNTracks", ";delphes PV number of tracks;full-sim PV number of tracks", 300, 0.0, 300.0, 300, 0.0, 300.0);
  twoDHists_["pvSumPt2"] = vertexDir.make<TH2D> ("pvSumPt2", ";delphes PV #sump_{T}^{2} [GeV^{2}];full-sim PV #sump_{T}^{2} [GeV^{2}]", 100, 0.0, 100000.0, 100, 0.0, 100000.0 );
}

VFPixAnalyzerTwoVertexAlgo::~VFPixAnalyzerTwoVertexAlgo ()
{
}

void
VFPixAnalyzerTwoVertexAlgo::analyze (const edm::Event &event, const edm::EventSetup &setup)
{
  // edm::Handle<vector<reco::PFJet> > jets;
  // event.getByLabel (jets_, jets);
  // edm::Handle<vector<reco::TrackJet> > trackJets;
  // event.getByLabel (trackJets_, trackJets);
  // edm::Handle<vector<PileupSummaryInfo> > pus;
  // event.getByLabel (pus_, pus);
  edm::Handle<vector<reco::Vertex> > verticesFullSim;
  event.getByLabel (verticesFullSim_, verticesFullSim);
  edm::Handle<vector<reco::Vertex> > verticesDelphes;
  event.getByLabel (verticesDelphes_, verticesDelphes);
  edm::Handle<vector<reco::Track> > tracks;
  event.getByLabel (tracks_, tracks);
  edm::Handle<vector<reco::GenParticle> > genParticles;
  event.getByLabel (genParticles_, genParticles);
  // edm::Handle<vector<SimTrack> > simTracks;
  // event.getByLabel (simTracks_, simTracks);

  double pvTrueX = genParticles->at (2).vx (),
         pvTrueY = genParticles->at (2).vy (),
         pvTrueZ = genParticles->at (2).vz ();
  //  unordered_set<long long> pvTrackID;

  if (verticesFullSim->size () > 0 && verticesDelphes->size () > 0)
    {

      double x_f = verticesFullSim->at (0).x (),
             y_f = verticesFullSim->at (0).y (),
             z_f = verticesFullSim->at (0).z (),
             ex_f = verticesFullSim->at (0).xError (),
             ey_f = verticesFullSim->at (0).yError (),
             ez_f = verticesFullSim->at (0).zError (),
             sumPt2_f = 0.0;
      int ndf_f = verticesFullSim->at (0).ndof (),
          nTracks_f = 0;

      double x_d = verticesDelphes->at (0).x (),
             y_d = verticesDelphes->at (0).y (),
             z_d = verticesDelphes->at (0).z (),
             ex_d = verticesDelphes->at (0).xError (),
             ey_d = verticesDelphes->at (0).yError (),
             ez_d = verticesDelphes->at (0).zError (),
             sumPt2_d = 0.0;
      int ndf_d = verticesDelphes->at (0).ndof (),
          nTracks_d = 0;


      if (ndf_f >= 0 && ndf_d >= 0)
        {
          twoDHists_.at ("pvX")->Fill (x_d,x_f);
          twoDHists_.at ("pvY")->Fill (y_d,y_f);
          twoDHists_.at ("pvZ")->Fill (z_d,z_f);
          twoDHists_.at ("pvXError")->Fill (ex_d,ex_f);
          twoDHists_.at ("pvYError")->Fill (ey_d,ey_f);
          twoDHists_.at ("pvZError")->Fill (ez_d,ez_f);
          twoDHists_.at ("pvDeltaX")->Fill (pvTrueX-x_d,pvTrueX-x_f);
          twoDHists_.at ("pvDeltaY")->Fill (pvTrueY-y_d,pvTrueY-y_f);
          twoDHists_.at ("pvDeltaZ")->Fill (pvTrueZ-z_d,pvTrueZ-z_f);
          twoDHists_.at ("pvNDF")->Fill (ndf_d,ndf_f);

          for (auto track = verticesFullSim->at (0).tracks_begin (); track != verticesFullSim->at (0).tracks_end (); track++)
            {
              double pt = (*track)->pt ();

              if (pt < 0.7)
                continue;
              nTracks_f++;
              sumPt2_f += pt * pt;
            }

          for (auto track = verticesDelphes->at (0).tracks_begin (); track != verticesDelphes->at (0).tracks_end (); track++)
            {
              double pt = (*track)->pt ();

              if (pt < 0.7)
                continue;
              nTracks_d++;
              sumPt2_d += pt * pt;
            }


          twoDHists_.at ("pvNTracks")->Fill (nTracks_d,nTracks_f);
          twoDHists_.at ("pvSumPt2")->Fill (sumPt2_d, sumPt2_f);


        }
    }
}

void
VFPixAnalyzerTwoVertexAlgo::logSpace (const unsigned n, const double a, const double b, vector<double> &bins) const
{
  double step = (b - a) / ((double) n);

  bins.clear ();
  for (double i = a; i < b + 0.5 * step; i += step)
    bins.push_back (pow (10.0, i));
}

void
VFPixAnalyzerTwoVertexAlgo::linSpace (const unsigned n, const double a, const double b, vector<double> &bins) const
{
  double step = (b - a) / ((double) n);

  bins.clear ();
  for (double i = a; i < b + 0.5 * step; i += step)
    bins.push_back (i);
}

bool
VFPixAnalyzerTwoVertexAlgo::isMatched (const reco::Track &track, const edm::Handle<vector<reco::GenParticle> > &genParticles, const unsigned id, const double maxDeltaR, const reco::GenParticle *&closest) const
{
  double minDeltaR = 999.9;
  closest = NULL;
  for (const auto &genParticle : *genParticles)
    {
      if (abs (genParticle.pdgId ()) != (int) id
       || genParticle.status () != 1
       || genParticle.numberOfDaughters () != 0)
        continue;

      double dR = deltaR (track, genParticle);
      if (dR < minDeltaR)
        {
          minDeltaR = dR;
          closest = &genParticle;
        }

    }
  if (minDeltaR < maxDeltaR)
    return true;
  return false;
}

bool
VFPixAnalyzerTwoVertexAlgo::isMatched (const reco::Track &track, const edm::Handle<vector<SimTrack> > &simTracks, const double maxDeltaR, const SimTrack *&closest) const
{
  double minDeltaR = 999.9;
  closest = NULL;
  for (const auto &simTrack : *simTracks)
    {
      double dR = deltaR (track.eta (), track.phi (), simTrack.momentum ().Eta (), simTrack.momentum ().Phi ());
      if (dR < minDeltaR)
        {
          minDeltaR = dR;
          closest = &simTrack;
        }
    }
  if (minDeltaR < maxDeltaR)
    return true;
  return false;
}

bool
VFPixAnalyzerTwoVertexAlgo::isMatched (const reco::Track &track, const edm::Handle<vector<SimTrack> > &simTracks, const double maxDeltaR) const
{
  for (const auto &simTrack : *simTracks)
    {
      double dR = deltaR (track.eta (), track.phi (), simTrack.momentum ().Eta (), simTrack.momentum ().Phi ());
      if (dR < maxDeltaR)
        return true;
    }
  return false;
}

double
VFPixAnalyzerTwoVertexAlgo::beta (const reco::PFJet &jet, const edm::Handle<vector<reco::Track> > &tracks, const edm::Handle<vector<reco::Vertex> > &vertices, unsigned vertexIndex) const
{
  double sumptchpv = 0.0, sumptch = 0.0;
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

double
VFPixAnalyzerTwoVertexAlgo::betaStar (const reco::PFJet &jet, const edm::Handle<vector<reco::Track> > &tracks, const edm::Handle<vector<reco::Vertex> > &vertices, unsigned vertexIndex) const
{
  double sumptchpu = 0.0, sumptch = 0.0;
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

      if (vertices->size () > 0)
        {
          unsigned iVertex = 0;
          bool fromOtherVertex = false;
          for (const auto vertex : *vertices)
            {
              if ((iVertex++) == vertexIndex)
                continue;
              for (auto pvTrack = vertex.tracks_begin (); !fromOtherVertex && pvTrack != vertex.tracks_end (); pvTrack++)
                fromOtherVertex = (deltaR (track, **pvTrack) < 1.0e-12);
              if (fromOtherVertex)
                break;
            }
          if (!fromOtherVertex)
            sumptchpu += track.pt ();
        }
    }

  return (sumptch > 0.0 ? (sumptchpu / sumptch) : -999.0);
}

double
VFPixAnalyzerTwoVertexAlgo::beta (const reco::TrackJet &jet, const edm::Handle<vector<reco::Track> > &tracks, const edm::Handle<vector<reco::Vertex> > &vertices, unsigned vertexIndex) const
{
  double sumptchpv = 0.0, sumptch = 0.0;
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

double
VFPixAnalyzerTwoVertexAlgo::betaStar (const reco::TrackJet &jet, const edm::Handle<vector<reco::Track> > &tracks, const edm::Handle<vector<reco::Vertex> > &vertices, unsigned vertexIndex) const
{
  double sumptchpu = 0.0, sumptch = 0.0;
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

      if (vertices->size () > 0)
        {
          unsigned iVertex = 0;
          bool fromOtherVertex = false;
          for (const auto vertex : *vertices)
            {
              if ((iVertex++) == vertexIndex)
                continue;
              for (auto pvTrack = vertex.tracks_begin (); !fromOtherVertex && pvTrack != vertex.tracks_end (); pvTrack++)
                fromOtherVertex = (deltaR (track, **pvTrack) < 1.0e-12);
              if (fromOtherVertex)
                break;
            }
          if (!fromOtherVertex)
            sumptchpu += track.pt ();
        }
    }

  return (sumptch > 0.0 ? (sumptchpu / sumptch) : -999.0);
}


#include "FWCore/Framework/interface/MakerMacros.h"
DEFINE_FWK_MODULE(VFPixAnalyzerTwoVertexAlgo);
