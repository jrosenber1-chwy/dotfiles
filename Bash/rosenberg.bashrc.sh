#!/bin/bash

# Any Bash-specific environment variables here

#
# Customize prompt
#
export PS1='\n\[\e[33m\]\w\[\e[m\]\n\$ '
export PS2=">>> "

#
# Git setup
#

# Source these if Xcode is installed
if [ -d /Applications/Xcode.app ]; then
  source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"
  source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash"
fi

# Source these if just Command Line Tools are installed
if [ -d /Library/Developer ]; then
  source "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
  source "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
fi

# Config
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
export PROMPT_COMMAND='__git_ps1 "\n\[\e[33m\]\w\[\e[m\]" "\n\\\$ ";'

#
# Aliases
#

# Mac OS CLI
eval $(thefuck --alias)

# Git - reference separate file
source "$DOTFILES/Git/rosenberg.gitalias.sh"

# Maven commands
alias mci='mvn clean install -DskipTests -DskipIntegrationTests'
alias mcit='mvn clean install'
alias mcp='mvn clean package -DskipTests'

