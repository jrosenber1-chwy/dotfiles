################################################
# Powershell aliases
################################################

# View profiles
# - because I can never remember how to see all of these
# - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles
# - https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/
function Use-Profile { $profile | Select * } 
Set-Alias -Name profile -Value Use-Profile