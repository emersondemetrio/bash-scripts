#!/bin/bash

# git utils
# update local with origin

BRANCH_NAME=$(git branch --show-current)

printf "I am going to do the following:\n\n* git push -u origin $BRANCH_NAME\n* git status\n\n"

git push -u origin $BRANCH_NAME
git status
