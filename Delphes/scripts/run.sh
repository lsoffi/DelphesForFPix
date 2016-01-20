#!/usr/bin/env bash

DIR=$1
BASE_DIR="output"
EXE=`which vfpixAnalyzer`

rm -f ${DIR}.* ${BASE_DIR}/${DIR}_* ${BASE_DIR}/${DIR}.*

generateRunList ../condor/${DIR} ${BASE_DIR}/${DIR}.txt
splitRunList ${BASE_DIR}/${DIR} 10
NFILES=`ls ${BASE_DIR}/${DIR}_*.txt | wc -l`

echo "Executable           = ${EXE}"                                                        > ${BASE_DIR}/${DIR}.sub
echo ""                                                                                    >> ${BASE_DIR}/${DIR}.sub
echo "Universe             = vanilla"                                                      >> ${BASE_DIR}/${DIR}.sub
echo "Getenv               = True"                                                         >> ${BASE_DIR}/${DIR}.sub
echo "Arguments            = ${BASE_DIR}/${DIR}_\$(Process).txt ${BASE_DIR}/${DIR}_\$(Process).root" >> ${BASE_DIR}/${DIR}.sub
echo ""                                                                                    >> ${BASE_DIR}/${DIR}.sub
echo "Output               = ${BASE_DIR}/${DIR}_\$(Process).out"                                >> ${BASE_DIR}/${DIR}.sub
echo "Error                = ${BASE_DIR}/${DIR}_\$(Process).err"                                >> ${BASE_DIR}/${DIR}.sub
echo "Log                  = ${BASE_DIR}/${DIR}_\$(Process).log"                                >> ${BASE_DIR}/${DIR}.sub
echo ""                                                                                    >> ${BASE_DIR}/${DIR}.sub
#echo "Requirements         = Memory > 1900"                                                >> ${BASE_DIR}/${DIR}.sub
echo "Hold                 = True"                                                         >> ${BASE_DIR}/${DIR}.sub
echo ""                                                                                    >> ${BASE_DIR}/${DIR}.sub
echo "Queue ${NFILES}"                                                                     >> ${BASE_DIR}/${DIR}.sub

condor_submit ${BASE_DIR}/${DIR}.sub
