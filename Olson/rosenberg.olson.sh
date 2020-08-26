#!/usr/bin/env bash

########################################
# Project-specific aliases
########################################

source /Users/jrosenberg/Documents/Projects/Hilton/HiltonAliases.sh
source /Users/jrosenberg/Documents/Projects/Tally/CoreAliases.sh
source /Users/jrosenberg/Documents/Projects/AEP/AepAliases.sh
alias hgp='pushd ~/Documents/Projects/Hyatt/_git/hyatt-client-services'
alias hyatt='pushd ~/Documents/Projects/Hyatt/_git/hyatt-client-services'

########################################
# Securely access my password as an environment variable
# WIP, don't commit this until I have something secure
########################################

DOCKER_REPO="dockerreg-prod.icfolson.com"

REMOVE_OLSON_ENV_VARS() {
  unset TALLY_PATH
  unset CORE_PATH
  unset HOTEL_PATH
  unset REPORTING_PATH
  unset REPORTING_TEST_PATH
  unset CORE_INGESTION_PATH
  unset CORE_INGESTION_DATA_PATH
  unset INGESTION_DATA_PATH
  unset INTEGRATION_PATH
  unset YOSEMITE_USERNAME
  unset YOSEMITE_PASSWORD
  unset INGESTION_PATH
  unset HOTEL_QA_SVC
  unset HOTEL_STG_SVC
  unset TAL_REDIS_PWD
  unset AEP_PATH
  unset AEP_AUTH_CLIENT_SECRET
  unset AEP_AUTH_API_KEY
  unset AEP_AUTH_PRIVATE_KEY_DIR
  unset AEP_AUTH_PRIVATE_KEY_PATH
  unset HHHMIG
  unset HHHRPT
  unset EMAILTOOVERRIDE
}