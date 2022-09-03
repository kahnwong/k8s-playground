# Waypoint

- Doesn't work with k3s because port 80 and 443 are in use by default via traefik, need to disable it during k3s install
- Also wonky with kind
- Need to setup k8s via Docker Desktop, unless you use cloud-managed k8s, since waypoint runner needs to be able to reach docker registry

## Setup

```bash
# cli (required)
brew tap hashicorp/tap
brew install hashicorp/tap/waypoint

# k8s
helm repo add hashicorp https://helm.releases.hashicorp.com
helm upgrade --install waypoint hashicorp/waypoint
waypoint login -from-kubernetes

# docker
waypoint install --platform=docker -accept-tos
```

- Access via <https://localhost:9702>
- Add labels `k8s-app=metrics-server` in `kube-prometheus-kube-state-metrics` pod for autoscaling

<!-- ### Need this for autoscaling

Need to add `--kubelet-insecure-tls` args on local k8s

```bash
# or install via helm chart in Lens
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# add / update following parameters: https://github.com/kubernetes-sigs/metrics-server/issues/812
args: --kubelet-insecure-tls
initialDelaySeconds: 300
periodSeconds: 30

kubectl get deployment metrics-server -n kube-system
# kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
``` -->

## Usage

- <https://developer.hashicorp.com/waypoint/tutorials/get-started-kubernetes/get-started-kubernetes>
- <https://github.com/hashicorp/waypoint-examples/tree/main/kubernetes/nodejs-apply>

```bash
waypoint init
waypoint up -prune-retain=0

# cleanup
waypoint destroy
```

## References

- <https://sourcegraph.com/github.com/cardstack/cardstack/-/blob/waypoint.hcl>
