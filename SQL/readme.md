# mssql-cli

## Linking configs

Linking an external path, like I'm doing for Git/Bash/PowerShell, isn't supported by mssql-cli.
Instead, use symlinks to my dotfiles.

Mac:
```bash
pushd "$XDG_CONFIG_HOME/mssqlcli"
rm config
rm *.config
ln -s "$DOTFILES/SQL/mssqlcli-light.config" "config"
ln -s "$DOTFILES/SQL/mssqlcli-light.config"
ln -s "$DOTFILES/SQL/mssqlcli-dark.config"
popd
```

```powershell
pushd "$Env:XDG_CONFIG_HOME/mssqlcli"
rm config
rm *.config
ln -s "$Env:DOTFILES/SQL/mssqlcli-light.config" "config"
ln -s "$Env:DOTFILES/SQL/mssqlcli-light.config"
ln -s "$Env:DOTFILES/SQL/mssqlcli-dark.config"
popd
```

Windows:
```powershell
pushd "$Env:AppData/dbcli/mssqlcli"
rm config
New-Item -ItemType SymbolicLink -Path "config" -Target "$Env:DOTFILES/SQL/mssqlcli.config"
popd
```

## Authentication

For details on setting up Kerberos on macOS, see:
https://github.com/Microsoft/vscode-mssql/blob/master/KERBEROS_HELP.md

The following environment variables can be set in a local config file and will be read by mssql-cli.
These should not be added to source control since they could contain credentials.

```
SQL_SERVER_USER
MSSQL_CLI_USER
MSSQL_CLI_PASSWORD

# Not for authentication, for default param values
SQL_SERVER_DEFAULT_SERVER
SQL_SERVER_DEFAULT_DATABASE
```