#!/usr/bin/env bash

shopt -s cdable_vars
complete -v -F _cd $nospace $filenames cd

########################################
# Bash completion
########################################
[[ -r "${BREW}/etc/profile.d/bash_completion.sh" ]] && source "${BREW}/etc/profile.d/bash_completion.sh"

########################################
# Bash-specific environment variables
########################################
export BASH_COMPLETION_COMPAT_DIR="${BREW}/etc/bash_completion.d"

########################################
# Customize prompt
########################################

# PS1 – Default interaction prompt
export PS1_START='\n\[\e[33m\]\w\[\e[m\]'
export PS1_STATUS='' # Placeholder to expand in other sourced scripts
export PS1_END='\n\$ '
# Combine PS1 variables -- this will be repeated below
export PS1="${PS1_START}${PS1_STATUS}${PS1_END}"
# export PS1='\n\[\e[33m\]\w\[\e[m\]\n\$ '
# PS2 – Continuation interactive prompt
export PS2=">>> "
# PS4 – Used by “set -x” to prefix tracing output
export PS4='$0.$LINENO + '
# PROMPT_COMMAND - Bash shell executes just before displaying the PS1 variable.
# Prefer using PS1, PROMPT_COMMAND makes things confusing to follow
# when making changes over multiple sourced scripts
export PROMPT_COMMAND=''

echo "Bash path: $(which bash)"

########################################
# Commands and functions
########################################

# make a directory and cd to it
mcd() {
    test -d "$1" || mkdir -p "$1" && pushd "$1"
}

if [[ $BASH_VERSION == 5* ]]; then
  shopt -s globstar
fi