# Image de base Alpine
ARG VARIANT=latest
FROM docker.io/library/alpine:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG LOCALE=fr-CA

ENV LANG=${LOCALE}.UTF-8

COPY dotfiles/.* /etc/skel/
RUN apk update && apk upgrade && \
  apk add --no-cache \
  apk-tools-doc \
  bat bat-doc bat-zsh-completion \
  bottom bottom-doc bottom-zsh-completion \
  curl curl-doc curl-zsh-completion \
  direnv direnv-doc \
  eza eza-doc eza-zsh-completion \
  fd fd-doc fd-zsh-completion \
  gcompat \
  git git-doc git-zsh-completion \
  github-cli github-cli-doc github-cli-zsh-completion \
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
  yq yq-zsh-completion \
  zip zip-doc \
  zsh zsh-doc zsh-completions

RUN \
  echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd && \
  sed -ri 's/^(root:)(.*)\/bin\/ash/\1\2\/bin\/zsh/' /etc/passwd && \
  mkdir -p /root/.local && \
  cp /etc/skel/.z* /root/ && \
  mkdir /etc/skel/.config && \
  mkdir /etc/skel/.local

ENTRYPOINT [ "" ]
CMD [ "/bin/zsh" ]
