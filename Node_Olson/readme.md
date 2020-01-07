Linking an external path, like I'm doing for Git/Bash/PowerShell, isn't supported by NPM. Instead, use symlinks to my dotfiles.

Mac:
```bash
pushd ~
ln -s "$DOTFILES/Node_Olson/.npmrc"
```

```powershell
pushd ~
ln -s "$Env:DOTFILES/Node_Olson/.npmrc"
```