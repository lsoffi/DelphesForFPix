#include <iostream>

#include "DataFormats/Math/interface/deltaR.h"
#include "DataFormats/Math/interface/Error.h"
#include "DataFormats/Math/interface/Point3D.h"
#include "DataFormats/TrackReco/interface/Track.h"
#include "DataFormats/VertexReco/interface/Vertex.h"

#include "VFPix/FullSimStudies/plugins/DelphesVertexProducer.h"

DelphesVertexProducer::DelphesVertexProducer (const edm::ParameterSet &cfg) :
  tracks_ (cfg.getParameter<edm::InputTag> ("tracks")),
  fSigma (cfg.getParameter<double> ("sigma")),
  fMinPT (cfg.getParameter<double> ("minPT")),
  fMaxEta (cfg.getParameter<double> ("maxEta")),
  fSeedMinPT (cfg.getParameter<double> ("seedMinPT")),
  fMinNDF (cfg.getParameter<int> ("minNDF")),
  fGrowSeeds (cfg.getParameter<int> ("growSeeds"))
{
  produces<vector<reco::Vertex> > ("");
}

DelphesVertexProducer::~DelphesVertexProducer ()
{
}

void
DelphesVertexProducer::produce (edm::Event &event, const edm::EventSetup &setup)
{
  edm::Handle<edm::View<reco::Track> > tracks;
  event.getByLabel (tracks_, tracks);

  auto_ptr<vector<reco::Vertex> > delphesVertices (new vector<reco::Vertex> ());

  reco::Vertex *candidate = NULL;

////////////////////////////////////////////////////////////////////////////////
// Clear the track and cluster maps before starting
////////////////////////////////////////////////////////////////////////////////
  trackIDToDouble.clear ();
  trackIDToInt.clear ();
  trackIDToBool.clear ();
  clusterIDToDouble.clear ();
  clusterIDToInt.clear ();
  clusterIDToBool.clear ();
  clusterIDToSet.clear ();
  trackPT.clear ();
  clusterSumPT2.clear ();
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Create the initial cluster seeds
////////////////////////////////////////////////////////////////////////////////
  createSeeds (tracks);
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// In order of descending seed pt, grow each cluster. If a cluster ends up with
// fewer than MinNDF tracks, release the tracks for other clusters to claim.
////////////////////////////////////////////////////////////////////////////////
  sort (clusterSumPT2.begin (), clusterSumPT2.end (), secondDescending);
  for (vector<pair<unsigned, double> >::const_iterator cluster = clusterSumPT2.begin (); cluster != clusterSumPT2.end (); cluster++)
    {
      // Skip the cluster if it no longer has any tracks
      if (!clusterIDToInt.at (cluster->first).at ("ndf"))
        continue;
      // Grow the cluster if GrowSeeds is true
      if (fGrowSeeds)
        growCluster (cluster->first);

      // If the cluster still has fewer than MinNDF tracks, release the tracks;
      // otherwise, mark the seed track as claimed
      if ((int) clusterIDToInt.at (cluster->first).at ("ndf") < fMinNDF)
        {
          for (map<unsigned, map<string, int> >::iterator track = trackIDToInt.begin (); track != trackIDToInt.end (); track++)
            {
              if (track->second.at ("clusterIndex") != (int) cluster->first)
                continue;
              track->second["clusterIndex"] = -1;
              trackIDToBool[track->first]["claimed"] = false;
            }
        }
      else
        trackIDToBool[clusterIDToInt.at (cluster->first).at ("seed")]["claimed"] = true;
    }
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Add clusters with at least MinNDF tracks to the output array in order of
// descending sum(pt**2).
////////////////////////////////////////////////////////////////////////////////
  clusterSumPT2.clear ();
  for (map<unsigned, map<string, int> >::const_iterator cluster = clusterIDToInt.begin (); cluster != clusterIDToInt.end (); cluster++)
  {
    if (cluster->second.at ("ndf") < fMinNDF)
      continue;
    clusterSumPT2.push_back (make_pair (cluster->first, clusterIDToDouble.at (cluster->first).at ("sumPT2")));
  }
  sort (clusterSumPT2.begin (), clusterSumPT2.end (), secondDescending);
  for (vector<pair<unsigned, double> >::const_iterator cluster = clusterSumPT2.begin (); cluster != clusterSumPT2.end (); cluster++)
  {
    math::Error<3>::type cov;
    for (unsigned i = 0; i < 3; i++)
      {
        for (unsigned j = 0; j < 3; j++)
          {
            if (i == 2 && j == 2)
              cov (i, j) = clusterIDToDouble.at (cluster->first).at ("ez") * clusterIDToDouble.at (cluster->first).at ("ez");
            else
              cov (i, j) -= cov (i, j);
          }
      }
    candidate = new reco::Vertex (
      math::XYZPoint (0.0, 0.0, clusterIDToDouble.at (cluster->first).at ("z")),
      cov
    );
    for (const auto &track : clusterIDToSet.at (cluster->first))
        candidate->add (reco::TrackBaseRef (tracks, track));
    delphesVertices->push_back (*candidate);
  }
////////////////////////////////////////////////////////////////////////////////

  event.put (delphesVertices, "");
}

void
DelphesVertexProducer::createSeeds (const edm::Handle<edm::View<reco::Track> > &tracks)
{
  unsigned clusterIndex = 0, maxSeeds = 0;

////////////////////////////////////////////////////////////////////////////////
// Loop over all tracks, initializing some variables.
////////////////////////////////////////////////////////////////////////////////
  int index = -1;
  for (const auto &track : *tracks)
    {
      index++;
      if (track.pt () < fMinPT || fabs (track.eta ()) > fMaxEta)
        continue;
      if (track.normalizedChi2 () > 20.0)
        continue;
      if (track.hitPattern ().pixelLayersWithMeasurement () < 2)
        continue;
      if (track.hitPattern ().trackerLayersWithMeasurement () < 5)
        continue;
      if (fabs (track.d0 () / track.d0Error ()) > 5.0)
        continue;

      trackIDToDouble[index]["pt"] = track.pt ();
      trackIDToDouble[index]["ept"] = track.ptError ();
      trackIDToDouble[index]["eta"] = track.eta ();

      trackIDToDouble[index]["z"] = track.dz ();
      trackIDToDouble[index]["ez"] = track.dzError ();

      trackIDToInt[index]["clusterIndex"] = -1;

      trackIDToBool[index]["claimed"] = false;

      trackPT.push_back (make_pair (index, track.pt ()));
    }
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Sort tracks by pt and leave only the SeedMinPT highest pt ones in the
// trackPT vector.
////////////////////////////////////////////////////////////////////////////////
  sort (trackPT.begin (), trackPT.end (), secondDescending);
  for (vector<pair<unsigned, double> >::const_iterator track = trackPT.begin (); track != trackPT.end (); track++, maxSeeds++)
    {
      if (track->second < fSeedMinPT)
        break;
    }
  // If there are no tracks with pt above MinSeedPT, create just one seed from
  // the highest pt track.
  if (!maxSeeds)
    maxSeeds++;
  if (trackPT.size () > maxSeeds)
    {
      trackPT.erase (trackPT.begin () + maxSeeds, trackPT.end ());
    }
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Create the seeds from the SeedMinPT highest pt tracks.
////////////////////////////////////////////////////////////////////////////////
  for (vector<pair<unsigned, double> >::const_iterator track = trackPT.begin (); track != trackPT.end (); track++, clusterIndex++)
    {
      addTrackToCluster (track->first, clusterIndex);
      clusterSumPT2.push_back (make_pair (clusterIndex, track->second * track->second));
    }
////////////////////////////////////////////////////////////////////////////////
}

void
DelphesVertexProducer::growCluster (const unsigned clusterIndex)
{
  bool done = false;
  unsigned nearestID;
  int oldClusterIndex;
  double nearestDistance;
  vector<unsigned> nearTracks;
  nearTracks.clear ();

////////////////////////////////////////////////////////////////////////////////
// Grow the cluster until there are no more tracks within Sigma standard
// deviations of the cluster.
////////////////////////////////////////////////////////////////////////////////
  while (!done)
    {
      done = true;
      nearestID = 0;
      nearestDistance = -1.0;

      // These two loops are for finding the nearest track to the cluster. The
      // first time, the ID of each track within 10*Sigma of the cluster is
      // saved in the nearTracks vector; subsequently, to save time, only the
      // tracks in this vector are checked.
      if (!nearTracks.size ())
        {
          for (map<unsigned, map<string, double> >::const_iterator track = trackIDToDouble.begin (); track != trackIDToDouble.end (); track++)
            {
              if (trackIDToBool.at (track->first).at ("claimed") || trackIDToInt.at (track->first).at ("clusterIndex") == (int) clusterIndex)
                continue;
              double distance = fabs (clusterIDToDouble.at (clusterIndex).at ("z") - track->second.at ("z")) / hypot (clusterIDToDouble.at (clusterIndex).at ("ez"), track->second.at ("ez"));
              if (nearestDistance < 0.0 || distance < nearestDistance)
                {
                  nearestID = track->first;
                  nearestDistance = distance;
                }
              if (distance < 10.0 * fSigma)
                nearTracks.push_back (track->first);
            }
        }
      else
        {
          for (vector<unsigned>::const_iterator track = nearTracks.begin (); track != nearTracks.end (); track++)
            {
              if (trackIDToBool.at (*track).at ("claimed") || trackIDToInt.at (*track).at ("clusterIndex") == (int) clusterIndex)
                continue;
              double distance = fabs (clusterIDToDouble.at (clusterIndex).at ("z") - trackIDToDouble.at (*track).at ("z")) / hypot (clusterIDToDouble.at (clusterIndex).at ("ez"), trackIDToDouble.at (*track).at ("ez"));
              if (nearestDistance < 0.0 || distance < nearestDistance)
                {
                  nearestID = *track;
                  nearestDistance = distance;
                }
            }
        }

      // If no tracks within Sigma of the cluster were found, stop growing.
      done = nearestDistance > fSigma || nearestDistance < 0.0;
      if (done)
        {
          continue;
        }

      // Add the nearest track within Sigma to the cluster. If it already
      // belonged to another cluster, remove it from that cluster first.
      if (nearestDistance < fSigma)
        {
          oldClusterIndex = trackIDToInt.at (nearestID).at ("clusterIndex");
          if (oldClusterIndex >= 0)
            removeTrackFromCluster (nearestID, oldClusterIndex);

          trackIDToBool[nearestID]["claimed"] = true;
          addTrackToCluster (nearestID, clusterIndex);
        }
    }
////////////////////////////////////////////////////////////////////////////////
}

double
DelphesVertexProducer::weight (const unsigned trackID)
{
  return ((trackIDToDouble.at (trackID).at ("pt") / (trackIDToDouble.at (trackID).at ("ept") * trackIDToDouble.at (trackID).at ("ez"))) * (trackIDToDouble.at (trackID).at ("pt") / (trackIDToDouble.at (trackID).at ("ept") * trackIDToDouble.at (trackID).at ("ez"))));
}

void
DelphesVertexProducer::removeTrackFromCluster (const unsigned trackID, const unsigned clusterID)
{
  double wz = weight (trackID);

  trackIDToInt[trackID]["clusterIndex"] = -1;
  clusterIDToInt[clusterID]["ndf"]--;

  clusterIDToDouble[clusterID]["sumZ"] -= wz * trackIDToDouble.at (trackID).at ("z");
  clusterIDToDouble[clusterID]["errorSumZ"] -= wz * trackIDToDouble.at (trackID).at ("ez") * trackIDToDouble.at (trackID).at ("ez");
  clusterIDToDouble[clusterID]["sumOfWeightsZ"] -= wz;
  clusterIDToDouble[clusterID]["z"] = clusterIDToDouble.at (clusterID).at ("sumZ") / clusterIDToDouble.at (clusterID).at ("sumOfWeightsZ");
  clusterIDToDouble[clusterID]["ez"] = sqrt ((1.0 / clusterIDToInt.at (clusterID).at ("ndf")) * (clusterIDToDouble.at (clusterID).at ("errorSumZ") / clusterIDToDouble.at (clusterID).at ("sumOfWeightsZ")));
  clusterIDToDouble[clusterID]["sumPT2"] -= trackIDToDouble.at (trackID).at ("pt") * trackIDToDouble.at (trackID).at ("pt");

  clusterIDToSet[clusterID].erase (trackID);
}

void
DelphesVertexProducer::addTrackToCluster (const unsigned trackID, const unsigned clusterID)
{
  double wz = weight (trackID);

  if (!clusterIDToInt.count (clusterID))
    {
      clusterIDToInt[clusterID]["ndf"] = 0;
      clusterIDToInt[clusterID]["seed"] = trackID;
      clusterIDToDouble[clusterID]["sumZ"] = 0.0;
      clusterIDToDouble[clusterID]["errorSumZ"] = 0.0;
      clusterIDToDouble[clusterID]["sumOfWeightsZ"] = 0.0;
      clusterIDToDouble[clusterID]["sumPT2"] = 0.0;
    }

  trackIDToInt[trackID]["clusterIndex"] = clusterID;
  clusterIDToInt[clusterID]["ndf"]++;

  clusterIDToDouble[clusterID]["sumZ"] += wz * trackIDToDouble.at (trackID).at ("z");
  clusterIDToDouble[clusterID]["errorSumZ"] += wz * trackIDToDouble.at (trackID).at ("ez") * trackIDToDouble.at (trackID).at ("ez");
  clusterIDToDouble[clusterID]["sumOfWeightsZ"] += wz;
  clusterIDToDouble[clusterID]["z"] = clusterIDToDouble.at (clusterID).at ("sumZ") / clusterIDToDouble.at (clusterID).at ("sumOfWeightsZ");
  clusterIDToDouble[clusterID]["ez"] = sqrt ((1.0 / clusterIDToInt.at (clusterID).at ("ndf")) * (clusterIDToDouble.at (clusterID).at ("errorSumZ") / clusterIDToDouble.at (clusterID).at ("sumOfWeightsZ")));
  clusterIDToDouble[clusterID]["sumPT2"] += trackIDToDouble.at (trackID).at ("pt") * trackIDToDouble.at (trackID).at ("pt");

  clusterIDToSet[clusterID].insert (trackID);
}

bool DelphesVertexProducer::secondAscending (pair<unsigned, double> pair0, pair<unsigned, double> pair1)
{
  return (pair0.second < pair1.second);
}

bool DelphesVertexProducer::secondDescending (pair<unsigned, double> pair0, pair<unsigned, double> pair1)
{
  return (pair0.second > pair1.second);
}

#include "FWCore/Framework/interface/MakerMacros.h"
DEFINE_FWK_MODULE(DelphesVertexProducer);
