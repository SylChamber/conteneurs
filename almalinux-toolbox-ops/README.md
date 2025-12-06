# Image toolbox pour les opérations, DevOps, l'infrastructure en tant que code (IaC) et l'ingénierie de plateforme

Cette image est basée sur [l'image toolbox de base AlmaLinux](../almalinux-toolbox/README.md). Elle contient des outils courants pour l'infrastructure en tant que code (IaC), tels que:

* `terraform`
* `opentofu`
* le langage `python` et `pipx`
* le langage `go`
* `kubectl` et les outils de l'écosystème Kubernetes
  * `oc` (versions 4.18 et 4.20)
  * `k9s` et `kdash`
  * `argocd`
  * `conftest` (pour OPA)
  * les CLI `etcd`
  * `helm` et `helm-docs`
  * `kompose`
  * `krew`
  * `kubecolor`
  * `kubesec`
  * `kustomize`
  * `operator-sdk`
  * `sops`
  * `tkn` (CLI Tekton―OpenShift Pipelines)
  * `trivy`

> TODO: envisager d'inclure la version désirée de Go d'après la technique de l'image [ubi10/go-toolset](https://catalog.redhat.com/en/software/containers/ubi10/go-toolset/677d3db01d4db033edfda594).

## Construction et publication

Pour construire l'image, lancer:

```shell
task build:almalinux-toolbox-ops
```

et pour publier sur `ghcr.io` et `quay.io`, lancer:

```shell
task push:almalinux-toolbox-ops
```
