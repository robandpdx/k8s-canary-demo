# k8s-canary-demo

This repo is a step my step demo of [canary release on k8s using linkerd and flagger](https://linkerd.io/2.12/tasks/canary-release/).  

You can use any k8s cluster for this demo. I prefer to use a [kind cluster](https://kind.sigs.k8s.io/docs/user/quick-start/) locally.  

1. Run the `install.sh` script to [install the prerequisites](https://linkerd.io/2.12/tasks/canary-release/#prerequisites), and [setup the demo](https://linkerd.io/2.12/tasks/canary-release/#set-up-the-demo).
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
5. Continue to follow this document...
https://linkerd.io/2.12/tasks/canary-release/#start-the-rollout

## Notes
Other version of podinfo to use are `6.0.1`, `6.0.2`, `6.0.3`, `6.0.4`, `6.1.0`, `6.1.1`, `6.1.2`, `6.1.3`, `6.1.4`, `6.1.5`, `6.1.6`.  