# Waypoint

## Setup

Doesn't work with k3s because port 80 and 443 are in use by default via traefik, need to disable it during k3s install

Also wonky with kind

Need to setup k8s via Docker Desktop

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

Access via <https://localhost:9702>

## Usage

- <https://developer.hashicorp.com/waypoint/tutorials/get-started-kubernetes/get-started-kubernetes>
- <https://github.com/hashicorp/waypoint-examples/tree/main/kubernetes/nodejs-apply>

```bash
waypoint init
waypoint up -prune-retain=0 # -a kubernetes-nodejs-web

# cleanup
waypoint destroy
```

## References

- <https://sourcegraph.com/github.com/cardstack/cardstack/-/blob/waypoint.hcl>
