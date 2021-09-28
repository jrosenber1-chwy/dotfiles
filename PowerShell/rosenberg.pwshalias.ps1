########################################
# Powershell aliases
########################################

# View profiles
# - because I can never remember how to see all of these
# - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles
# - https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/
function Use-Profile { $profile | Select * } 
Set-Alias -Name profile -Value Use-Profile

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