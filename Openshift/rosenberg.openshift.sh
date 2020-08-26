#!/bin/env bash

# Create a function that will easily start and configure minishift
function minishift_start() {
  minishift start
  eval $(minishift oc-env)
# eval $(minishift docker-env)
}
