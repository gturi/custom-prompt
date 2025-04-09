#!/bin/bash

# gets the absolute path to the directory containing this script
DIR="$(dirname "$(readlink -f "$0")")"

cd "$DIR" || exit

./setup.sh

/bin/bash "$DIR/get-git-branch-name/installer-for-zsh.sh"

SCRIPT="$DIR/custom-prompt-zsh.sh"

if [ -f "$SCRIPT" ]; then
  # adds to .zshrc
  # # setup custom prompt
  # if [ -f "$SCRIPT" ]; then
  #   . "$SCRIPT"
  # fi
  printf '\n%s\n%s\n%s\n%s\n' \
    "# setup custom prompt" \
    "if [ -f \"$SCRIPT\" ]; then" \
    "  . \"$SCRIPT\"" \
    'fi' \
    >>"$HOME/.zshrc"
fi
