#!/bin/bash

# terminal utils
# macOS doesn't have a real_path fn =p

abs_path() {
    echo "$(
        cd $(dirname "$1")
        pwd
    )/$(basename "$1")"
}

abs_path $1
