#! /usr/bin/env bash

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
alias lg='git lg'
alias gl='git lg'

alias slg='git slg'

alias status='git st'
alias gs='git st'

alias sha='git sha'

alias add='git add'
alias ga='git add'
alias addall='git addall'
alias aa='git addall'

alias diff='git diff'
alias gd='git diff'

alias commit='git commit'
alias gc='git commit'
alias amend='git commit -a --amend'

alias chk='git chk'
alias checkout='git chk'

alias dev='git dev'
alias devp='git devp'
alias main='git main'
alias mainp='git mainp'

alias merge='git merge'

alias fetch='git fetch'

alias pull='git pull'
alias gp='git pull'

alias push='git push'

alias show='git show'