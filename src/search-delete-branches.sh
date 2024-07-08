#!/bin/bash

clear
echo "Search & delete branches"
echo

BRANCH_PATTERN=$1

if [ -n "$BRANCH_PATTERN" ]; then
    echo "Search & delete for branch '$1':"
else
    echo "Branch pattern is empty. exit."
    exit
fi

BRANCHES_PATH="/tmp/branchs-to-delete"

git branch | grep "$1" >>$BRANCHES_PATH &&
    vim $BRANCHES_PATH &&
    xargs git branch -d <$BRANCHES_PATH
