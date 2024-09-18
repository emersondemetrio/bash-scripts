#!/bin/bash

if [ $(git rev-parse --verify master 2>/dev/null) ]; then
    echo "Copying diffs from 'master' branch."
    git diff origin/master | pbcopy
else
    printf "\n'master' branch not found. Checking out 'main'.\n\n"
    echo "Copying diffs from 'main' branch."
    git diff origin/main | pbcopy
fi
