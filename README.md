# k8s-playground

## TODO

- [ ] scaling alerts
- [ ] GitOps?
- [x] CI/CD: <https://developer.hashicorp.com/waypoint/docs/automating-execution/github-actions>
  - Check branch name, so it's possible to target different app deployment with different config for dev/prod
  - also target different waypoint server (per each k8s cluster)
  - and set up variables per each env to fetch the right config
- [x] secrets: <https://developer.hashicorp.com/waypoint/docs/kubernetes/config>
- [x] logging: <https://cloud.google.com/stackdriver/docs/solutions/gke/installing>
- [ ] cost breakdown

## Pre-requisites

```bash
brew install helm kubectl
brew install --cask lens # for GUI dashboard
```

## Setup

### k3s

```bash
curl -sfL https://get.k3s.io | sh -

# export kubeconfig
kubectl config view --raw # copy this to ~/.kube/config on your local machine
```

### kind

```bash
brew install kind
kind create cluster
# kind delete cluster

# export kubeconfig
kind get kubeconfig # copy this to ~/.kube/config on your local machine
```

### Docker desktop

Enable kubernetes via the UI

## Setup monitoring

<!-- Need to add `--kubelet-insecure-tls` args on local k8s

### metrics-server

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

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kube-prometheus bitnami/kube-prometheus

# or with grafana: -> admin:prom-operator !!!!! Crash loop-back on darwin !!!!!
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack
```

## Interesting charts

```bash
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault
```

## Useful commands

```bash
kubectl expose deployment vault-agent-injector --type=NodePort --port=8080
kubectl get services
kubectl describe services
kubectl get pods
kubectl get all --all-namespaces

kubectl config --kubeconfig ~/.kube/mac.config get-contexts
kubectl config --kubeconfig ~/.kube/mac.config use-context kind-kind
```

## Resources

- <https://artifacthub.io>
- <https://rancher.com/docs/k3s/latest/en/installation/install-options/>

### Terraform

- <https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider?in=terraform/kubernetes>
- <https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started>

### Deployment

- <https://codefresh.io/blog/kubernetes-antipatterns-1/>
- <https://github.com/hashicorp/terraform-guides/tree/master/operations/automation-script>
