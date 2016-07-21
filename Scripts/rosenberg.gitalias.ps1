################################################
# PowerShell wrappers for Git commands / aliases
#-----------------------------------------------
# 
# Where possible, prefer to create aliases in
# .gitconfig and just wrap in PowerShell
#
# This way, can update command behaviors,
# formatting, etc. across all providers
# in .gitconfig 
################################################

#git log
function Use-GitLg { & git lg $args } #Git alias
Set-Alias -Name lg -Value Use-GitLg
Set-Alias -Name gl -Value Use-GitLg -Force -Option AllScope

function Use-GitSlg { & git slg } #Git alias
Set-Alias -Name slg -Value Use-GitSlg

#git status
function Use-GitSt { & git st $args } #Git alias
Set-Alias -Name status -Value Use-GitSt
Set-Alias -Name gs -Value Use-GitSt

#git add
function Use-GitAdd { & git add $args }
Set-Alias -Name add -Value Use-GitAdd
Set-Alias -Name ga -Value Use-GitAdd

#git diff
function Use-GitDiff { & git diff $args }
Set-Alias -Name diff -Value Use-GitDiff -Force -Option AllScope
Set-Alias -Name gd -Value Use-GitDiff

#git commit
function Use-GitCommit { & git commit $args }
Set-Alias -Name commit -Value Use-GitCommit -Force -Option AllScope
Set-Alias -Name gc -Value Use-GitCommit -Force -Option AllScope

#git checkout
function Use-GitChk { & git chk $args } #Git alias
Set-Alias -Name checkout -Value Use-GitChk -Force -Option AllScope
Set-Alias -Name chk -Value Use-GitChk -Force -Option AllScope
Set-Alias -Name gchk -Value Use-GitChk -Force -Option AllScope

function Use-GitDev { & git dev $args } #Git alias
Set-Alias -Name dev -Value Use-GitDev -Force -Option AllScope
Set-Alias -Name gcd -Value Use-GitDev -Force -Option AllScope
Set-Alias -Name gdev -Value Use-GitDev -Force -Option AllScope

#git pull
function Use-GitPull { & git pull $args }
Set-Alias -Name pull -Value Use-GitPull -Force -Option AllScope
Set-Alias -Name gp -Value Use-GitPull -Force -Option AllScope

#git push
function Use-GitPush { & git push $args }
Set-Alias -Name push -Value Use-GitPush -Force -Option AllScope