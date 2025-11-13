# Image de base Alpine
ARG VARIANT=latest
# FROM docker.io/library/alpine:${VARIANT}
FROM public.ecr.aws/docker/library/alpine:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG LOCALE=fr-CA

ENV LANG=${LOCALE}.UTF-8

COPY dotfiles/.* /etc/skel/
RUN apk update && apk upgrade && \
    apk add --no-cache \
    age age-doc \
    apk-tools-doc \
    fish fish-doc \
    zsh zsh-doc zsh-completions \
    bat bat-doc bat-fish-completion bat-zsh-completion \
    bottom bottom-doc bottom-fish-completion bottom-zsh-completion \
    curl curl-doc curl-fish-completion curl-zsh-completion \
    direnv direnv-doc \
    eza eza-doc eza-fish-completion eza-zsh-completion \
    fd fd-doc fd-fish-completion fd-zsh-completion \
    gcompat \
    gdu gdu-doc \
    git git-doc git-zsh-completion git-credential-oauth git-credential-oauth-doc \
    github-cli github-cli-doc github-cli-fish-completion github-cli-zsh-completion \
    gpg gpg-agent \
    htop htop-doc btop \
    jq jq-doc \
    man-db man-db-doc man-db-lang \
    man-pages \
    micro micro-doc \
    musl-locales \
    nano nano-doc \
    openssh-client-common \
    openssh-keygen \
    sudo \
    shadow \
    starship starship-zsh-plugin \
    tree tree-doc \
    unzip unzip-doc \
    vim vim-doc vimdiff \
    wget wget-doc \
    wipe wipe-doc \
    yq-go yq-go-fish-completion yq-go-zsh-completion \
    zip zip-doc

RUN \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd && \
    sed -ri 's/^(root:)(.*)\/bin\/ash/\1\2\/bin\/zsh/' /etc/passwd && \
    mkdir -p /root/.local && \
    cp /etc/skel/.z* /root/ && \
    mkdir /etc/skel/.config && \
    mkdir /etc/skel/.local

ENTRYPOINT [ "" ]
CMD [ "/bin/zsh" ]
