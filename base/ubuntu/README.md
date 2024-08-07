# Image de base Ubuntu

> Image non maintenue

Image de base Ubuntu contenant le shell `zsh`, les `man-pages`, le prompt [Starship](https://starship.rs) pour shell ainsi que des outils console fréquents:

* `curl` et `wget`
* `git` et la cli GitHub
* `nano`, `micro` et `vim`
* `sudo`
* `jq` et `yq`
* `realpath`
* `lsof`
* `direnv`

Elle inclut également une configuration par défaut de `zsh` pour les utilisateurs sous `/etc/skel`.

Pour générer l'image Ubuntu, lancer:

```shell
make build
```

Pour publier l'image sur [quay.io/user/sylchambr/](https://quay.io/user/sylchambr/), lancer:

```shell
make push
```

## Utilisation d'un volume

Plutôt que d'écrire des fichiers de profil dans l'image elle-même, envisager d'utiliser un volume de données monté comme `/home`. Dans quel cas, créer au préalable le volume et y importer les fichiers:

```shell
podman volume create home
tar -cf - -C ./dotfiles . | podman volume import home -

```

Ou encore, créer le volume à la création du conteneur, d'autant plus que les bons droits seront accordés selon le point de montage.

```shell
podman run --name mon-conteneur -it --userns=keep-id -v home:/home/user \
  -v $(realpath ~/.aws):/home/user/.aws -v $(realpath ~/.ssh):/home/user/.ssh \
  quay.io/sylchambr/base
```
