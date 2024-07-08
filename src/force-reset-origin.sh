#!/bin/bash

BRANCH_NAME=$(git branch --show-current)

printf "\nI am going to do the following:\n\n"
printf "* git stash\n"
printf "* git reset --hard origin/$BRANCH_NAME\n"
printf "* git pull\n"
printf "* git stash pop\n"
printf "* git status\n\n"

git stash
git reset --hard origin/$BRANCH_NAME
git pull
git stash pop
git status
