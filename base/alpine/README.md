# Image de base Alpine

Image de base Alpine contenant le shell `zsh`, les `man-pages`, le prompt [Starship](https://starship.rs) pour shell ainsi que des outils console fréquents:

* `curl`
* `git`
* `nano` (tout le monde n'aime pas nécessairement `vi`!)
* `sudo`
* `jq`
* `yq`

Elle inclut également une configuration par défaut de `zsh` pour les utilisateurs sous `/etc/skel`.

Pour générer l'image Alpine, lancer:

```shell
make build
```

Pour publier l'image sur [quay.io/user/sylchambr/](https://quay.io/user/sylchambr/), lancer:

```shell
make push
```
