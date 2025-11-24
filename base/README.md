# Image de base

Image de base Alpine contenant le shell `fish`, les `man-pages`, le prompt [Starship](https://starship.rs) pour shell ainsi que des outils console fréquents:

* `curl`, `wget` et `xh`
* `git`, `git-credential-oauth` et la cli GitHub `gh`
* `nano`, `micro` et `vim`
* `sudo`
* `tealdeer` (`tldr`)
* `htop`, `btop`, `btm` (bottom) et `fastfetch`
* `podman` en mode _(rootless) podman in (rootless) podman_
* `jq` et `yq`
* `zip` et `unzip`
* versions colorées des outils fréquents: `bat` (`cat`), `lsd`, `dust` et `gdu` (`du`), `fd` (`find`), `rg` (ripgrep)

Elle inclut également une configuration par défaut de `fish` pour les utilisateurs sous `/etc/fish`.

> Le miroir AWS de la Docker Hub Library est utilisé pour éviter les restrictions d'utilisation de Docker Hub, soit l'image `public.ecr.aws/docker/library/alpine`.

## Construction et publication

Pour construire l'image, lancer:

```shell
task build:base
```

et pour publier sur `ghcr.io`, lancer:

```shell
task push:base
```

## Utilisation d'un volume

Plutôt que d'écrire des fichiers de profil dans l'image elle-même, envisager d'utiliser un volume de données monté comme `/home`. Dans quel cas, créer au préalable le volume et y importer les fichiers:

```shell
podman volume create home
tar -cf - -C ./dotfiles . | podman volume import home -

```

Ou encore, créer le volume à la création du conteneur, d'autant plus que les bons droits seront accordés selon le point de montage.

```shell
podman run --name mon-conteneur -it -v home:/home/user \
  -v $(realpath ~/.aws):/home/user/.aws -v $(realpath ~/.ssh):/home/user/.ssh \
  ghcr.io/sylchamber/base
```

## Utilisation de podman

L'image inclut `podman` en mode _remote_ à partir de l'hôte:

* on expose au conteneur le _socket_ de podman de l'hôte
* on conserve l'`ID` de l'utilisateur dans l'hôte (`--userns=keep-id`)
* on utilise `podman-remote` ou `podman --remote`

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

Cet usage est toutefois **prévu pour une image dérivée qui définirait un utilisateur non root**.

## Podman-from-podman

Il n'a pas été possible de configurer pour un conteneur Alpine l'utilisation de podman-from-podman selon les instructions référencées ci-dessous (pour Fedora). L'allocation de `uid` ne fonctionne pas.

* [How to use Podman inside of a container - Red Hat Blog](https://www.redhat.com/en/blog/podman-inside-container)
  * [containers/image_build/podman](https://github.com/containers/image_build/tree/main/podman) - code source de l'article
