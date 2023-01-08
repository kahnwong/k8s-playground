# dashboard

## Grafana

```bash
kubectl create namespace kube-prometheus-stack

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kube-prometheus bitnami/kube-prometheus --namespace kube-prometheus-stack

# or with grafana: -> admin:prom-operator !!!!! Crash loop-back on darwin !!!!!
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace kube-prometheus-stack
```
