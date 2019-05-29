#!/bin/bash

# BioLockJ v1.0 /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/MAIN_03_MyScript.sh

touch /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/MAIN_03_MyScript.sh_Started

cd /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script

function execute() {
    $1
    statusCode=$?
    if [ $statusCode != 0 ]; then
        echo "Failure code [ $statusCode ] on Line [ $2 ]:  $1" >> "/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/MAIN_03_MyScript.sh_Failures"
        exit $statusCode
    fi
}

execute "/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/03.0_MyScript.sh" $LINENO

touch /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/MAIN_03_MyScript.sh_Success
