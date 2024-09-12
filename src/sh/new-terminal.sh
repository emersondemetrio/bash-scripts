#!/bin/bash

COMMAND=$1

osascript -e 'tell app "Terminal"
   do script $COMMAND
end tell'
