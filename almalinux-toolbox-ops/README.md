# Image toolbox pour les opérations, DevOps, l'infrastructure en tant que code (IaC) et l'ingénierie de plateforme

Cette image est basée sur [l'image toolbox de base AlmaLinux](../almalinux-toolbox/README.md). Elle contient des outils courants pour l'infrastructure en tant que code (IaC), tels que:

* `terraform`
* `opentofu`
* le langage `python` et `pipx`
* le langage `go`
* `kubectl`
* `oc` (versions 4.18 et 4.20)
* `trivy`

## Construction et publication

Pour construire l'image, lancer:

```shell
task build:almalinux-toolbox-ops
```

et pour publier sur `ghcr.io` et `quay.io`, lancer:

```shell
task push:almalinux-toolbox-ops
```
