#! /usr/bin/env pwsh

##
# mssql-cli
##
function mssql { & mssql-cli }
function mssql-light { & mssql-cli --mssqlclirc "$Env:XDG_CONFIG_HOME/mssqlcli/mssqlcli-light.config"}
function mssql-dark { & mssql-cli --mssqlclirc "$Env:XDG_CONFIG_HOME/mssqlcli/mssqlcli-dark.config"}