#!/bin/bash

# Any Bash-specific environment variables here


# Command prompt
export PS1='\n\[\e[33m\]\w\[\e[m\]\n\$ '
export PS2=">>> "

# Git setup
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh"
export PROMPT_COMMAND='__git_ps1 "\n\[\e[33m\]\w\[\e[m\]" "\n\\\$ ";'
source "/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash"

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

