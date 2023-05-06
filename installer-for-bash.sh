#!/bin/bash

# gets the absolute path to the directory containing this script
DIR="$(dirname "$(readlink -f "$0")")"

cd "$DIR" || exit

git clone https://github.com/gturi/get-git-branch-name.git\
/bin/bash "$DIR/get-git-branch-name/installer-for-bash.sh"

SCRIPT="$DIR/custom-prompt-bash.sh"

if [ -f "$SCRIPT" ]; then
    # adds to .bashrc
    # # setup custom prompt
    # if [ -f "$SCRIPT" ]; then
    #     source "$SCRIPT"
    # fi
    printf '\n%s\n%s\n%s\n%s\n' \
        "# setup custom prompt" \
        "if [ -f \"$SCRIPT\" ]; then" \
        "    source \"$SCRIPT\"" \
        'fi' \
        >> "$HOME/.bashrc"
fi
