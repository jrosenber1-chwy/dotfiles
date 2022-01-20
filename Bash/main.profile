# This is a stub - place it in ~/.profile
# It sources rosenberg.profile.sh for configs
# that I share across multiple machines, and
# local.profile for machine-specific configs.

########################################
# Environment variables
########################################
export DOTFILES="$HOME/dotfiles" # environment variable for my personal dotfiles
export LOCALCONFIG="$HOME/local-config"
export DOTFILESTOLOAD="$LOCALCONFIG/.dotfilestoload" # list of dotfiles modules to load
export PROJECTS="$HOME/Documents/1_Projects/"
export AREAS="$HOME/Documents/2_Areas"
export RESOURCES="$HOME/Documents/3_Resources"

########################################
# Source profile from dotfiles and local config
########################################

source "$LOCALCONFIG/local.profile"
source "$DOTFILES/Bash/rosenberg.profile.sh"