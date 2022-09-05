# skaffold

<https://skaffold.dev/docs/quickstart/>

## Setup

```bash
brew install skaffold
```

## Demo

```bash
git clone --depth 1 https://github.com/GoogleContainerTools/skaffold
cd skaffold/examples/getting-started

skaffold dev
skaffold run
skaffold delete
```

## Useful snippets

### Deploying to a remote cluster

When deploying to a remote cluster you have to point Skaffold to your default image repository in one of the four ways:

* flag: `skaffold dev --default-repo <myrepo>`
* env var: `SKAFFOLD_DEFAULT_REPO=<myrepo> skaffold dev`
* global skaffold config (one time): `skaffold config set --global default-repo <myrepo>`
* skaffold config for current kubectl context: `skaffold config set default-repo <myrepo>`


## Resources

- <https://skaffold.dev/docs/workflows/getting-started-with-your-project/>
