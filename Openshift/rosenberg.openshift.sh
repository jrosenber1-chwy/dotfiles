#!/usr/bin/env bash

export OPENSHIFT_PROD="https://tal-openshift-prod.yosemite.local:8443"

function openshift_login() {
  oc login "$OPENSHIFT_PROD" -u $YOSEMITE_USERNAME -p $(GET_YOSEMITE_PWD)
}
alias oclogin='openshift_login'
alias kclogin='openshift_login'

alias kc='kubectl'

# Kubernetes functions
# Since kubectl requires a resource type to be passed in,
# accept a resource type as an argument but default to "pods"
function kubectl_get() {
  kubectl get ${1:-pods}
}
function kubectl_delete() {
  kubectl delete ${1:-pod} "${2}"
}
function kubectl_switch() {
  kubectl config set-context --current --namespace=${1}
}

alias kls='kubectl_get'
alias kpods='kubectl_get'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias krm='kubectl_delete'
alias kdsc='kubectl describe'
alias kswitch='kubectl_switch'
alias ksw='kubectl_switch'

function minikube_start() {
  minikube start --vm-driver=virtualbox
}

alias mks='minikube_start'

# Create a function that will easily start and configure minishift
function minishift_start() {
  minishift start
  eval $(minishift oc-env)
# eval $(minishift docker-env)
}
