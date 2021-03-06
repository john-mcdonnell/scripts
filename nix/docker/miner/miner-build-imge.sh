#!/usr/bin/env bash

#https://github.com/alexellis/mine-with-docker

#set -x
set -e

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi
SOURCE_FOLDER=$SCRIPT_FOLDER/source
REPOSITORY_NAME=mine-with-docker
REPOSITORY_FOLDER="$SOURCE_FOLDER/$REPOSITORY_NAME"

IMAGE_NAME=${1:-latest}
IMAGE_TAG=${2:-latest}

[ -d "$SOURCE_FOLDER" ] && sudo rm -R "$SOURCE_FOLDER"
mkdir -p "$SOURCE_FOLDER"
cd "$SOURCE_FOLDER" || exit
git clone "https://github.com/alexellis/$REPOSITORY_NAME"
cd "$REPOSITORY_FOLDER" || exit
docker rmi "$IMAGE_NAME":"$IMAGE_TAG"
docker build -t "$IMAGE_NAME":"$IMAGE_TAG" .
