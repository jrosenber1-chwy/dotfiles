function Get-GitLog { & git lg $args }
Set-Alias -Name lg -Value Get-GitLog
Set-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

function Get-GitStatus { & git status $args }
Set-Alias -Name status -Value Get-GitStatus
Set-Alias -Name gs -Value Get-GitStatus

function Get-GitAdd { & git add $args }
Set-Alias -Name add -Value Get-GitAdd
Set-Alias -Name ga -Value Get-GitAdd

function Get-GitDiff { & git diff $args }
Set-Alias -Name diff -Value Get-GitDiff -Force -Option AllScope
Set-Alias -Name gd -Value Get-GitDiff