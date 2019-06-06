#!/bin/bash

pipeDir="/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plusBash_9_2019Jun06"

# BioLockJ.v1.0 ${pipeDir}/03_MyScript/script/03.0_MyScript.sh #samples/batch=4

touch ${pipeDir}/03_MyScript/script/03.0_MyScript.sh_Started

function RunMe() {
    $1
}

function scriptFailed() {
    echo "Line #${2} failure status code [ ${3} ]:  ${1}" >> "${pipeDir}/03_MyScript/script/03.0_MyScript.sh_Failures"
    exit ${3}
}

function executeLine() {
    ${1}
    statusCode=$?
    [ ${statusCode} != 0 ] && scriptFailed "${1}" ${2} ${statusCode}
}

executeLine "RunMe ${pipeDir}/03_MyScript/script/someUserScript.sh" ${LINENO}
executeLine "touch ${pipeDir}/03_MyScript/script/someUserScript.sh_Success" ${LINENO}
touch ${pipeDir}/03_MyScript/script/03.0_MyScript.sh_Success
