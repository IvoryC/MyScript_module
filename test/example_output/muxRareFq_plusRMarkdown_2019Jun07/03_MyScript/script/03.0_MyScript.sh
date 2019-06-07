#!/bin/bash

pipeDir="/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plusRMarkdown_2019Jun07"

# BioLockJ.v1.0 ${pipeDir}/03_MyScript/script/03.0_MyScript.sh #samples/batch=4

touch ${pipeDir}/03_MyScript/script/03.0_MyScript.sh_Started

function RunMe() {
    $1 $2 &> renderMarkdown.R.log
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

executeLine "RunMe /usr/local/bin/Rscript ${pipeDir}/03_MyScript/script/renderMarkdown.R" ${LINENO}
touch ${pipeDir}/03_MyScript/script/03.0_MyScript.sh_Success
