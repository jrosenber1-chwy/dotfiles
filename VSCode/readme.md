Linking an external path, like I'm doing for Git/Bash/PowerShell, isn't supported by VS Code. Instead, use symlinks to my dotfiles.

Mac:
```bash
pushd ~/'Library/Application Support/Code/User'
ln -s $DOTFILES/VSCode/settings.json
ln -s $DOTFILES/VSCode/keybindings.json 
ln -s $DOTFILES/VSCode/snippets/
```