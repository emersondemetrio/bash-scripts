#!/bin/bash

BRANCH_NAME=$(git branch --show-current)

if [ "$BRANCH_NAME" = "main" ]; then
    printf "Main. STOP. \n\n\n"
    exit
fi

if [ "$BRANCH_NAME" = "master" ]; then
    printf "Master. STOP. \n\n\n"
    exit
fi

printf "[OK] Branch is not in ['main', 'master'].\n\n"
printf "I am going to do the following:\n\n* git push -f -u origin $BRANCH_NAME\n* git status\n\n"

git push -f -u origin $BRANCH_NAME
git status
