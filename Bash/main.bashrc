# This is a stub - place it in ~/.bashrc
# It sources rosenberg.bashrc.sh for configs
# that I share across multiple machines, and
# local.bashrc for machine-specific configs.

########################################
# Source more environment variables from .profile
########################################

if [ -f ~/.profile ]; then
   source ~/.profile
fi

########################################
# Source the rest from dotfiles and local config
########################################

source "$LOCALCONFIG/local.bashrc"
source "$DOTFILES/Bash/rosenberg.bashrc.sh"