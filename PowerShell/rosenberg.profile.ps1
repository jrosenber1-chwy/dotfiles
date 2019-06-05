# Environment variables
$Env:XDG_DATA_HOME="$home/.local/share"
$Env:XDG_CONFIG_HOME="$home/.config"

# Load Posh-Git -- must be located in a standard path for modules!
# Or install with: PowerShellGet\Install-Module posh-git -Scope CurrentUser
Import-Module posh-git
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

# Source Path on macOS
# Per https://github.com/PowerShell/PowerShell/issues/6027
if ($IsMacOS -and $env:PATH -notmatch '\b/usr/local/bin\b') { # prevent repeated replacement of $env:PATH
  & { # Use a child scope, so that helper function setenv() doesn't linger.
    function setenv ($variable, $value) { [Environment]::SetEnvironmentVariable($variable, $value)  }
    # `/usr/libexec/path_helper -c` conveniently outputs something like 'setenv PATH "/usr/local/bin:..."',
    # which we can pass to Invoke-Expression, which then calls our transient `setenv()` function.
    Invoke-Expression (/usr/libexec/path_helper -c)  
  }
}

# Include aliases
. "$Env:DOTFILES/Git/rosenberg.gitalias.ps1"
. "$Env:DOTFILES/PowerShell/rosenberg.pwshalias.ps1"
. "$Env:DOTFILES/PowerShell/rosenberg.dockeralias.ps1"

# Customize the prompt
function prompt {
  $origLastExitCode = $LASTEXITCODE
  Write-Host "$($ExecutionContext.SessionState.Path.CurrentLocation) " -ForegroundColor Green -NoNewline
  Write-VcsStatus
  Write-Host #Newline
  $LASTEXITCODE = $origLastExitCode
  "$('>' * ($nestedPromptLevel + 1)) "
}