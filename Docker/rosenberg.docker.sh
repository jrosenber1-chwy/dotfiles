#!/usr/bin/env bash

########################################
# Docker aliases
########################################

alias dls='docker container ls'
alias dlsa='docker container ls -a'
alias drm='docker container rm'
alias dl='docker container logs'
alias dlf='docker container logs --tail 100 -f'
alias dvls='docker volume ls'

########################################
# Docker-Compose aliases
########################################

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcs='docker-compose stop'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs --tail 100 --follow'
alias dcj='docker-compose -f docker-compose.jro.yml'
alias dcju='docker-compose -f docker-compose.jro.yml up -d'
alias dcjd='docker-compose -f docker-compose.jro.yml down'
alias dcjd='docker-compose -f docker-compose.jro.yml stop'
alias dcjl='docker-compose -f docker-compose.jro.yml logs'
alias dcjlf='docker-compose -f docker-compose.jro.yml logs --tail 100 --follow'

########################################
# Docker environment variables
########################################

export COMPOSE_HTTP_TIMEOUT=300