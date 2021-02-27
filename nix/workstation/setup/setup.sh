#!/usr/bin/env bash

#set -x

SCRIPT_FOLDER=$(dirname "$0")
if [[ "$SCRIPT_FOLDER" == "" ]] || [[ "$SCRIPT_FOLDER" == "." ]] || [[ -z "$SCRIPT_FOLDER" ]]; then
  SCRIPT_FOLDER=$(pwd)
fi

#"$SCRIPT_FOLDER"/apt/upgrade.sh
#"$SCRIPT_FOLDER"/apt/install.sh

addToBashRC() {
  local bashRCFile=~/.bashrc
  local fileToAdd="$1"

  local -r foundGitCompletion=$(more $bashRCFile | grep --count "$fileToAdd")
  if [ "$foundGitCompletion" -eq "0" ]; then
    echo "" >> "$bashRCFile"
    echo ". \"$fileToAdd\"" >> "$bashRCFile"
  fi
}
ENVIRONMENT_VARIABLES="$HOME/.environment-variables"
BASH_ALIASES_FILE="$HOME/.bash_aliases"
BASH_PROMPT="$HOME/.bash_prompt"
[ ! -f "$ENVIRONMENT_VARIABLES" ] && ln --force --symbolic "$SCRIPT_FOLDER/bash/.environment-variables" "$ENVIRONMENT_VARIABLES"
[ ! -f "$BASH_ALIASES_FILE" ] && ln -s "$PWD/bash/.bash_aliases" "$BASH_ALIASES_FILE"
[ ! -f "$BASH_PROMPT" ] && ln --force --symbolic "$SCRIPT_FOLDER/bash/.bash_prompt" "$BASH_PROMPT"

addToBashRC "$ENVIRONMENT_VARIABLES"
addToBashRC "$BASH_ALIASES_FILE"
addToBashRC "$BASH_PROMPT"
