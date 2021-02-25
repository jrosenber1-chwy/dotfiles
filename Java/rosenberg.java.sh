#! /usr/bin/env bash

[[ ${DEBUG_BASHRC} -eq 1 ]] && echo "rosenberg.java.sh" && echo

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