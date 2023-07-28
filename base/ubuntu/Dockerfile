# Image de base Ubuntu - version intérim en cours (rolling)
ARG VARIANT=rolling
FROM public.ecr.aws/docker/library/ubuntu:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG LOCALE=fr_CA.UTF-8
ARG TIMEZONE=America/Toronto

ENV DEBIAN_FRONTEND=noninteractive \
  LANG=${LOCALE} \
  LANGUAGE=${LOCALE} \
  LC_ALL=${LOCALE} \
  TZ=${TIMEZONE}

COPY dotfiles/.* /etc/skel/
RUN apt-get update -y && apt-get install -y \
  sudo \
  ca-certificates \
  locales tzdata \
  coreutils \
  zsh zsh-doc zsh-antigen \
  man-db manpages manpages-fr \
  bat \
  exa \
  gdu \
  duf \
  fd-find \
  tree \
  htop btop \
  direnv \
  nano \
  curl wget \
  git git-doc \
  gpg gpg-agent pinentry-curses pinentry-doc \
  openssh-client \
  jq yq \
  zip unzip \
  && rm -rf /var/lib/apt/lists/*

# Définition du locale:
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container#answer-28406007
RUN echo '%adm ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/adm-nopasswd && \
  chsh -s /usr/bin\/zsh && \
  mkdir -p /root/.local && \
  cp /etc/skel/.z* /root/ && \
  mkdir /etc/skel/.config && \
  mkdir /etc/skel/.local && \
  sed -i "/${LOCALE}/s/^# //g" /etc/locale.gen && locale-gen && \
  curl -sS https://starship.rs/install.sh | sh -s -- --force > /dev/null

ENTRYPOINT [ "" ]
CMD [ "/usr/bin/zsh" ]
