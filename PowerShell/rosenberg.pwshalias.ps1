########################################
# Powershell aliases
########################################

# View profiles
# - because I can never remember how to see all of these
# - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles
# - https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/

function Get-Profile { $profile | Select-Object * } 
Set-Alias -Name profile -Value Get-Profile

function Initialize-Profile {
    & $profile.CurrentUserAllHosts
}

##
# Directory stacks
##

# Point `cd` at `Push-Location` instead of `Set-Location`
function Push-JroLocation {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$Path,
        [Parameter(Position = 1)]
        $StackName = $null
    )
    if ($PSBoundParameters.ContainsKey("StackName")) {
        Push-Location -Path "$Path" -StackName $StackName
    }
    else { # Use the current stack
        Push-Location -Path "$Path"
    }
}
Set-Alias -Name cd -Value Push-JroLocation -Force -Option AllScope # Override the existing alias
Set-Alias -Name pushd -Value Push-JroLocation -Force -Option AllScope # Override the existing alias

# Override `popd` to accept $StackName as a positional parameter
function Pop-JroLocation {
    param (
        [Parameter(Position = 0)]
        $StackName = $null
    )
    if ($PSBoundParameters.ContainsKey("StackName")) {
        Pop-Location -StackName $StackName
    } else { # Use the current stack
        Pop-Location
    }
}
Set-Alias -Name popd -Value Pop-JroLocation -Force -Option AllScope # Override the existing alias

# Create a `showd` function to show the current directory stack
function showd ($StackName = $null) { 
    if ($PSBoundParameters.ContainsKey("StackName")) {
        Get-Location -Stack -StackName $StackName
    } else { # Use the current stack
        Get-Location -Stack
    }
}

# Replacment for GNU `which`
# Partially via: https://devblogs.microsoft.com/scripting/use-a-powershell-function-to-see-if-a-command-exists/ 
function Test-CommandExists {
    Param ($command)
    try {
        Write-Host $(Get-Command $command | Select-Object -Property Name,Version,Source)
        return $true
    }
    catch {
        return $false
    }
} #end function test-CommandExists
if ($IsWindows) {
    Set-Alias -Name which -Value Test-CommandExists
}

function Set-Debug {
    Param (
        [boolean]$Enabled = $true
    )

    if ($Enabled) {
        $DebugPreference = "Continue"
    }
    else {
        $DebugPreference = "SilentlyContinue"
    }
}

function Set-Verbose {
    Param (
        [boolean]$Enabled = $true
    )

    if ($Enabled) {
        $VerbosePreference = "Continue"
    }
    else {
        $VerbosePreference = "SilentlyContinue"
    }
}