#!/bin/bash

# gets the absolute path to the directory containing this script
DIR="$(dirname "$(readlink -f "$0")")"

cd "$DIR" || exit

./setup.sh

read -p "custom-prompt: do you wish to add the utility to your .zshrc? [y/n]" -n 1 -r
echo # moves to a new line

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  log "custom-prompt: .zshrc setup aborted"
  # handle exits from shell or function but don't exit interactive shell
  [[ "$0" = "$BASH_SOURCE" ]] && exit 0 || return 0
fi


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
