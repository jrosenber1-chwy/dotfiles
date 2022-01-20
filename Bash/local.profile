# Profile configuration specific to this machine

########################################
# Environment variables
########################################
# export SHELL="/usr/bin/env bash" # use Bash
export SHELL="/usr/local/bin/pwsh" # use Pwsh

########################################
# PATH
########################################

# On MacOS, instead of environment variables, add paths to /etc/paths.d/personal
# On Linux, make additions to PATH below - try to keep PATH mostly defined in .profile rather than .bashrc
# export PATH="$PATH"

########################################
# Editor
########################################

# Set the default editor
# May not always want this, so not placing in rosenberg.profile.sh
# export EDITOR="code --new-window --wait" # VS Code
export EDITOR="nano"
