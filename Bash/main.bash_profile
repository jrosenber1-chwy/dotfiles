###
### Don't put stuff here!
###

###
### This file just sources .bashrc and .profile
### Put things in those places instead
###

###
### Bash-specific: .bashrc
### Everything else: .profile
###

if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi