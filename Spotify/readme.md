Linking an external path, like I'm doing for Git/Bash/PowerShell, isn't supported by VS Code. Instead, use symlinks to my dotfiles.

Mac:
```bash
pushd ~
rm .shpotify.cfg
ln -s "$DOTFILES/Spotify/.shpotify.cfg"
popd
```

```powershell
pushd ~
rm .shpotify.cfg
ln -s "$Env:DOTFILES/Spotify/.shpotify.cfg"
popd
```