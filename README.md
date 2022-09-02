# k8s-playground

## TODO

- [ ] scaling alerts
- [ ] GitOps?
- [x] CI/CD: use waypoint instead
  - Check branch name, so it's possible to target different app deployment with different config for dev/prod
  - also target different waypoint server (per each k8s cluster)
- [ ] secrets
- [x] logging: https://cloud.google.com/stackdriver/docs/solutions/gke/installing
- [ ] cost breakdown

## Pre-requisites

```bash
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

## Deployment

### Helm

```bash
brew install helm kubectl

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm upgrade --install metrics-server metrics-server/metrics-server
```

#### Interesting charts

```bash
# admin:prom-operator
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install grafana prometheus-community/kube-prometheus-stack

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
