
#! /usr/bin/env pwsh

$Env:GOPATH="$Env:HOME/golang"
$Env:GOROOT="/usr/local/opt/go/libexec"
$Env:PATH="${Env:PATH}:${Env:GOPATH}/bin:${Env:GOROOT}/bin"
$Env:GO111MODULE="on"