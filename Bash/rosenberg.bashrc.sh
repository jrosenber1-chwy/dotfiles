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
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias flushcache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;'

# Git - reference separate file
source "$DOTFILES/Git/rosenberg.gitalias.sh"

# Maven commands
alias mci='mvn clean install -DskipTests -DskipIntegrationTests'
alias mcit='mvn clean install'
alias mcp='mvn clean package -DskipTests'

