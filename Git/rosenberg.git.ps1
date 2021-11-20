########################################
# Shell wrappers for Git commands / aliases
######################################## 
# Where possible, prefer to create aliases in
# .gitconfig and just wrap in shell aliases
#
# This way, can update command behaviors,
# formatting, etc. across all providers
# in .gitconfig 
########################################

#git log
function Invoke-GitLg { & git lg $args } #Git alias
Set-Alias -Name lg -Value Invoke-GitLg
Set-Alias -Name gl -Value Invoke-GitLg -Force -Option AllScope

function Invoke-GitSlg { & git slg } #Git alias
Set-Alias -Name slg -Value Invoke-GitSlg

#git status
function Invoke-GitSt { & git st $args } #Git alias
Set-Alias -Name status -Value Invoke-GitSt
Set-Alias -Name gs -Value Invoke-GitSt

#get commit SHA
function Invoke-GitSha { & git sha }
Set-Alias -Name sha -Value Invoke-GitSha

#git add
function Invoke-GitAdd { & git add $args }
Set-Alias -Name add -Value Invoke-GitAdd
Set-Alias -Name ga -Value Invoke-GitAdd

#git addall
function Invoke-GitAddAll { & git addall }
Set-Alias -Name addall -Value Invoke-GitAddAll
Set-Alias -Name aa -Value Invoke-GitAddAll

#git diff
function Invoke-GitDiff { & git diff $args }
Set-Alias -Name diff -Value Invoke-GitDiff -Force -Option AllScope
Set-Alias -Name gd -Value Invoke-GitDiff

#git commit
function Invoke-GitCommit { & git commit $args }
Set-Alias -Name commit -Value Invoke-GitCommit -Force -Option AllScope
Set-Alias -Name gc -Value Invoke-GitCommit -Force -Option AllScope

function Invoke-GitAmend { & git add --all; git commit --amend --no-edit }
Set-Alias -Name amend -Value Invoke-GitAmend -Force -Option AllScope

#git checkout
function Invoke-GitChk { & git chk $args } #Git alias
Set-Alias -Name checkout -Value Invoke-GitChk -Force -Option AllScope
Set-Alias -Name chk -Value Invoke-GitChk -Force -Option AllScope
Set-Alias -Name gchk -Value Invoke-GitChk -Force -Option AllScope

function Invoke-GitDev { & git dev $args } #Git alias
Set-Alias -Name dev -Value Invoke-GitDev -Force -Option AllScope

function Invoke-GitDevP { & git devp $args } #Git alias
Set-Alias -Name devp -Value Invoke-GitDevP -Force -Option AllScope

function Invoke-GitMain { & git main $args } #Git alias
Set-Alias -Name main -Value Invoke-GitMain -Force -Option AllScope

function Invoke-GitMainP { & git mainp $args } #Git alias
Set-Alias -Name mainp -Value Invoke-GitMainP -Force -Option AllScope

function Invoke-GitMaster { & git master $args } #Git alias
Set-Alias -Name master -Value Invoke-GitMaster -Force -Option AllScope

function Invoke-GitMasterP { & git masterp $args } #Git alias
Set-Alias -Name masterp -Value Invoke-GitMasterP -Force -Option AllScope

#git merge
function Invoke-GitMerge { & git merge $args }
Set-Alias -Name merge -Value Invoke-GitMerge -Force -Option AllScope

#git fetch
function Invoke-GitFetch { & git fetch $args }
Set-Alias -Name fetch -Value Invoke-GitFetch -Force -Option AllScope

#git pull
function Invoke-GitPull { & git pull $args }
Set-Alias -Name pull -Value Invoke-GitPull -Force -Option AllScope
Set-Alias -Name gp -Value Invoke-GitPull -Force -Option AllScope

#git push
function Invoke-GitPush { & git push $args }
Set-Alias -Name push -Value Invoke-GitPush -Force -Option AllScope

#git show
function Invoke-GitShow { & git show $args }
Set-Alias -Name show -Value Invoke-GitShow -Force -Option AllScope