#!/usr/bin/env bash

########################################
# Maven aliases
########################################

run_tests_for_pattern() {
  mvn clean test -Dtest="*${1}*" -DfailIfNoTests=false | grep "ERROR"
}

alias mci='mvn clean install -DskipTests -DskipIntegrationTests'
alias mcit='mvn clean install'
alias mcp='mvn clean package -DskipTests'
alias mcpr='mvn clean process-resources'
alias mpr='mvn process-resources'
alias mct='mvn clean test'
alias mctp='run_tests_for_pattern'
