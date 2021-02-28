#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

JAVA_MAJOR_VERSION=11
JAVA_FULL_VERSION=jdk-11.0.10+9
JAVA_ARCHIVE_NAME=OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz

"$SCRIPT_FOLDER"/install-jdk.bash $JAVA_MAJOR_VERSION $JAVA_FULL_VERSION $JAVA_ARCHIVE_NAME "true"
