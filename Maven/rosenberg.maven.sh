#!/usr/bin/env bash

########################################
# Maven aliases
########################################

alias mci='mvn clean install -DskipTests -DskipIntegrationTests'
alias mcit='mvn clean install'
alias mcp='mvn clean package -DskipTests'
alias mcpr='mvn clean process-resources'
alias mpr='mvn process-resources'
alias mct='mvn clean test'