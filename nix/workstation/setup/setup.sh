#!/usr/bin/env bash

#./apt/upgrade.sh
#./apt/install.sh

BASH_ALIASES_FILE=~/.bash_aliases
ENVIRONMENT_VARIABLES_FILE="$HOME/scripts/nix/workstation/setup/bash/environment-variables.sh"
BASHRC_FILE=~/.bashrc

[ ! -f "$BASH_ALIASES_FILE" ] && ln -s "$PWD/bash/.bash_aliases" "$BASH_ALIASES_FILE"

FOUND=$(more $BASHRC_FILE | grep --count "$ENVIRONMENT_VARIABLES_FILE")
if [ $FOUND -eq 0 ]; then
  echo "" >> "$BASHRC_FILE"
  echo ". \"$ENVIRONMENT_VARIABLES_FILE\"" >> "$BASHRC_FILE"
fi
