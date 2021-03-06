#!/usr/bin/env bash

#https://github.com/alexellis/mine-with-docker

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi
WORKING_FOLDER=$SCRIPT_FOLDER/mine-with-docker

mkdir -p "$WORKING_FOLDER"
git clone https://github.com/alexellis/mine-with-docker
cd "$WORKING_FOLDER"/cpu-opt || exit
docker build -t cpu-opt:latest .
