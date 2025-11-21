# Image Alpine pour les opérations, DevOps, l'infrastructure en tant que code (IaC) et l'ingénierie de plateforme

Cette image est basée sur [l'image de base Alpine](../../base/alpine/README.md). Elle contient des outils courants pour l'infrastructure en tant que code (IaC), tels que:

* `terraform`
* `opentofu`
* le langage `python` et `pipx`
* `podman` et `podman-remote`
* `kubectl`
* `trivy`
* `go-task`

Elle définit un utilisateur `ops` (modifiable par l'argument `USER`), sous lequel le conteneur s'exécute.

L'utilisateur `ops` détient les privilèges `sudo`.

## Génération de l'image

Pour générer l'image Alpine, lancer:

```shell
TERRAFORM_VERSION=$(curl -sL https://api.github.com/repos/hashicorp/terraform/releases/latest |
  jq -r '.tag_name' | sed -r 's/v(.*)/\1/')
TOFU_VERSION=$(curl -sL https://api.github.com/repos/opentofu/opentofu/releases/latest |
  jq -r '.tag_name' | sed -r 's/v(.*)/\1/')
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
podman build -t sylchamber/ops \
  -t sylchamber/ops:alpine \
  -t sylchamber/ops:latest \
  -t ghcr.io/sylchamber/ops:alpine \
  -t ghcr.io/sylchamber/ops:latest \
  --build-arg USER=ops \
  --build-arg KUBECTL_VERSION=$KUBECTL_VERSION \
  --build-arg PACKER_VERSION=$PACKER_VERSION \
  --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION \
  --build-arg TOFU_VERSION=$TOFU_VERSION .
```

## Utilisation

Créer un volume de données à la création du conteneur (les bons droits seront accordés selon le point de montage).

```shell
# podman
podman run --name mon-conteneur -it --userns=keep-id \
  -v home:/home/ops \
  -v $(realpath ~/.ssh):/home/ops/.ssh \
  ghcr.io/sylchamber/ops

# docker
docker run --name mon-conteneur -it \
  -v home:/home/ops \
  -v $(realpath ~/.ssh):/home/user/.ssh \
  ghcr.io/sylchamber/ops
```

Par la suite, lancer le conteneur comme suit:

> Omettre `-ai` si on veut uniquement utiliser le conteneur dans VS Code.

```shell
podman start -ai mon-conteneur
```

## Utilisation de podman

L'image inclut `podman` en mode `podman from podman`, où on doit fournir en volume un socket podman de l'hôte:

> Il a été impossible de préparer une image Alpine permettant l'utilisation de `podman in podman` comme la technique de l'image `quay.io/podman/stable` basée sur Fedora. L'allocation de `uid` ne fonctionne pas.

```shell
# sur l'hôte
sudo loginctl enable-linger $USER
systemctl --user enable podman podman.socket
systemctl --user start podman.socket
podman run ... \
  --userns=keep-id \
  -v $XDG_RUNTIME_DIR/podman/podman.sock:/tmp/storage-run-1000/podman/podman.sock \
  ...
```

Dans un conteneur, il suffit d'utiliser `podman` avec l'option `--remote` ou de substituer `podman` avec `podman-remote`:

```shell
# dans le conteneur
podman --remote ps
podman-remote ps
```
