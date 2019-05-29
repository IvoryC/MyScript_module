#!/bin/bash

#BioLockJ.v1.0 /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/03.0_MyScript.sh | batch size = 4

touch /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/03.0_MyScript.sh_Started

function RunMe() {
    $1
}

function execute() {
    $1
    statusCode=$?
    if [ $statusCode != 0 ]; then
        echo "Failure code [ $statusCode ] on Line [ $2 ]:  $1" >> "/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/03.0_MyScript.sh_Failures"
        exit $statusCode
    fi
}

execute "/Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/someUserScript.sh" $LINENO
execute "touch /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/someUserScript.sh_Success" $LINENO

touch /Users/ieclabau/git/BioLockJ/pipelines/muxRareFq_plus_25_2019May29/03_MyScript/script/03.0_MyScript.sh_Success
