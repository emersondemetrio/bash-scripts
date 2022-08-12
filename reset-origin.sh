#!/bin/bash

# git utils
# Reset current branch to its origin

BRANCH_NAME=$(git branch --show-current)

printf "I am going to do the following:\n\n* git reset --hard origin/$BRANCH_NAME\n* ls -las\n\n"

git pull
git reset --hard origin/$BRANCH_NAME
ls -las
