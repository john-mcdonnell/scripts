#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

for filename in "$SCRIPT_FOLDER"/install-*.sh; do
  echo && echo && echo && echo "Executing \"$filename\"..."
  "$filename"
done
