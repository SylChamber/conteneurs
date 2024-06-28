# Image Alpine pour le IaC
ARG VARIANT=alpine

# étape de téléchargement de binaires
FROM quay.io/sylchambr/base:alpine as download

ARG HASHICORP_URL=https://releases.hashicorp.com
ARG PACKER_VERSION
ARG TERRAFORM_VERSION
ARG TOFU_VERSION

RUN \
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

COPY --from=download /tmp/packer /tmp/terraform /tmp/tofu.apk /tmp/

COPY --from=sessionmanagerplugin /usr/local/sessionmanagerplugin/bin/session-manager-plugin /usr/local/bin/

RUN adduser -s /bin/zsh -D ${USER} && \
  adduser ${USER} wheel && \
  apk add --no-cache \
  aws-cli aws-cli-doc aws-cli-zsh-completion \
  python3 py3-pip py3-pip-doc py3-pip-zsh-completion && \
  apk add --allow-untrusted /tmp/tofu.apk && \
  mv /tmp/packer /usr/local/bin/ && \
  mv /tmp/terraform /usr/local/bin/ && \
  rm /tmp/tofu.apk

USER ${USER}
WORKDIR /home/${USER}
CMD [ "/bin/zsh" ]
