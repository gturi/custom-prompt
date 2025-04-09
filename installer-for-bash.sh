#!/bin/bash

# gets the absolute path to the directory containing this script
DIR="$(dirname "$(readlink -f "$0")")"

cd "$DIR" || exit

./setup.sh

read -p "custom-prompt: do you wish to add the utility to your .bashrc? [y/n]" -n 1 -r
echo # moves to a new line

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  log "custom-prompt: .bashrc setup aborted"
  # handle exits from shell or function but don't exit interactive shell
  [[ "$0" = "$BASH_SOURCE" ]] && exit 0 || return 0
fi


/bin/bash "$DIR/get-git-branch-name/installer-for-bash.sh"

SCRIPT="$DIR/custom-prompt-bash.sh"

if [ -f "$SCRIPT" ]; then
  # adds to .bashrc
  # # setup custom prompt
  # if [ -f "$SCRIPT" ]; then
  #     . "$SCRIPT"
  # fi
  printf '\n%s\n%s\n%s\n%s\n' \
    "# setup custom prompt" \
    "if [ -f \"$SCRIPT\" ]; then" \
    "    . \"$SCRIPT\"" \
    'fi' \
    >>"$HOME/.bashrc"
fi
