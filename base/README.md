# Image de base

Image de base Fedora contenant le shell `fish`, les `man-pages`, le prompt [Starship](https://starship.rs) pour shell ainsi que des outils console fréquents:

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

L'image inclut `podman` en mode `podman from podman`. On doit lancer `podman` en fournissant le _device_ `/dev/fuse`:

```shell
podman run --device /dev/fuse --rm -it ghcr.io/sylchamber/base
```

Cet usage est toutefois prévu pour une image dérivée qui définirait un utilisateur non root.
