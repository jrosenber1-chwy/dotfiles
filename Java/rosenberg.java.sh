#! /usr/bin/env bash

########################################
# Initialize jEnv
########################################
eval "$(jenv init -)"
plugins=$(jenv plugins --enabled)
if [[ ! "${plugins[@]}" =~ "export" ]]; then
    jenv enable-plugin 'export'
fi
if dotfiles_include "maven"; then
  if [[ ! "${plugins[@]}" =~ "maven" ]]; then
      jenv enable-plugin 'maven'
  fi
fi