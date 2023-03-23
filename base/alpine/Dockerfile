# Image de base Alpine
ARG VARIANT=latest
FROM docker.io/library/alpine:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG LOCALE=fr-CA

ENV LANG=${LOCALE}.UTF-8

COPY dotfiles/.* /etc/skel/
RUN apk update && \
  apk upgrade && \
  apk add --no-cache \
  apk-tools-doc \
  sudo \
  shadow \
  zsh \
  zsh-doc \
  zsh-completions \
  man-db \
  man-db-doc \
  man-db-lang \
  man-pages \
  nano \
  nano-doc \
  curl \
  git \
  git-zsh-completion \
  jq \
  jq-doc \
  starship \
  starship-zsh-plugin \
  yq \
  yq-zsh-completion && \
  echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd && \
  sed -ri 's/^(root:)(.*)\/bin\/ash/\1\2\/bin\/zsh/' /etc/passwd && \
  mkdir -p /root/.local && \
  cp /etc/skel/.z* /root/ && \
  mkdir /etc/skel/.config && \
  mkdir /etc/skel/.local

ENTRYPOINT [ "" ]
CMD [ "/bin/zsh" ]
