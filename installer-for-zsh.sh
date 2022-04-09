#!/bin/bash

# gets the absolute path to the directory containing this script
DIR="$(dirname "$(readlink -f "$0")")"

/bin/bash "$DIR/get-git-branch-name/installer-for-zsh.sh"

SCRIPT="$DIR/custom-prompt-zsh.sh"

if [ -f "$SCRIPT" ]; then
    # adds to .bashrc
    # # setup custom prompt
    # if [ -f "$SCRIPT" ]; then
    #     source "$SCRIPT"
    # fi
    printf '\n%s\n%s\n%s\n%s\n' \
        "# setup custom prompt" \
        "if [ -f \"$SCRIPT\" ]; then" \
        "  emulate sh -c '. \"$SCRIPT\"'" \
        'fi' \
        >> "$HOME/.zshrc"
fi
