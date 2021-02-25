#!/usr/bin/env bash

[[ ${DEBUG_BASHRC} -eq 1 ]] && echo "rosenberg.openshift.sh" && echo

# Openshift uses `oc`, use `kc` for kubectl
alias kc='kubectl'
alias ctx='kubectx'
alias kctx='kubectx'
complete -F __start_kubectl kc # Enable Bash completion for `kc`
complete -F __start_kubectl klf # Enable Bash completion for `klf`
complete -F __start_kubectl kls # Enable Bash completion for `kls`

source "${brew}/opt/kube-ps1/share/kube-ps1.sh"
# echo "Pre OpenShift PS1: $PS1" # DEBUG
export PS1_STATUS=' $(kube_ps1)'"${PS1_STATUS}"
# echo "Post OpenShift PS1: $PS1" # DEBUG

########################################
# Kubernetes functions
########################################

# Since kubectl requires a resource type to be passed in,
# accept a resource type as an argument but default to "pods"
function kubectl_get() {
  kubectl get ${1:-pods}
}
function kubectl_describe() {
  if [[ "$#" -eq 1 ]]; then
    type="pod"
    target="$1"
  elif [[ "$#" -eq 2 ]]; then
    type="$1"
    target="$2"
  else
    echo "Expected syntax: kubectl_describe [type] {target}" >&2
    exit 1
  fi

  kubectl describe ${type} "${target}"
}
function kubectl_delete() {
  if [[ "$#" -eq 1 ]]; then
    type="pod"
    target="$1"
  elif [[ "$#" -eq 2 ]]; then
    type="$1"
    target="$2"
  else
    echo "Expected syntax: kubectl_delete [type] {target}" >&2
    exit 1
  fi

  kubectl delete ${type} "${target}"
}
function kubectl_switch() {
  kubectl config set-context --current --namespace=${1}
}
function kubectl_container_names() {
  json=$(kubectl get pod ${1} -o json)
  containers=$(echo ${json} | jq '.spec.containers[].name')
  initContainers=$(echo ${json} | jq '.spec.initContainers[].name')
  echo "Containers:"
  for container in ${containers[@]}; do
    echo "${container}"
  done
  echo "InitContainers:"
  for init in ${initContainers[@]}; do
    echo "${init}"
  done
}
function kubectl_debug() {
  kubectl exec -it ${1} -- /bin/bash
}
function kubectl_run() {
  kubectl run -it jro-debug --image="${1}" --restart=Never -- /bin/bash
}

alias kls='kubectl_get'
alias kpods='kubectl_get'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klft='kubectl logs -f --tail 100'
alias klp='kubectl logs --previous'
alias krm='kubectl_delete'
alias kdsc='kubectl describe'
alias kswitch='kubectl_switch'
alias ksw='kubectl_switch'
alias kwatch='watch kubectl get pods'
alias kwatch='watch '
alias kcnames='kubectl_container_names'
alias kdebug='kubectl_debug'
alias kbug='kubectl_debug'
alias krun='kubectl_run'

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
