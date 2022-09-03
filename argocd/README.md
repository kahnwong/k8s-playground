# argocd

## Setup

```bash
kubectl create namespace argocd # need to use this namespace it's its baked into the manifests
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo # username: admin

# install CLI
brew install argocd
```

```bash
# kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
# argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default

git clone git@github.com:gboie/argocd-node-app-config.git
cd argocd-node-app-config
kubectl apply -f application.yaml
```
