# A sample of a profile.ps1 file to use in setting up a new environment
# Contains basic preferences and an include pointing to rosenberg.profile.ps1
# Place this in the path returned by $profile.CurrentUserAllHosts

$DebugPreference = "SilentlyContinue"
$VerbosePreference = "SilentlyContinue"

########################################
# Environment variables
########################################
$Env:DOTFILES="$home/dotfiles" # environment variable for my personal dotfiles
$Env:DOTFILESTOLOAD="$home/local-config/.dotfilestoload" # list of dotfiles modules to load
$Env:SHELL="/usr/local/bin/pwsh" # use Pwsh
$Env:EDITOR="nano"
$Env:PROJECTS="/Users/jrosenber1/Documents/1_Projects/"
$Env:AREAS="/Users/jrosenber1/Documents/2_Areas"
$Env:RESOURCES="/Users/jrosenber1/Documents/3_Resources"

# Shared configuration
. "$Env:DOTFILES/PowerShell/rosenberg.profile.ps1"

# Place any computer-specific configuration below
# . "$home/Documents/MyAwesomeProject/MyAwesomeAliases.ps1"

# Use PyEnv for Python version
# see: https://github.com/pyenv/pyenv#readme
$Env:PYENV_ROOT ??= (pyenv root)
$Env:PATH="${Env:PYENV_ROOT}/shims:${Env:PATH}"

# Once all configs are loaded, allow DEBUG and VERBOSE messages
$DebugPreference = "Continue"
$VerbosePreference = "Continue"