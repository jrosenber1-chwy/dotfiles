########################################
# Powershell aliases
########################################

# View profiles
# - because I can never remember how to see all of these
# - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles
# - https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/
function Use-Profile { $profile | Select * } 
Set-Alias -Name profile -Value Use-Profile

Function Test-CommandExists{
    Param ($command)
    try {
        if(Get-Command $command){RETURN $true}
    }
    catch {Write-Host “$command does not exist”; RETURN $false}
    finally {$ErrorActionPreference=$oldPreference}
} #end function test-CommandExists