#! /usr/bin/env pwsh

##
# Shpotify
# see: https://github.com/hnarayanan/shpotify
##
function Invoke-Spotify { & spotify $args }
Set-Alias -Name "s" -Value Invoke-Spotify
Set-Alias -Name "spot" -Value Invoke-Spotify
function play { & spotify play }
function pause { & spotify pause }