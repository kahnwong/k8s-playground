# k8s-playground

## TODO

- [ ] scaling alerts
- [ ] GitOps
- [ ] CI/CD
- [ ] secrets

## Pre-requisites

```bash
brew install --cask lens # for GUI dashboard
```

## Setup

```bash
# install
curl -sfL https://get.k3s.io | sh -

# export kubeconfig
kubectl config view --raw # copy this to ~/.kube/config on your local machine
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

### Waypoint

```bash
helm repo add hashicorp https://helm.releases.hashicorp.com
helm upgrade --install waypoint hashicorp/waypoint
waypoint login -from-kubernetes
```

### Terraform

```bash
terraform init
terraform apply
```

## Useful commands

```bash
kubectl expose deployment vault-agent-injector --type=NodePort --port=8080
kubectl get services
kubectl describe services
kubectl get pods
kubectl get all --all-namespaces
```

## Resources

- <https://artifacthub.io>
- <https://rancher.com/docs/k3s/latest/en/installation/install-options/>

### Terraform

- <https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider?in=terraform/kubernetes>
- <https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started>
