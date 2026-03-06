#!/bin/bash
set -euo pipefail

extensions_file="./cursor-extensions.txt"

if [[ ! -f "$extensions_file" ]]; then
  echo "Missing extensions list: $extensions_file" >&2
  exit 1
fi

while IFS= read -r extension || [[ -n $extension ]]; do
  [[ -z $extension ]] && continue
  echo "Installing $extension"
  code --install-extension "$extension"
done < "$extensions_file"
