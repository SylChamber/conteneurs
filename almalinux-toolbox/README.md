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
* `mdBook` du projet Rust Lang, un outil de production documentation à partir de fichiers MarkDown

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
