#!/usr/bin/env bash

minishift profile set tally
minishift config set disk-size 20GB
minishift config set memory 4GB
minishift config set cpus 4
minishift config set vm-driver virtualbox
minishift config set iso-url centos

minishift profile set tally-docker
minishift config set disk-size 80GB
minishift config set memory 20GB
minishift config set cpus 8
minishift config set vm-driver virtualbox
minishift config set iso-url centos