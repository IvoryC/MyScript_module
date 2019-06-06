#!/bin/bash

pipeDir="/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plusRscript_7_2019Jun06"

# BioLockJ v1.0 ${pipeDir}/03_MyScript/script/MAIN_03_MyScript.sh

touch ${pipeDir}/03_MyScript/script/MAIN_03_MyScript.sh_Started

cd ${pipeDir}/03_MyScript/script

function scriptFailed() {
    echo "Line #${2} failure status code [ ${3} ]:  ${1}" >> "${pipeDir}/03_MyScript/script/MAIN_03_MyScript.sh_Failures"
    exit ${3}
}

function executeLine() {
    ${1}
    statusCode=$?
    [ ${statusCode} != 0 ] && scriptFailed "${1}" ${2} ${statusCode}
}

executeLine "${pipeDir}/03_MyScript/script/03.0_MyScript.sh" ${LINENO}

touch ${pipeDir}/03_MyScript/script/MAIN_03_MyScript.sh_Success
