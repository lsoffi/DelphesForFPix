import FWCore.ParameterSet.Config as cms
import sys
import math


###########################################################
##### Set up process #####
###########################################################

process = cms.Process ('VFPIX')
process.load ('FWCore.MessageService.MessageLogger_cfi')
process.MessageLogger.cerr.FwkReport.reportEvery = 100

process.maxEvents = cms.untracked.PSet (
  input = cms.untracked.int32 (100)
)
process.source = cms.Source ('PoolSource',
  fileNames = cms.untracked.vstring ('/store/mc/TP2023HGCALNoTRKExtDR/VBF_HToTauTau_M-125_14TeV-powheg-pythia6/GEN-SIM-RECO/PU140BX25_PH2_1K_FB_V6-v3/10000/6698ECE1-A91A-E511-B24B-008CFA1113DC.root')
)

process.PileupProducer = cms.EDProducer ('PileupProducer',
  tracks = cms.InputTag ("generalTracks", ""),
  pfCandidates = cms.InputTag ("particleFlow", ""),
  genParticles = cms.InputTag ("genParticles", ""),
  simTracks = cms.InputTag ("g4SimHits", ""),
)

process.PoolOutputModule = cms.OutputModule ("PoolOutputModule",
  splitLevel = cms.untracked.int32 (0),
  eventAutoFlushCompressedSize = cms.untracked.int32 (5242880),
  fileName = cms.untracked.string ("output.root"),
  outputCommands = cms.untracked.vstring (
    'drop *',
    'keep *_PileupProducer_*_*',
    'keep PileupSummaryInfos_addPileupInfo_*_*',
    'keep recoGenParticles_genParticles_*_*',
  ),
  dropMetaData = cms.untracked.string ("ALL")
)

process.myPath = cms.Path (process.PileupProducer)
process.myEndPath = cms.EndPath (process.PoolOutputModule)
