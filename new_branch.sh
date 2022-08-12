#!/bin/bash

# git utils
# create a new branch, ex new-branch 123 sufix

BRANCH_SUFIX=$1
BRANCH_NAME=$2

git checkout -b "$BRANCH_SUFIX-$BRANCH_NAME"
