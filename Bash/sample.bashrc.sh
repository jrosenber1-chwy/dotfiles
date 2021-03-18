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
# Set environment variables specific to this machine
########################################

PROFILE_BASHRC=0
DEBUG_BASHRC=0
BREW="/usr/local"

########################################
# Source the rest from dotfiles
########################################

source "$DOTFILES/Bash/rosenberg.bashrc.sh"

########################################
# Additional commands that are:
# (1) machine-specific
# (2) not in a source-controlled script
########################################
