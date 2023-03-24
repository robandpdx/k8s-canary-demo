# k8s-canary-demo

This repo is a step my step demo of [canary release on k8s using linkerd and flagger](https://linkerd.io/2.12/tasks/canary-release/).  

## Prerequisutes
1. A k8s cluster
You can use any k8s cluster for this demo. I prefer to use a [kind cluster](https://kind.sigs.k8s.io/docs/user/quick-start/) locally.  
```
kind create cluster --config kind-config.yml
```
2. [linkerd cli](https://linkerd.io/2.12/getting-started/#step-1-install-the-cli)

## Setup
1. Run the `install.sh` script to [install the prerequisites](https://linkerd.io/2.12/tasks/canary-release/#prerequisites) in k8s, and [setup the demo](https://linkerd.io/2.12/tasks/canary-release/#set-up-the-demo) in k8s.
2. Verify that everything has started up successfully by running:
```
kubectl -n test rollout status deploy podinfo
```
3. Run the following command, then point your web browser to http://localhost:8080
```
kubectl -n test port-forward svc/frontend 8080
```
4. Configure the release by running:
```
kubectl apply -f podinfo-canary.yml
```
To configure a canary release that will fail and rollback, use:
```
kubectl apply -f podinfo-canary-fail.yml
```
## Demo
Continue to follow this document...  s
https://linkerd.io/2.12/tasks/canary-release/#start-the-rollout

To use a more recent version of podinfo, run the following command for rollout...
```
kubectl -n test set image deployment/podinfo \
podinfod=ghcr.io/stefanprodan/podinfo:6.0.1
```

## Notes
Other version of podinfo to use are `6.0.1`, `6.0.2`, `6.0.3`, `6.0.4`, `6.1.0`, `6.1.1`, `6.1.2`, `6.1.3`, `6.1.4`, `6.1.5`, `6.1.6`.  