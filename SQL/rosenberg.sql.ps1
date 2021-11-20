#! /usr/bin/env pwsh

##
# Shared Kerberos auth functionality
##
function Request-KerberosTicket {
  & klist --test
  if ( $? -eq $false ) {
    & kinit --keychain "$Env:SQL_SERVER_USER"
    & kswitch --type=API --principal="$Env:SQL_SERVER_USER"
  }
}

##
# mssql-cli
##
function Open-MSSqlCli {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$false, Position=1)]
    [string]$Server = $Env:SQL_SERVER_DEFAULT_SERVER,
    [Parameter(Mandatory=$false, Position=2)]
    [string]$Database = $Env:SQL_SERVER_DEFAULT_DATABASE,
    [switch]$Light,
    [switch]$Dark
  )

  # Build command arguments
  $cmdArgs = @() # Empty array
  $cmdArgs += "--server"; $cmdArgs += $Server
  $cmdArgs += "--database"; $cmdArgs += $Database
  if ($Server -ne $Env:SQL_SERVER_DEFAULT_SERVER) { $cmdArgs += "--integrated"}
  if ($Light) { $cmdArgs += "--mssqlclirc"; $cmdArgs += "$Env:XDG_CONFIG_HOME/mssqlcli/mssqlcli-light.config"}
  elseif ($Dark) { $cmdArgs += "--mssqlclirc"; $cmdArgs += "$Env:XDG_CONFIG_HOME/mssqlcli/mssqlcli-dark.config"}
  Write-Debug "mssql-cli $cmdArgs"

  # Renew authentication if necessary, then launch mssql-cli
  Request-KerberosTicket
  & mssql-cli $cmdArgs
}
Set-Alias -Name mssql -Value Open-MSSqlCli
Set-Alias -Name sql -Value Open-MSSqlCli

function Open-AzureDataStudio {
  Request-KerberosTicket
  & open '/Applications/Azure Data Studio.app/'
}
Set-Alias -Name ads -Value Open-AzureDataStudio
Set-Alias -Name azure -Value Open-AzureDataStudio