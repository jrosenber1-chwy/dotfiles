# A sample of a .profile file to use in setting up a new environment
# Contains basic preferences and sources rosenberg.profile.sh
# Place this in ~/.profile

# Environment variables
export DOTFILES="~/Documents/dotfiles" # environment variable for my personal dotfiles
export PATH="$PATH" # try to keep PATH mostly defined in .profile rather than .bashrc

# Shared configuration
source "$DOTFILES/Bash/rosenberg.profile.sh"

# Use VS Code as the default editor
# May not always want this, so not placing in rosenberg.profile.sh
export EDITOR="code --new-window --wait" # Visual studio code -- should already be in path