#!/bin/bash

BRANCH_NAME=$(git branch --show-current)

printf "\nI am going to do the following:\n\n"
printf "* git reset --hard origin/$BRANCH_NAME\n"
printf "* git pull\n"
printf "* git status\n\n"

git reset --hard origin/$BRANCH_NAME
git pull
git status
