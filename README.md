# Images de conteneur Linux

Ce dépôt définit des images de conteneur Linux. Seules les images basées sur Alpine sont maintenues.

## Base

Image de base pour d'autre conteneurs. Ces images ont l'utilisateur par défaut `root`.

## Ops

Image pour les opérations d'infrastructure (DevOps, ingénierie de plateforme). Elle définit un utilisateur `ops` (modifiable par l'argument `USER`), sous lequel le conteneur s'exécute.

L'utilisateur `ops` détient les privilèges `sudo`.

## Authentification à Github Container Registry (ghcr.io)

D'abord créer un jeton d'accès (Personal Access Token) dans GitHub, et l'exporter dans un variable d'environnement. Par exemple:

```shell
# ~/.config/fish/conf.d/github_pat
set -gx GITHUB_TOKEN ghp_.....
```

Ensuite, pour s'authentifier:

```shell
echo $GITHUB_TOKEN | podman login ghcr.io -u <User> --password-stdin
```

Ou lancer la commande:

```shell
task ghcr:login
```
