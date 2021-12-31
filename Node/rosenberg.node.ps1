#! /usr/bin/env pwsh

# Based on: https://github.com/nvm-sh/nvm/issues/2058#issuecomment-735551849
function Initialize-NvmPath {
    $ENV:NVM_DIR = "$HOME/.nvm"
    $bashPathWithNvm = bash -c 'source $NVM_DIR/nvm.sh && echo $PATH' #TODO: extract only NVM path strings?
    $env:PATH = $bashPathWithNvm
}

function nvm {
    $quotedArgs = ($args | ForEach-Object { "'$_'" }) -join ' '
    $command = 'source $NVM_DIR/nvm.sh && nvm {0}' -f $quotedArgs
    bash -c $command
}

Initialize-NvmPath