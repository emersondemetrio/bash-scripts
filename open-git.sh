#!/bin/bash

# git utils
# open current issue/task

FOLDER_NAME=$(basename "$PWD")
BRANCH_NAME=$(git branch --show-current)
ISSUE_NUMBER=${BRANCH_NAME//[^0-9]/}
URL_TO_OPEN="<your gitlab url>/$FOLDER_NAME/-/issues/$ISSUE_NUMBER"
open -a "Google Chrome" "$URL_TO_OPEN"
