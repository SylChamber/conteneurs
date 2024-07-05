# Image de développement Alpine

> Image non maintenue

Cette image est basée sur [l'image de base Alpine](../../base/alpine/README.md). Elle définit un utilisateur `user` (modifiable par l'argument `USER`), sous lequel le conteneur s'exécute.

L'utilisateur `user` détient les privilèges `sudo`.

Pour générer l'image Alpine, lancer:

```shell
make build
```

Pour publier l'image sur [quay.io/user/sylchambr/](https://quay.io/user/sylchambr/), lancer:

```shell
make push
```
