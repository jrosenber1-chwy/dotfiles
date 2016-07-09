function Get-GitLog { & git lg $args }
Set-Alias -Name lg -Value Get-GitLog
Set-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

function Get-GS { & git status $args } #Get-GitStatus taken by posh-git
Set-Alias -Name status -Value Get-GS
Set-Alias -Name gs -Value Get-GS

function Get-GitAdd { & git add $args }
Set-Alias -Name add -Value Get-GitAdd
Set-Alias -Name ga -Value Get-GitAdd

function Get-GitDiff { & git diff $args }
Set-Alias -Name diff -Value Get-GitDiff -Force -Option AllScope
Set-Alias -Name gd -Value Get-GitDiff