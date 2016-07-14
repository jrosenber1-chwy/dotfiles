#git log
function Get-GitLog { & git lg $args }
Set-Alias -Name lg -Value Get-GitLog
Set-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

function Get-ShortGitLog { & git lg -5 }
Set-Alias -Name slg -Value Get-ShortGitLog

#git status
function Get-GS { & git status $args } #Get-GitStatus taken by posh-git
Set-Alias -Name status -Value Get-GS
Set-Alias -Name gs -Value Get-GS

#git add
function Get-GitAdd { & git add $args }
Set-Alias -Name add -Value Get-GitAdd
Set-Alias -Name ga -Value Get-GitAdd

#git diff
function Get-GitDiff { & git diff $args }
Set-Alias -Name diff -Value Get-GitDiff -Force -Option AllScope
Set-Alias -Name gd -Value Get-GitDiff

#git diff
function Get-GitCommit { & git commit $args }
Set-Alias -Name commit -Value Get-GitCommit -Force -Option AllScope
Set-Alias -Name gc -Value Get-GitDiff -Force -Option AllScope