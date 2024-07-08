#!/bin/bash

git branch --merged >/tmp/merged-branches &&
    vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches
