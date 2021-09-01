# NOTE: Must be running in an administrative prompt!
if ( ! ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    throw "Insufficient permissions to run this script. Open the PowerShell console as an administrator and run this script again."
}

if ( Get-ExecutionPolicy -eq "Restricted" ) {
    throw "Insufficient execution policy to run this script. Set execution policy to Remote-Signed and run this script again."
}

if (! Test-Path -Path "$home/.dotfilestoload") {
    throw "Before installation, please define all modules to be loaded in `$HOME/.dotfilestoload"
}

function Use-Dotfile() { # Expects one argument -- module name
  Param(
    [Parameter(Mandatory=$true)]
    [string]$ModuleName
  )
  if (! (Test-Path -Path $Env:DOTFILESTOLOAD)) {
    throw "Can't find `$DOTFILESTOLOAD file"
  }
  else {
    $dotfilesContent = Get-Content -Path $Env:DOTFILESTOLOAD
    return $dotfilesContent -contains $ModuleName # Needs a complete (but case-insensitive) match, so commented lines won't match
  }
}

# Install Chocolatey
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


########################################
# Install packages
########################################

Install-Module oh-my-posh -Scope CurrentUser -Force

if (Use-Dotfile "git") {
    choco install -y git
    Install-Module posh-git -Scope CurrentUser -Force
}

if (Use-Dotfile "maven") {
    choco install -y maven
}