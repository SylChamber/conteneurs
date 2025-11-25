# Images de conteneur Linux

Ce dépôt définit des images de conteneur Linux. Seules les images basées sur Alpine sont maintenues.

## Base

Image de base pour d'autre conteneurs. Ces images ont l'utilisateur par défaut `root`.

## Ops

Image pour les opérations d'infrastructure (DevOps, ingénierie de plateforme). Elle définit un utilisateur `ops` (modifiable par l'argument `USER`), sous lequel le conteneur s'exécute.

L'utilisateur `ops` détient les privilèges `sudo`.

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
