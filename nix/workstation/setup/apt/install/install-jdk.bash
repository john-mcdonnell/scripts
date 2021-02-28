#!/usr/bin/env bash

# https://adoptopenjdk.net/releases.html

#set -ex

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

SCRIPT_FILE=$(basename "$0")
TEMP_FILE=$(mktemp /tmp/"$SCRIPT_FILE".XXXXXX)
JAVA_FOLDER=/opt/java

JAVA_MAJOR_VERSION=$1
JAVA_FULL_VERSION=$2
JAVA_ARCHIVE_NAME=$3
IS_DEFAULT_VERSION=${4:-false}

curl --request GET --location \
     --url "https://github.com/AdoptOpenJDK/openjdk$JAVA_MAJOR_VERSION-binaries/releases/download/$JAVA_FULL_VERSION/$JAVA_ARCHIVE_NAME" \
     --output "$TEMP_FILE"

sudo mkdir -p "$JAVA_FOLDER"
sudo tar -xf "$TEMP_FILE" --directory="$JAVA_FOLDER"
#sudo rsync --archive --force --delete "$JAVA_FOLDER/$JAVA_VERSION" "$JAVA_FOLDER/default"
[ "$IS_DEFAULT_VERSION" = true ]; sudo ln -s "$JAVA_FOLDER/$JAVA_FULL_VERSION" "$JAVA_FOLDER/default"
