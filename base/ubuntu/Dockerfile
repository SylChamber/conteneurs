# Image de base Ubuntu - version intérim en cours
# ubuntu stable géré par Canonical, non-lts
# mis à jour plus fréquemment que ubuntu:rolling géré par Docker
ARG VARIANT=latest
FROM public.ecr.aws/ubuntu/ubuntu:${VARIANT}
LABEL org.opencontainers.image.source=https://github.com/SylChamber/conteneurs
LABEL org.opencontainers.image.description="Image de base Ubuntu version intérim"
LABEL org.opencontainers.image.base.name=public.ecr.aws/ubuntu/ubuntu:${VARIANT}

ARG USER=ubuntu
ARG LOCALE=fr_CA.UTF-8
ARG TIMEZONE=America/Toronto

ENV DEBIAN_FRONTEND=noninteractive \
  LANG=${LOCALE} \
  LANGUAGE=${LOCALE} \
  LC_ALL=${LOCALE} \
  TZ=${TIMEZONE}

COPY dotfiles/.* /etc/skel/
RUN \
  apt-get update -y && apt-get install -y \
  sudo \
  ca-certificates \
  locales tzdata \
  coreutils \
  zsh zsh-doc \
  man-db manpages manpages-fr tealdeer unminimize \
  acl \
  bat \
  gdu \
  duf \
  dysk \
  eza \
  fd-find \
  tree \
  wipe \
  lsof \
  htop btop fastfetch procs s-tui \
  direnv \
  nano \
  micro \
  vim \
  curl httpie wget \
  git git-doc git-credential-oauth \
  gpg gpg-agent pinentry-curses pinentry-doc \
  openssh-client \
  jq \
  zip unzip && \
  yes | unminimize && \
  rm -rf /var/lib/apt/lists/*

# Définition du locale:
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container#answer-28406007
RUN \
  cd /usr/local/bin && \
  curl https://zyedidia.github.io/eget.sh | sh && chown root:root /usr/local/bin/eget && \
  curl -fsS https://starship.rs/install.sh | sh -s -- --force > /dev/null && \
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
