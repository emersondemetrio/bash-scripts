#!/bin/bash
clear
PROJECT_PATH="/Users/<your-path>/projects/kyte/frontend-monorepo/apps/surfer-mobile"
PODS_PATH="$PROJECT_PATH/ios"

printf "\n\nI am going to do the following:\n\n"
printf "* cd $PROJECT_PATH\n"
printf "* rm -rf node_modules\n"
printf "* yarn\n"
printf "* cd $PODS_PATH\n"

if [ "$1" = "-r" ]; then
    printf "* remove Podfile.lock\n"
    rm -r "$PODS_PATH/Podfile.lock" # silence is gold
fi

printf "* rm -rf Pods\n"
printf "* pod install\n"
printf "* cd $PROJECT_PATH\n"
printf "* git status \n\n"

cd $PROJECT_PATH
printf "\nRemoving modules... $PROJECT_PATH/node_modules\n"
rm -rf "$PROJECT_PATH/node_modules"
printf "\nDone\n\n"
printf "\nReinstall modules...\n\n"
yarn
printf "\nDone\n\n"

cd "$PROJECT_PATH/ios"
rm -rf "$PROJECT_PATH/ios/Pods"
rm -f "$PROJECT_PATH/ios/Podsfile.lock"
pod install
ls -las

cd $PROJECT_PATH
git status
