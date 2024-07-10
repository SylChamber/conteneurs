# Image Alpine pour le IaC
ARG VARIANT=alpine

# étape de téléchargement de binaires
FROM quay.io/sylchambr/base:alpine as download

ARG KUBECTL_VERSION
ARG HASHICORP_URL=https://releases.hashicorp.com
ARG PACKER_VERSION
ARG TERRAFORM_VERSION
ARG TOFU_VERSION

RUN \
  curl -fL https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /tmp/kubectl && \
  curl -fL ${HASHICORP_URL}/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip && \
  curl -fL ${HASHICORP_URL}/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip && \
  curl -fL https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_amd64.apk -o /tmp/tofu.apk && \
  unzip -od /tmp /tmp/packer.zip && \
  unzip -od /tmp /tmp/terraform.zip

# étape de récupération de session-manager-plugin for AWS CLI
# https://github.com/aws/session-manager-plugin/issues/12#issuecomment-964117677
FROM ubuntu:20.04 as sessionmanagerplugin

RUN apt-get update && \
  apt-get install -y curl && \
  curl -Lo "session-manager-plugin.deb" "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" && \
  dpkg -i "session-manager-plugin.deb"

# image finale
FROM quay.io/sylchambr/base:${VARIANT}
LABEL org.opencontainers.image.base.name quay.io/sylchambr/iac
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG USER=user

COPY --from=download /tmp/kubectl /tmp/packer /tmp/terraform /tmp/tofu.apk /tmp/

COPY --from=sessionmanagerplugin /usr/local/sessionmanagerplugin/bin/session-manager-plugin /usr/local/bin/

RUN apk add --no-cache \
  aws-cli \
  aws-cli-doc \
  aws-cli-zsh-completion \
  pipx \
  podman \
  podman-compose \
  podman-doc \
  podman-remote \
  podman-tui \
  podman-zsh-completion \
  python3 \
  py3-pip \
  py3-pip-doc \
  py3-pip-zsh-completion \
  sops && \
  apk add --allow-untrusted /tmp/tofu.apk && \
  mv /tmp/packer /usr/local/bin/ && \
  mv /tmp/terraform /usr/local/bin/ && \
  mv /tmp/kubectl /usr/local/bin/ && \
  rm /tmp/tofu.apk && \
  chmod +x /usr/local/bin/*

RUN \
  useradd --shell /bin/zsh ${USER} --groups wheel --create-home && \
  mkdir -p /tmp/storage-run-1000/podman && \
  chown ${USER}:${USER} -R /tmp/storage-run-1000

ADD podman-tui.conf /home/${USER}/.config/podman-tui/podman-tui.conf
ADD pip.conf /home/${USER}/.config/pip/pip.conf

RUN chown ${USER}:${USER} -R /home/${USER}/.config

VOLUME /tmp/storage-run-1000/podman/

USER ${USER}
WORKDIR /home/${USER}
CMD [ "/bin/zsh" ]
