#!/usr/bin/env bash

[[ ${DEBUG_BASHRC} -eq 1 ]] && echo "rosenberg.kubernetes.sh" && echo
DEBUG_IMAGE="${DEBUG_IMAGE:-busybox}"

# Openshift uses `oc`, use `kc` for kubectl
alias kc='kubectl'
alias ctx='kubectx'
alias kctx='kubectx'
alias kns='kubens'
alias dd='kubectx docker-desktop'
complete -F __start_kubectl kc # Enable Bash completion for `kc`
complete -F __start_kubectl klf # Enable Bash completion for `klf`
complete -F __start_kubectl kls # Enable Bash completion for `kls`

source "${BREW}/opt/kube-ps1/share/kube-ps1.sh"
# echo "Pre kubernetes PS1: $PS1" # DEBUG
export PS1_STATUS=' $(kube_ps1)'"${PS1_STATUS}"
# echo "Post kubernetes PS1: $PS1" # DEBUG
export PATH="${PATH}:${HOME}/.krew/bin"

########################################
# Kubernetes functions
########################################

# Since kubectl requires a resource type to be passed in,
# accept a resource type as an argument but default to "pods"
function kubectl_get() {
  kubectl get ${1:-pods}
}
function kubectl_get_for_instance() {
  if [[ "$#" -lt 2 ]]; then
    type="pods"
    instance="$1"
  else
    type="$1"
    instance="$2"
  fi
  kubectl get ${type} -l app.kubernetes.io/instance="${instance}" --field-selector=status.phase!=Evicted
}
function kubectl_describe() {
  if [[ "$#" -lt 2 ]]; then
    type="pods"
    target="$1"
  else
    type="$1"
    target="$2"
  fi

  kubectl describe ${type} "${target}"
}
function kubectl_watch() {
  if [[ "$#" -lt 1 ]]; then
    type="pods"
  else
    type="$1"
  fi
  watch kubectl get ${type}
}
function kubectl_watch_for_instance() {
  if [[ "$#" -lt 2 ]]; then
    type="pods"
    instance="$1"
  else
    type="$1"
    instance="$2"
  fi
  watch kubectl get ${type} -l app.kubernetes.io/instance="${instance}" --field-selector=status.phase!=Evicted
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
  kubectl exec -it jro-debug "${1:-$DEBUG_IMAGE}" -- /bin/bash
}
function kubectl_run() {
  kubectl run -it jro-debug --image="${1}" --restart=Never -- /bin/bash
}
function kubectl_secret() {
  kubectl get secret "$1" -o json | jq '.data | map_values(@base64d)'
}
function kubectl_clear_evicted() {
  kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
}

alias krew='kubectl krew'
alias kls='kubectl_get'
alias klsfor='kubectl_get_for_instance'
alias kpods='kubectl_get'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klft='kubectl logs -f --tail 100'
alias klp='kubectl logs --previous'
alias kdsc='kubectl_describe'
alias kwatch='kubectl_watch'
alias kwatchfor='kubectl_watch_for_instance'
alias kcnames='kubectl_container_names'
alias kdebug='kubectl_debug'
alias kbug='kubectl_debug'
alias krun='kubectl_run'
alias ksecret='kubectl_secret'
alias kclear='kubectl_clear_evicted'
