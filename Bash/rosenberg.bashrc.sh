#!/usr/bin/env bash

########################################
# Profile .bashrc
# per https://www.rosipov.com/blog/profiling-slow-bashrc/
# Set PROFILE_BASHRC to 1 to enable
########################################
PROFILE_BASHRC=${PROFILE_BASHRC:-0}
if [[ $PROFILE_BASHRC -eq 1 ]]; then
  # On macOS, need to use GNU CoreUtils date, which is aliased to gdate
  PS4='+ $(gdate "+%s.%N")\011 '
  exec 3>&2 2>/tmp/bashstart.$$.log
  set -x
fi

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
export PS1='\n\[\e[33m\]\w\[\e[m\]\n\$ '
export PS2=">>> "

echo "Bash path: $(which bash)"

########################################
# Commands and functions
########################################

# make a directory and cd to it
mcd() {
    test -d "$1" || mkdir -p "$1" && pushd "$1"
}

########################################
# Git setup
########################################

if dotfiles_include "git"; then
  # Source these if Git is installed through Homebrew
  if [ -f "${brew}/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    echo "Using Git via Homebrew: $(which git)"
    source "${brew}/etc/bash_completion.d/git-completion.bash"
    source "${brew}/etc/bash_completion.d/git-prompt.sh"
    __GIT_PROMPT_DIR="${brew}/etc/bash_completion.d"
  # Source these if Xcode is installed
  elif [ -d /Applications/Xcode.app ]; then
    echo "Using Git via Xcode: $(which git)"
    source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"
    source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash"
  # Source these if just Command Line Tools are installed
  elif [ -d /Library/Developer ]; then
    echo "Using Git via Apple CLI tools: $(which git)"
    source "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
    source "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
  fi

  # Config
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS="yes"
  export PROMPT_COMMAND='__git_ps1 "\n\[\e[33m\]\w\[\e[m\]" "\n\\\$ ";'
fi

if [[ $BASH_VERSION == 5* ]]; then
  shopt -s globstar
fi

########################################
# Source aliases, variables, extensions, etc. for other tools
########################################
dotfiles_include "git"        && source "$DOTFILES/Git/rosenberg.gitalias.sh" # Git
dotfiles_include "docker"     && source "$DOTFILES/Docker/rosenberg.docker.sh" # Docker
dotfiles_include "dotnet"     && source "$DOTFILES/Dotnet/rosenberg.dotnet.sh" # Docker
dotfiles_include "maven"      && source "$DOTFILES/Maven/rosenberg.maven.sh" #Maven
dotfiles_include "java"       && source "$DOTFILES/Java/rosenberg.java.sh" # Java
dotfiles_include "openshift"  && source "$DOTFILES/Openshift/rosenberg.openshift.sh" # Openshift
dotfiles_include "olson"      && source "$DOTFILES/Olson/rosenberg.olson.sh" # Work-specific config
dotfiles_include "aws"        && source "$DOTFILES/AWS/rosenberg.aws.sh" #AWS

########################################
# End profile .bashrc
# per https://www.rosipov.com/blog/profiling-slow-bashrc/
########################################
if [[ $PROFILE_BASHRC -eq 1 ]]; then
  set +x
  exec 2>&3 3>&-
fi
