# k8s-playground

## Install

### [k3s](https://k3s.io/)

```bash
# https://rancher.com/docs/k3s/latest/en/installation/install-options/
curl -sfL https://get.k3s.io | sh -
# mkdir ~/.kube
# cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
```

### [microk8s](https://microk8s.io/)

```bash
sudo snap install microk8s --classic
# microk8s enable dashboard dns registry istio
```

## Access cluster

```bash
brew install --cask lens

kubectl config view --raw > ~/.kube/config # or microk8s config > ~/.kube/config
```

## Deploy

```bash
brew install helm kubectl

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm upgrade --install metrics-server metrics-server/metrics-server
```

### Setup Waypoint

```bash
helm repo add hashicorp https://helm.releases.hashicorp.com
helm upgrade --install waypoint hashicorp/waypoint
waypoint login -from-kubernetes
```

### Interesting charts

```bash
# admin:prom-operator
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install grafana prometheus-community/kube-prometheus-stack

helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault
```

## Resources

- <https://artifacthub.io>

## Access services

```bash
# kubectl expose deployment vault-agent-injector --type=NodePort --port=8080
kubectl get services
kubectl describe services
kubectl get pods
kubectl get all --all-namespaces
```
