#!/bin/bash

function get_prompt() {
  local white='\[\033[00m\]'
  local green_bold='\[\033[01;32m\]'
  local blue_bold='\[\033[01;34m\]'
  local red_bold='\[\e[1;31m\]'

  local user_and_hostname='\u@\h'
  local current_dir='\w'
  local branch_name="\$(get_git_branch_name)"
  local dollar_symbol='\$'

  printf '%s%s%s%s%s%s ' \
    "${white}[" \
    "${green_bold}${user_and_hostname}" \
    "${white}]" \
    "${blue_bold}${current_dir}" \
    "${red_bold}${branch_name}" \
    "${white}${dollar_symbol}"
}

# are we an interactive shell?
if [ "$PS1" ]; then
  PS1=$(get_prompt)
fi
