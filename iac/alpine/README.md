# Image Alpine pour l'infrastructure en tant que code (IaC)

Cette image est basée sur [l'image de base Alpine](../../base/alpine/README.md). Elle contient des outils courants pour l'infrastructure en tant que code (IaC), tels que:

* la CLI `aws`
* `terraform`
* `opentofu`
* `packer`
* le langage `python`

Elle définit un utilisateur `user` (modifiable par l'argument `USER`), sous lequel le conteneur s'exécute.

L'utilisateur `user` détient les privilèges `sudo`.

Pour générer l'image Alpine, lancer:

```shell
PACKER_VERSION=$(curl -sL https://api.github.com/repos/hashicorp/packer/releases/latest |
  jq -r '.tag_name' | sed -r 's/v(.*)/\1/')
TERRAFORM_VERSION=$(curl -sL https://api.github.com/repos/hashicorp/terraform/releases/latest |
  jq -r '.tag_name' | sed -r 's/v(.*)/\1/')
TOFU_VERSION=$(curl -sL https://api.github.com/repos/opentofu/opentofu/releases/latest |
  jq -r '.tag_name' | sed -r 's/v(.*)/\1/')
podman build -t sylchamber/iac \
  -t sylchamber/iac:alpine:latest \
  -t quay.io/sylchambr/iac:alpine \
  -t quay.io/sylchambr/iac:latest \
  --build-arg USER=user \
  --build-arg PACKER_VERSION=$PACKER_VERSION \
  --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION \
  --build-arg TOFU_VERSION=$TOFU_VERSION .
```

## Utilisation

Créer un volume de données à la création du conteneur (les bons droits seront accordés selon le point de montage).

```shell
# podman
podman run --name mon-conteneur -it --userns=keep-id \
  -v home:/home/user \
  -v $(realpath ~/.aws):/home/user/.aws \
  -v $(realpath ~/.ssh):/home/user/.ssh \
  quay.io/sylchambr/iac

# docker
docker run --name mon-conteneur -it \
  -v home:/home/user \
  -v $(realpath ~/.aws):/home/user/.aws \
  -v $(realpath ~/.ssh):/home/user/.ssh \
  quay.io/sylchambr/iac
```

Par la suite, lancer le conteneur comme suit:

```shell
podman start -ai mon-conteneur
```
