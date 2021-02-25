#!/usr/bin/env bash

[[ ${DEBUG_BASHRC} -eq 1 ]] && echo "rosenberg.olson.sh" && echo

DOCKER_REPO="dockerreg-prod.icfolson.com"
DOCKER_BUILDKIT=1 # Turn on Docker buildkit

########################################
# Securely store and access Yosemite credneitla
# see https://github.com/plyint/encpass.sh
########################################
. /usr/local/bin/encpass.sh 

YOSEMITE_USERNAME="jrosenberg"
GET_YOSEMITE_CRED() {
  /usr/local/bin/encpass.sh show yosemite $1
}
GET_YOSEMITE_PWD() {
  /usr/local/bin/encpass.sh show yosemite password
}
LIST_YOSEMITE_CREDS() {
  /usr/local/bin/encpass.sh show yosemite
}
SET_YOSEMITE_PWD() {
  /usr/local/bin/encpass.sh update yosemite password
}
SET_YOSEMITE_CRED() {
  /usr/local/bin/encpass.sh update yosemite $1
}

########################################
# Project-specific aliases
########################################

source "${AREAS}/Convergence/local-config/ConvergenceAliases.sh"

# Unset all variables - use this when I need to share logs or things like that
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