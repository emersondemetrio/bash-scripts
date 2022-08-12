#!/bin/bash

# Convert a video to a .gif file

# acrh -arm64 brew install ffmpeg
# brew install ffmpeg

abs_path() {
    echo "$(
        cd $(dirname "$1")
        pwd
    )/$(basename "$1")"
}

INPUT_PATH=$(abs_path $1)
OUTPUT_PATH=$(abs_path $2)

printf "I am going to do create $OUTPUT_PATH gif from $INPUT_PATH video\n\n"

ffmpeg \
    -ss 0 -t 300 \
    -i $INPUT_PATH \
    -vf "fps=10,scale=1500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    $OUTPUT_PATH
