# Image de base Alpine
ARG VARIANT=latest
# FROM docker.io/library/alpine:${VARIANT}
FROM public.ecr.aws/docker/library/alpine:${VARIANT}
LABEL org.opencontainers.image.description="Image de base"
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs
LABEL org.opencontainers.image.base.name=public.ecr.aws/docker/library/alpine:${VARIANT}

ARG LOCALE=fr-CA

ENV LANG=${LOCALE}.UTF-8

RUN apk update && apk upgrade && \
    apk add --no-cache \
    age age-doc \
    apk-tools-doc \
    fish fish-doc \
    acl acl-doc \
    bat bat-doc bat-fish-completion \
    bottom bottom-doc bottom-fish-completion \
    broot broot-doc broot-fish-completion \
    btop btop-doc \
    chezmoi chezmoi-fish-completion \
    curl curl-doc curl-fish-completion \
    direnv direnv-doc \
    dust dust-doc dust-fish-completion \
    dysk \
    eza eza-doc eza-fish-completion \
    fastfetch fastfetch-doc fastfetch-fish-completion \
    fd fd-doc fd-fish-completion \
    gcompat \
    gdu gdu-doc \
    git git-doc git-credential-oauth git-credential-oauth-doc \
    github-cli github-cli-doc github-cli-fish-completion \
    gpg gpg-agent \
    htop htop-doc \
    hyperfine hyperfine-doc hyperfine-fish-completion \
    jq jq-doc \
    lsd lsd-fish-completion \
    man-db man-db-doc man-db-lang \
    man-pages \
    micro micro-doc \
    musl-locales \
    nano nano-doc \
    openssh-client-common \
    openssh-keygen \
    pinentry-curses-ss pinentry-doc \
    procs procs-doc procs-fish-completion \
    ripgrep ripgrep-doc ripgrep-fish-completion \
    sudo \
    shadow \
    starship \
    topgrade topgrade-doc topgrade-fish-completion \
    tree tree-doc \
    unzip unzip-doc \
    vim vim-doc vimdiff \
    wget wget-doc \
    wipe wipe-doc \
    xh xh-doc xh-fish-completion \
    yq-go yq-go-fish-completion \
    zip zip-doc


RUN \
    cd /usr/local/bin && \
    curl https://zyedidia.github.io/eget.sh | sh && chown root:root /usr/local/bin/eget && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd && \
    sed -ri 's|^(root:)(.*)/bin/sh|\1\2/usr/bin/fish|' /etc/passwd && \
    mkdir -p -m 755 /etc/fish/conf.d /etc/fish/functions

COPY --chown=root:root --chmod=644 ["fish/conf.d/*", "/etc/fish/conf.d/"]
COPY --chown=root:root --chmod=644 ["fish/functions/*", "/etc/fish/functions/"]

ENTRYPOINT [ "" ]
CMD [ "/usr/bin/fish" ]
