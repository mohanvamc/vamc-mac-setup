#!/bin/zsh

input_file="mac-tools.txt"

while IFS= read -r line || [[ -n "$line" ]]; do
  [[ -z "$line" || "$line" == \#* ]] && continue

  if [[ "$line" == --cask* ]]; then
    brew install --cask "${line#--cask }" || true
  else
    brew install "$line" || true
  fi
done < "$input_file"
