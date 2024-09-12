#!/bin/bash

BRANCH_NAME=$1

printf "\nRemoving branch $BRANCH_NAME\n\n"

git branch -D $BRANCH_NAME
