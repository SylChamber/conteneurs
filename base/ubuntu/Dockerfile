# Image de base Ubuntu - version intérim en cours
# ubuntu stable géré par Canonical, non-lts
# mis à jour plus fréquemment que ubuntu:rolling géré par Docker
ARG VARIANT=latest
FROM public.ecr.aws/ubuntu/ubuntu:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG USER=ubuntu
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
  zsh zsh-doc \
  man-db manpages manpages-fr \
  bat \
  gdu \
  duf \
  fd-find \
  tree \
  lsof \
  htop btop \
  direnv \
  nano \
  micro \
  vim \
  curl wget \
  git git-doc \
  gpg gpg-agent pinentry-curses pinentry-doc \
  openssh-client \
  jq yq \
  zip unzip && \
  yes | unminimize

# Définition du locale:
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container#answer-28406007
RUN CODENAME=$(sed -En 's/VERSION_CODENAME=(.*)/\1/p' /etc/os-release) && \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  | dd of=/etc/apt/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  > /etc/apt/sources.list.d/github-cli.list && \
  apt-get update -y && apt-get install gh -y && \
  curl -fsS https://starship.rs/install.sh | sh -s -- --force > /dev/null && \
  wget --quiet --output-document - https://github.com/mattmc3/antidote/archive/refs/heads/main.tar.gz | \
  tar xz --directory /usr/local/share/ && \
  echo '%adm ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/adm-nopasswd && \
  chsh --shell /usr/bin\/zsh && \
  chsh --shell /usr/bin\/zsh ${USER} && \
  mkdir -p /root/.local && \
  mkdir -p /home/${USER}/.local && \
  cp /etc/skel/.z* /root/ && \
  cp /etc/skel/.z* /home/${USER} && \
  chown -R ${USER}:${USER} /home/${USER} && \
  mkdir /etc/skel/.config && \
  mkdir /etc/skel/.local && \
  sed -i "/${LOCALE}/s/^# //g" /etc/locale.gen && locale-gen && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "" ]
CMD [ "/usr/bin/zsh" ]
