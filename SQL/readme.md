# mssql-cli

Linking an external path, like I'm doing for Git/Bash/PowerShell, isn't supported by mssql-cli.
Instead, use symlinks to my dotfiles.

Mac:
```bash
pushd "$XDG_CONFIG_HOME/mssqlcli"
rm config
ln -s "$DOTFILES/SQL/mssqlcli-light.config" "config"
ln -s "$DOTFILES/SQL/mssqlcli-light.config"
ln -s "$DOTFILES/SQL/mssqlcli-dark.config"
popd
```

```powershell
pushd "$Env:XDG_CONFIG_HOME/mssqlcli"
rm config
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