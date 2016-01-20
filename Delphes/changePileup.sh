#!/usr/bin/env bash

PILEUP=$1
if [ ${PILEUP} == "delta" ]
then
  sed -i "s/set MeanPileUp .*/set MeanPileUp 140/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
  sed -i "s/set PileUpDistribution .*/set PileUpDistribution 2/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
elif [ ${PILEUP} == "poisson" ]
then
  sed -i "s/set MeanPileUp .*/set MeanPileUp 140/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
  sed -i "s/set PileUpDistribution .*/set PileUpDistribution 0/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
elif [ ${PILEUP} == "flat" ]
then
  sed -i "s/set MeanPileUp .*/set MeanPileUp 100/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
  sed -i "s/set PileUpDistribution .*/set PileUpDistribution 1/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
elif [ ${PILEUP} == "no" ]
then
  sed -i "s/set MeanPileUp .*/set MeanPileUp 0/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
  sed -i "s/set PileUpDistribution .*/set PileUpDistribution 0/g" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl
fi
grep "set \(MeanPileUp\|PileUpDistribution\)" Cards/Strawman*.tcl Cards/VFPix*.tcl Cards/TechnicalProposal*.tcl Cards/Perfect.tcl | sort -u
