# A sample of a .bashrc file to use in setting up a new environment
# Contains basic preferences and sources rosenberg.bashrc.sh
# Place this in ~/.bashrc

########################################
# Source more environment variables from .profile
########################################

if [ -f ~/.profile ]; then
   source ~/.profile
fi

########################################
# Project-specific aliases
########################################

# Include links to any alias files specific to this computer

########################################
# Source the rest from dotfiles
########################################

source "$DOTFILES/Bash/rosenberg.bashrc.sh"