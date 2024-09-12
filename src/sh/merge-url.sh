#!/bin/bash

url=$(echo "$git_output" | grep -o 'https://[^[:space:]]*')

# Print the extracted URL
echo "$url"
