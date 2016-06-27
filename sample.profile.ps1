# A sample of a profile.ps1 file to use in setting up a new environment
# Contains basic user information and an include pointing to rosenberg.gitconfig
# Place this in the path returned by $profile.CurrentUserAllHosts

$DebugPreference = "Continue"
$VerbosePreference = "Continue"

# Load PowerShell aliases
. "$($env:USERPROFILE)\Documents\Git\GitTools\Scripts\rosenberg.gitalias.ps1"

# Load posh-git example profile
. "$($env:USERPROFILE)\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1"