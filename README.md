# k8s-playground

## TODO

- [ ] scaling alerts
- [x] GitOps? -> Argo CD UI is pretty horrid...
- [x] CI/CD: <https://github.com/GoogleCloudPlatform/microservices-demo/actions/runs/1114294209/workflow>
- [x] secrets: <https://cloud.google.com/secret-manager/docs/using-other-products#google-kubernetes-engine>
- [x] logging: <https://cloud.google.com/stackdriver/docs/solutions/gke/installing>
- [ ] cost breakdown

## Pre-requisites

```bash
brew install helm kubectl
brew install --cask openlens # for GUI dashboard
```

## Setup

### k3s

```bash
# curl -sfL https://get.k3s.io | sh -
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable traefik" sh # so it frees up port 80 and 443

# export kubeconfig
k3s kubectl config view --raw # copy this to ~/.kube/config on your local machine

# uninstall
/usr/local/bin/k3s-uninstall.sh
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

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
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
