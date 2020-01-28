#!/usr/bin/env bash

# Any Bash-specific environment variables here

########################################
# Customize prompt
########################################
export PS1='\n\[\e[33m\]\w\[\e[m\]\n\$ '
export PS2=">>> "

echo "Bash path: $(which bash)"

########################################
# Git setup
########################################

if dotfiles_include "git"; then
  # Source these if Git is installed through Homebrew
  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    echo "Using Git via Homebrew: $(which git)"
    source "$(brew --prefix git)/etc/bash_completion.d/git-completion.bash"
    source "$(brew --prefix git)/etc/bash_completion.d/git-prompt.sh"
    __GIT_PROMPT_DIR="$(brew --prefix git)/etc/bash_completion.d"
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
dotfiles_include "git"    && source "$DOTFILES/Git/rosenberg.gitalias.sh" # Git
dotfiles_include "docker" && source "$DOTFILES/Docker/rosenberg.docker.sh" # Docker
dotfiles_include "maven"  && source "$DOTFILES/Maven/rosenberg.maven.sh" #Maven
dotfiles_include "java"   && source "$DOTFILES/Java/rosenberg.java.sh" # Java