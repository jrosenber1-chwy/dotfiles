#!/usr/bin/env pwsh

if (! (Test-Path -Path "$home/.dotfilestoload")) {
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

########################################
# Install packages
########################################

Install-Module oh-my-posh -Scope CurrentUser -Force

if (Use-Dotfile "git") {
    Install-Module posh-git -Scope CurrentUser -Force
}
