# Image de base Alpine
ARG VARIANT=latest
# FROM docker.io/library/alpine:${VARIANT}
FROM public.ecr.aws/docker/library/alpine:${VARIANT}
LABEL org.opencontainers.image.description="Image de base"
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs
LABEL org.opencontainers.image.base.name=public.ecr.aws/docker/library/alpine:${VARIANT}

ARG LOCALE=fr-CA

ENV LANG=${LOCALE}.UTF-8

COPY dotfiles/.* /etc/skel/
RUN apk update && apk upgrade && \
    apk add --no-cache \
    age age-doc \
    apk-tools-doc \
    fish fish-doc \
    zsh zsh-doc zsh-completions \
    acl acl-doc \
    bat bat-doc bat-fish-completion bat-zsh-completion \
    bottom bottom-doc bottom-fish-completion bottom-zsh-completion \
    broot broot-doc broot-fish-completion broot-zsh-completion \
    btop btop-doc \
    curl curl-doc curl-fish-completion curl-zsh-completion \
    direnv direnv-doc \
    dust dust-doc dust-fish-completion dust-zsh-completion \
    dysk \
    eza eza-doc eza-fish-completion eza-zsh-completion \
    fastfetch fastfetch-doc fastfetch-fish-completion fastfetch-zsh-completion \
    fd fd-doc fd-fish-completion fd-zsh-completion \
    gcompat \
    gdu gdu-doc \
    git git-doc git-zsh-completion git-credential-oauth git-credential-oauth-doc \
    github-cli github-cli-doc github-cli-fish-completion github-cli-zsh-completion \
    gpg gpg-agent \
    htop htop-doc \
    hyperfine hyperfine-doc hyperfine-fish-completion hyperfine-zsh-completion \
    jq jq-doc \
    lsd lsd-fish-completion lsd-zsh-completion \
    man-db man-db-doc man-db-lang \
    man-pages \
    micro micro-doc \
    musl-locales \
    nano nano-doc \
    openssh-client-common \
    openssh-keygen \
    pinentry-curses-ss pinentry-doc \
    procs procs-doc procs-fish-completion \
    ripgrep ripgrep-doc ripgrep-fish-completion ripgrep-zsh-completion \
    sudo \
    shadow \
    starship starship-zsh-plugin \
    topgrade topgrade-doc topgrade-fish-completion topgrade-zsh-completion \
    tree tree-doc \
    unzip unzip-doc \
    vim vim-doc vimdiff \
    wget wget-doc \
    wipe wipe-doc \
    xh xh-doc xh-fish-completion xh-zsh-completion \
    yq-go yq-go-fish-completion yq-go-zsh-completion \
    zip zip-doc

RUN \
    cd /usr/local/bin && \
    curl https://zyedidia.github.io/eget.sh | sh && chown root:root /usr/local/bin/eget && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd && \
    sed -ri 's|^(root:)(.*)/bin/sh|\1\2/usr/bin/fish|' /etc/passwd && \
    mkdir -p /root/.local && \
    cp /etc/skel/.z* /root/ && \
    mkdir /etc/skel/.config && \
    mkdir /etc/skel/.local

ENTRYPOINT [ "" ]
CMD [ "/usr/bin/fish" ]
