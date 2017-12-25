# A sample of a .bashrc file to use in setting up a new environment
# Contains basic preferences and sources rosenberg.bashrc.sh
# Place this in ~/.bashrc

# Source more environment variables from .profile
if [ -f ~/.profile ]; then
   source ~/.profile
fi

# Shared configuration
source "$SHELLTOOLS/Bash/rosenberg.bashrc.sh"