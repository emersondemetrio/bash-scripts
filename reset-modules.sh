#!/bin/bash

# node utils
# reset all node_modules and reinstall

clear

printf "I am going to do the following:\n\n* rm -rf ./node_modules\n* yarn\n* ls -las\n\n"

rm -rf node_modules
yarn
ls -las
