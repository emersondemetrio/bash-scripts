#!/bin/bash
clear
printf "I am going to do the following:\n\n"

printf "1 - rm -rf ./node_modules\n"
printf "2 - rm -rf ./yalc-lock\n"
printf "3 - rm -rf ./yalc\n"
printf "4 - rm -rf ~/.yalc\n"
printf "5 - rm -rf ./pnpm-lock.yaml\n"
printf "6 - pnpm install\n"
printf "7 - ls -las\n\n"

rm -rf ./node_modules # 1
rm -rf ./yalc-lock    # 2
rm -rf ./yalc         # 3
rm -rf ~/.yalc        # 4
rm -rf ./yarn-lock    # 5
pnpm install          # 6
ls -las               # 7
