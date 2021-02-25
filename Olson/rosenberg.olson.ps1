#!/usr/bin/env pwsh

$Env:DOCKER_REPO = "dockerreg-prod.icfolson.com"
$Env:DOCKER_BUILDKIT = 1 # Turn on Docker buildkit

########################################
# Project-specific aliases
########################################

# . "${Env:AREAS}/Convergence/local-config/ConvergenceAliases.ps1"