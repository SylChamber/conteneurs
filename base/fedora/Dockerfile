# Image de base Fedora
ARG VARIANT=40
FROM registry.fedoraproject.org/fedora:${VARIANT}
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

# ARG LANG=fr_CA
# ARG LANGPACK=fr
# ARG LOCALE=${LANG}.UTF-8
# ARG TZ=America/Toronto

# ENV LANG=${LOCALE} \
#   LANGUAGE=${LOCALE} \
#   LC_ALL=${LOCALE} \
#   TZ=${TZ} \
#   _CONTAINERS_USERNS_CONFIGURED=""
ENV _CONTAINERS_USERNS_CONFIGURED=""

COPY dotfiles/.* /etc/skel/

# https://stackoverflow.com/questions/64205680/cant-find-any-man-pages-in-fedora-docker-image
# activation de l'installation des man-pages et réinstallation des paquets
RUN \
  sed -ri 's/^tsflags=nodocs$//' /etc/dnf/dnf.conf && \
  dnf -y reinstall $(rpm -qads --qf "PACKAGE: %{NAME}\n" | sed -n -E '/PACKAGE: /{s/PACKAGE: // ; h ; b }; /^not installed/ { g; p }' | uniq) && \
  # dnf -y reinstall shadow-utils && \
  dnf -y update && dnf -y install \
  'dnf-command(config-manager)' \
  bat \
  btop \
  curl \
  fd-find \
  fuse-overlayfs \
  git \
  #glibc-langpack-${LANGPACK} \
  #glibc-locale-source \
  htop \
  jq \
  man-db \
  man-pages \
  micro \
  nano \
  openssh \
  openssh-clients \
  podman \
  sudo \
  tree \
  unzip \
  util-linux \
  vim-enhanced \
  wget \
  which \
  yq \
  zip \
  zsh \
  --exclude container-selinux && \
  dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && \
  dnf -y install gh --repo gh-cli && \
  mkdir -p /etc/skel/.config/containers

COPY containers.conf /etc/containers/containers.conf

COPY user-containers.conf /etc/skel/.config/containers/containers.conf

# localedef --verbose --force -i ${LANG} -f UTF-8 ${LOCALE} && \
RUN \
  mkdir -p /etc/sudoers.d/ && \
  echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel-nopasswd

RUN \
  chsh --shell /usr/bin/zsh && \
  mkdir -p /root/.local && \
  cp /etc/skel/.z* /root/ && \
  curl -fsS https://starship.rs/install.sh | sh -s -- --force > /dev/null

# ARG USER=user

# RUN \
#   adduser -s /usr/bin/zsh -G wheel ${USER} && \
#   echo ${USER}:100000:65536 > /etc/subuid && \
#   echo ${USER}:100000:65536 > /etc/subgid

# VOLUME /home/${USER}/.local/share/containers

# RUN chown ${USER}:${USER} -R /home/${USER}

# USER ${USER}
# WORKDIR /home/${USER}
# CMD [ "/usr/bin/zsh" ]

ENTRYPOINT [ "" ]
CMD [ "/usr/bin/zsh" ]
