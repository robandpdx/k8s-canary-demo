#!/bin/bash

# https://linkerd.io/2.12/tasks/canary-release/
# Prerequisites
# Linkerd and Linkerd-Viz.
linkerd install --crds | kubectl apply -f -
linkerd install | kubectl apply -f -
linkerd viz install | kubectl apply -f -
# Linkerd-SMI.
linkerd smi install | kubectl apply -f -

# Flagger.
kubectl apply -k github.com/fluxcd/flagger//kustomize/linkerd

# Setup the demo.
# https://linkerd.io/2.12/tasks/canary-release/#set-up-the-demo
kubectl create ns test
kubectl apply -f https://run.linkerd.io/flagger.yml

# Follow the instructions in the README.md
