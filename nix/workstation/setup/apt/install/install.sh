#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

"$SCRIPT_FOLDER"/install-base-utilities.sh
"$SCRIPT_FOLDER"/install-jdk.sh
"$SCRIPT_FOLDER"/install-git.sh
