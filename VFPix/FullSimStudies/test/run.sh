#!/usr/bin/env bash

SCENARIO=$1
BATCH=$2

if [ $BATCH -eq 0 ]
then
  echo "launching batch 0..."
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  0   32  $1  >  output_0_00.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  1   32  $1  >  output_0_01.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  2   32  $1  >  output_0_02.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  3   32  $1  >  output_0_03.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  4   32  $1  >  output_0_04.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  5   32  $1  >  output_0_05.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  6   32  $1  >  output_0_06.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  7   32  $1  >  output_0_07.txt  2>&1  &
elif [ $BATCH -eq 1 ]
then
  echo "launching batch 1..."
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  8   32  $1  >  output_1_08.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  9   32  $1  >  output_1_09.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  10  32  $1  >  output_1_10.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  11  32  $1  >  output_1_11.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  12  32  $1  >  output_1_12.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  13  32  $1  >  output_1_13.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  14  32  $1  >  output_1_14.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  15  32  $1  >  output_1_15.txt  2>&1  &
elif [ $BATCH -eq 2 ]
then
  echo "launching batch 2..."
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  16  32  $1  >  output_2_16.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  17  32  $1  >  output_2_17.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  18  32  $1  >  output_2_18.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  19  32  $1  >  output_2_19.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  20  32  $1  >  output_2_20.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  21  32  $1  >  output_2_21.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  22  32  $1  >  output_2_22.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  23  32  $1  >  output_2_23.txt  2>&1  &
elif [ $BATCH -eq 3 ]
then
  echo "launching batch 3..."
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  24  32  $1  >  output_3_24.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  25  32  $1  >  output_3_25.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  26  32  $1  >  output_3_26.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  27  32  $1  >  output_3_27.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  28  32  $1  >  output_3_28.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  29  32  $1  >  output_3_29.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  30  32  $1  >  output_3_30.txt  2>&1  &
  nohup  nice  cmsRun  vfpixAnalyzer_cfg.py  31  32  $1  >  output_3_31.txt  2>&1  &
fi
