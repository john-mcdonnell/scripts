#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

echo "Upgrading packages..."
"$SCRIPT_FOLDER"/upgrade.sh
"$SCRIPT_FOLDER"/install/install.sh

echo && echo && echo&& echo "Auto-removing packages..."
sudo apt-get -y autoremove
