#!/usr/bin/env bash

########################################
# Profile .bashrc
# per https://www.rosipov.com/blog/profiling-slow-bashrc/
# Set PROFILE_BASHRC to 1 to enable
########################################
PROFILE_BASHRC=${PROFILE_BASHRC:-1}
if [[ $PROFILE_BASHRC -eq 1 ]]; then
  # On macOS, need to use GNU CoreUtils date, which is aliased to gdate
  PS4='+ $(gdate "+%s.%N")\011 '
  exec 3>&2 2>/tmp/bashstart.$$.log
  set -x
fi

# Enable debugging bashrc
export DEBUG_BASHRC=${DEBUG_BASHRC:-0}

shopt -s cdable_vars
complete -v -F _cd $nospace $filenames cd

########################################
# Bash completion
########################################
brew=$(brew --prefix)
[[ -r "${brew}/etc/profile.d/bash_completion.sh" ]] && source "${brew}/etc/profile.d/bash_completion.sh"

########################################
# Bash-specific environment variables
########################################
export BASH_COMPLETION_COMPAT_DIR="${brew}/etc/bash_completion.d"

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

########################################
# Source aliases, variables, extensions, etc. for other tools
########################################
dotfiles_include "docker"     && source "$DOTFILES/Docker/rosenberg.docker.sh" # Docker
dotfiles_include "dotnet"     && source "$DOTFILES/Dotnet/rosenberg.dotnet.sh" # .NET
dotfiles_include "maven"      && source "$DOTFILES/Maven/rosenberg.maven.sh" #Maven
dotfiles_include "java"       && source "$DOTFILES/Java/rosenberg.java.sh" # Java
dotfiles_include "openshift"  && source "$DOTFILES/Openshift/rosenberg.openshift.sh" # Openshift
dotfiles_include "olson"      && source "$DOTFILES/Olson/rosenberg.olson.sh" # Work-specific config
dotfiles_include "aws"        && source "$DOTFILES/AWS/rosenberg.aws.sh" #AWS
dotfiles_include "git"        && source "$DOTFILES/Git/rosenberg.git.sh" # Git

# After sourcing the above, reset PS1
export PS1="${PS1_START}${PS1_STATUS}${PS1_END}"
# echo "PS1: $PS1" # DEBUG
# echo "PROMPT_COMMAND: $PROMPT_COMMAND" # DEBUG

########################################
# End profile .bashrc
# per https://www.rosipov.com/blog/profiling-slow-bashrc/
########################################
if [[ $PROFILE_BASHRC -eq 1 ]]; then
  set +x
  exec 2>&3 3>&-
fi
<<<<<<< HEAD
=======

alias cd='pushd' # Always use pushd instead of cd
>>>>>>> 7c173e4 (Add optional debugging, new aliases)
