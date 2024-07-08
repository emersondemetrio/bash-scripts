#!/bin/bash

clear
echo "Searching for branch '$1':"
echo
git branch | grep "$1"
echo
