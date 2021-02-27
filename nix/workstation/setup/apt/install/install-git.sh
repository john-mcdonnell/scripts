#!/usr/bin/env bash

#set -x

sudo apt-get -y install git

SCRIPT_FILE=$(basename "$0")
TEMP_FOLDER=$(mktemp --directory)

# https://github.com/git/git/tree/master/contrib/completion
readonly gitCompletionCommand=~/.git-completion.bash
readonly gitPrompt=~/.git-completion.bash
git clone https://github.com/git/git.git "$TEMP_FOLDER"
cp "$TEMP_FOLDER/contrib/completion/git-completion.bash" "$gitCompletionCommand"
chmod +x "$gitCompletionCommand"
cp "$TEMP_FOLDER/contrib/completion/git-prompt.sh" "$gitPrompt"
chmod +x "$gitPrompt"
