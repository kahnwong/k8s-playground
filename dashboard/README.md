# dashboard

## kube-dashboard

<https://docs.k3s.io/installation/kube-dashboard>

### Install dashboard

```bash
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/recommended.yaml
```

### Create admin-user

```bash
kubectl create \
    -f ./dashboard/dashboard.admin-user.yml \
    -f ./dashboard/dashboard.admin-user-role.yml
```

### Get token

```bash
kubectl -n kubernetes-dashboard create token admin-user
```

### Access the dashboard

```bash
kubectl proxy
```

Access dashboard via <http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/>

## Grafana

```bash
kubectl create namespace kube-prometheus-stack

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install kube-prometheus bitnami/kube-prometheus --namespace kube-prometheus-stack

# or with grafana: -> admin:prom-operator !!!!! Crash loop-back on darwin !!!!!
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace kube-prometheus-stack
```
