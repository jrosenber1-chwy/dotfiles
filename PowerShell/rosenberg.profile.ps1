########################################
# Optionally enable debugging/profiling bashrc
########################################
$Env:PROFILE_STARTUP ??= $false
$Env:DEBUG_STARTUP ??= $false
if ($Env:PROFILE_STARTUP) {
  $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
}

########################################
# Environment variables
########################################

$Env:XDG_DATA_HOME="$home/.local/share"
$Env:XDG_CONFIG_HOME="$home/.config"
$Env:USE_OH_MY_POSH ??= $true

########################################
# Source Path on macOS
# Per https://github.com/PowerShell/PowerShell/issues/6027
########################################
if ($IsMacOS -and $env:PATH -notmatch '\b/usr/local/bin\b') { # prevent repeated replacement of $env:PATH
  & { # Use a child scope, so that helper function setenv() doesn't linger.
    function setenv ($variable, $value) { [Environment]::SetEnvironmentVariable($variable, $value)  }
    # `/usr/libexec/path_helper -c` conveniently outputs something like 'setenv PATH "/usr/local/bin:..."',
    # which we can pass to Invoke-Expression, which then calls our transient `setenv()` function.
    Invoke-Expression (/usr/libexec/path_helper -c)  
  }
}

########################################
# Determine dotfiles modules to load
########################################
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
# Source aliases, variables, extensions, etc. for other tools
########################################

. "$Env:DOTFILES/PowerShell/rosenberg.pwshalias.ps1"
if (Use-Dotfile "git") {
  . "$Env:DOTFILES/Git/rosenberg.git.ps1"
}
if (Use-Dotfile "docker") {
  . "$Env:DOTFILES/Docker/rosenberg.docker.ps1"
}
if (Use-Dotfile "dotnet") {
  . "$Env:DOTFILES/Dotnet/rosenberg.dotnet.ps1"
}
if (Use-Dotfile "maven") {
  . "$Env:DOTFILES/Maven/rosenberg.maven.ps1"
}
if (Use-Dotfile "olson") {
  . "$Env:DOTFILES/Olson/rosenberg.olson.ps1"
}
if (Use-Dotfile "chewy") {
  . "$Env:DOTFILES/Chewy/rosenberg.chewy.ps1"
}
if (Use-Dotfile "cli_tools") {
  . "$Env:DOTFILES/CLI_Tools/rosenberg.tools.ps1"
}
if (Use-Dotfile "sql") {
  . "$Env:DOTFILES/SQL/rosenberg.sql.ps1"
}
if (Use-Dotfile "node") {
  . "$Env:DOTFILES/Node/rosenberg.node.ps1"
}

########################################
# Load modules
########################################

# Place code in a standard path for modules
# Or install with: Install-Module module-name -Scope CurrentUser

Import-Module posh-git
if ($Env:USE_OH_MY_POSH -ne "false") {
  Import-Module oh-my-posh
}

########################################
# Customize the prompt
########################################

# posh-git prompt
# function global:PromptWriteErrorInfo() {
#   if ($global:GitPromptValues.DollarQuestion) { return }

#   if ($global:GitPromptValues.LastExitCode) {
#       "`e[31m(" + $global:GitPromptValues.LastExitCode + ") `e[0m"
#   }
#   else {
#       "`e[31m! `e[0m"
#   }
# }
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 0x00FF00
# $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n$(PromptWriteErrorInfo)'

# global pwsh prompt
if ($Env:USE_OH_MY_POSH) {
  Set-PoshPrompt -Theme patriksvensson
}
else {
  function prompt {
    $origDebugPreference = $DebugPreference
    $origLastExitCode = $LASTEXITCODE
    $DebugPreference = "SilentlyContinue"

    Write-Host "$($ExecutionContext.SessionState.Path.CurrentLocation) " -ForegroundColor Green -NoNewline
    Write-VcsStatus -
    Write-Host #Newline
    $LASTEXITCODE = $origLastExitCode
    "$('>' * ($nestedPromptLevel + 1)) "
    # & $GitPromptScriptBlock - # This was causing a doubled prompt, use one method or the other
    
    $DebugPreference = $origDebugPreference
  }
}

if ($Env:PROFILE_STARTUP) {
  Write-Host "Executed profile in $($stopwatch.Elapsed.TotalMilliseconds) milliseconds"
  $stopwatch.Stop()
}