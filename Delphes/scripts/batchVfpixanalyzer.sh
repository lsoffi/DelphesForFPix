#!/usr/bin/env bash

DIR=$1
BASE_DIR="analysis"
EXE=`which vfpixAnalyzer`

if [ ! -d ${DIR}/${BASE_DIR} ]; then
mkdir ${DIR}/${BASE_DIR}
fi

rm -f ${DIR}/${BASE_DIR}/${BASE_DIR}_* ${DIR}/${BASE_DIR}/${BASE_DIR}.*

generateRunList ${DIR} ${DIR}/${BASE_DIR}/${BASE_DIR}.txt
splitRunList ${DIR}/${BASE_DIR}/${BASE_DIR} 10
NFILES=`ls ${DIR}/${BASE_DIR}/${BASE_DIR}_*.txt | wc -l`

echo "Executable           = ${EXE}"                                                        > ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo ""                                                                                    >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Universe             = vanilla"                                                      >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Getenv               = True"                                                         >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Arguments            = ${DIR}/${BASE_DIR}/${BASE_DIR}_\$(Process).txt ${DIR}/${BASE_DIR}/${BASE_DIR}_\$(Process).root" >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo ""                                                                                    >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Output               = ${DIR}/${BASE_DIR}/${BASE_DIR}_\$(Process).out"                                >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Error                = ${DIR}/${BASE_DIR}/${BASE_DIR}_\$(Process).err"                                >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Log                  = ${DIR}/${BASE_DIR}/${BASE_DIR}_\$(Process).log"                                >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo ""                                                                                    >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
#echo "Requirements         = Memory > 1900"                                                >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Hold                 = True"                                                         >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo ""                                                                                    >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
echo "Queue ${NFILES}"                                                                     >> ${DIR}/${BASE_DIR}/${BASE_DIR}.sub

condor_submit ${DIR}/${BASE_DIR}/${BASE_DIR}.sub
