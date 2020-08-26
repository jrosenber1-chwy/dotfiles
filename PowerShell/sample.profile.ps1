# A sample of a profile.ps1 file to use in setting up a new environment
# Contains basic preferences and an include pointing to rosenberg.gitalias.ps1
# Place this in the path returned by $profile.CurrentUserAllHosts
# Place the Posh-Git module in ~\Documents\WindowsPowerShell\Modules\posh-git

$DebugPreference = "SilentlyContinue"
$VerbosePreference = "SilentlyContinue"

$Env:DOTFILES="$home/dotfiles" # environment variable for my personal dotfiles
$Env:DOTFILESTOLOAD="$home/.dotfilestoload" # list of dotfiles modules to load

# Shared configuration
. "$Env:DOTFILES/PowerShell/rosenberg.profile.ps1"

# Place any computer-specific configuration below
# . "$home/Documents/MyAwesomeProject/MyAwesomeAliases.ps1"

# Once all configs are loaded, allow DEBUG and VERBOSE messages
$DebugPreference = "Continue"
$VerbosePreference = "Continue"