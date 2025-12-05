# Images de conteneur Linux

Ce dépôt définit des images de conteneur Linux.

## almalinux-toolbox

Image de base pour utilisation avec la CLI `toolbox` (_toolbx_). Voir les [détails de l'image almalinux-toolbox](almalinux-toolbox/README.md).

## almalinux-toolbox-ops

Image toolbox pour les opérations d'infrastructure (DevOps, ingénierie de plateforme). Voir les [détails de l'image almalinux-toolbox-ops](almalinux-toolbox-ops/README.md).

## Authentification aux registres d'images GHCR et Quay

D'abord créer un jeton d'accès (Personal Access Token) dans GitHub ainsi qu'un mot de passe de CLI chiffré dans Quay.io, et les exporter dans des variables d'environnement. Par exemple:

```shell
# ~/.config/fish/conf.d/env-github-token
set -gx GITHUB_TOKEN ghp_.....

# ~/.config/fish/conf.d/env-quay-cli-password.fish
set -gx QUAY_CLI_PASSWORD 3lkjsdf8...
```

Ensuite, pour s'authentifier:

```shell
echo $GITHUB_TOKEN | podman login ghcr.io -u <User> --password-stdin
```

Ou lancer la commande:

```shell
# authentification à ghcr.io
task auth:ghcr

# authentification à quay.io
task auth:quay
```

## Utilisation de podman

Une toolbox n'est pas un conteneur comme les autres. Avec toolbox, le conteneur est intégré à l'environnement utilisateur. On peut lancer des commandes dans l'OS hôte à l'aide de `flatpak-spawn --host`:

```shell
flatpak-spawn --host podman ps
```

## Références

* [toolbx - Documentation](https://containertoolbx.org/doc/)
* [Toolbx - Fedora Documentation](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/)
* [1player/host-spawn](https://github.com/1player/host-spawn)
* [toolbx-images - Community maintained container images to use with toolbx and distrobox](https://github.com/toolbx-images/images)
