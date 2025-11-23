# Expérimentation podman-in-podman

Cette image est une expérimentation de _podman-in-podman_ dans une image Alpine, tel que décrite par Red Hat sur:

* [How to use Podman inside of a container - Red Hat Blog](https://www.redhat.com/en/blog/podman-inside-container)
* [containers/image_build/podman](https://github.com/containers/image_build/tree/main/podman) - code source de l'article

> Le miroir AWS de la Docker Hub Library est utilisé pour éviter les restrictions d'utilisation de Docker Hub, soit l'image `public.ecr.aws/docker/library/alpine`.

Le constat est le suivant: **sous Alpine, je n'ai pas trouvé de moyen pour rouler podman à l'intérieur d'un conteneur podman _rootless_**. L'allocation de `uid` ne fonctionne pas.

La solution est:

* d'exposer au conteneur le _socket_ de podman de l'hôte
* de conserver l'`ID` de l'utilisateur dans l'hôte (`--userns=keep-id`)
* d'utiliser `podman-remote` ou `podman --remote`

Par exemple:

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

L'image inclut des outils moderne pour une utilisation de base du shell, de même que le shell `fish` et une configuration de base de profil `fish`.

`podman-compose` en est toutefois absent à cause de sa dépendance sur Python, qui est assez volumineux.
