#!/usr/bin/env bash

#set -x

JAVA_VERSION=jdk-11.0.10+9

SCRIPT_FILE=$(basename "$0")
TEMP_FILE=$(mktemp /tmp/$SCRIPT_FILE.XXXXXX)
JAVA_FOLDER=/opt/java

# https://adoptopenjdk.net/releases.html
curl --request GET -sL \
     --url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/'$JAVA_VERSION'/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz' \
     --output "$TEMP_FILE"

sudo mkdir -p "$JAVA_FOLDER"
sudo tar -xvf "$TEMP_FILE" --directory="$JAVA_FOLDER"
sudo rsync --archive --force --delete "$JAVA_FOLDER/$JAVA_VERSION" "$JAVA_FOLDER/default"
