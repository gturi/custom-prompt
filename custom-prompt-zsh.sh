#!/bin/zsh

function get_virtualenv_info {
  [ $VIRTUAL_ENV ] && echo "("$(basename $VIRTUAL_ENV)") "
}

function get_prompt {
  local white='%F{white}%b'
  local green_bold='%F{green}%B'
  local blue_bold='%F{blue}%B'
  local red_bold='%F{red}%B'

  local virtual_env_info="$(get_virtualenv_info)"
  local user_and_hostname='%n@%m'
  local current_dir='%1~'
  local branch_name="$(get_git_branch_name)"
  local dollar_symbol='%#'

  setopt PROMPT_SUBST
  printf '%s%s%s%s%s%s%s ' \
        "${virtual_env_info}" \
        "${white}[" \
        "${green_bold}${user_and_hostname}" \
        "${white}]" \
        "${blue_bold}${current_dir}" \
        "${red_bold}$branch_name" \
        "${white}${dollar_symbol}"
}

# are we an interactive shell?
if [ "$PROMPT" ]; then
  precmd() { PROMPT=$(get_prompt) }
fi
