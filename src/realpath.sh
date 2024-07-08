#!/bin/bash

abs_path() {
    echo "$(
        cd $(dirname "$1")
        pwd
    )/$(basename "$1")"
}

abs_path $1
