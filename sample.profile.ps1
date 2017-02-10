# A sample of a profile.ps1 file to use in setting up a new environment
# Contains basic preferences and an include pointing to rosenberg.gitalias.ps1
# Place this in the path returned by $profile.CurrentUserAllHosts
# Place the Posh-Git module in ~\Documents\WindowsPowerShell\Modules\posh-git

$DebugPreference = "Continue"
$VerbosePreference = "Continue"

# Customize the prompt
function prompt {
    $origLastExitCode = $LASTEXITCODE
    Write-Host "$($ExecutionContext.SessionState.Path.CurrentLocation) " -ForegroundColor Green -NoNewline
    Write-VcsStatus
    Write-Host #Newline
    $LASTEXITCODE = $origLastExitCode
    "$('>' * ($nestedPromptLevel + 1)) "
}

# Load Posh-Git -- must be located in a standard path for modules!
Import-Module posh-git
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

# git PowerShell aliases
. "$($env:USERPROFILE)\Documents\Git\GitTools\Scripts\rosenberg.gitalias.ps1"