# Image toolbox AlmaLinux de base

Image de base AlmaLinux contenant le shell `fish`, les `man-pages`, le prompt [Starship](https://starship.rs) pour shell ainsi que des outils console fréquents:

* `curl`, `wget` et `xh`
* `git`, `git-credential-oauth` et la cli GitHub `gh`
* `nano`, `micro` et `vim`
* `sudo`
* `tealdeer` (`tldr`)
* `htop`, `btop`, `btm` (bottom) et `fastfetch`
* `jq` et `yq`
* `zip` et `unzip`
* versions colorées des outils fréquents: `bat` (`cat`), `lsd`, `dust` et `gdu` (`du`), `fd` (`find`), `rg` (ripgrep)

Elle inclut également une configuration par défaut de `fish` pour les utilisateurs sous `/etc/fish`.

## Construction et publication

Pour construire l'image, lancer:

```shell
task build:almalinux-toolbox
```

et pour publier sur `ghcr.io` et `quay.io`, lancer:

```shell
task push:almalinux-toolbox
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
