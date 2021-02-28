#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

JAVA_MAJOR_VERSION=8
JAVA_FULL_VERSION=jdk8u282-b08
JAVA_ARCHIVE_NAME=OpenJDK8U-jdk_x64_linux_hotspot_8u282b08.tar.gz

"$SCRIPT_FOLDER"/install-jdk.bash $JAVA_MAJOR_VERSION $JAVA_FULL_VERSION $JAVA_ARCHIVE_NAME "false"
