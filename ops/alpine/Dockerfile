# Image Alpine pour le IaC
ARG VARIANT=alpine

# étape de téléchargement de binaires
FROM ghcr.io/sylchamber/base:alpine as download

ARG KUBECTL_VERSION
ARG HASHICORP_URL=https://releases.hashicorp.com
ARG TERRAFORM_VERSION
ARG TOFU_VERSION

RUN \
    mkdir -p /tmp/bin && \
    curl -fL https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /tmp/bin/kubectl && \
    curl -fL ${HASHICORP_URL}/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip && \
    eget opentofu/opentofu --asset tar.gz --asset '^gpg' --asset '^pem' --asset '^sig' --file tofu --tag ${TOFU_VERSION} --to /tmp/bin/ && \
    eget norwoodj/helm-docs --asset tar.gz --to /tmp/bin/ && \
    eget kubernetes-sigs/krew --file "./krew-linux_amd64" --to /tmp/bin/kubectl-krew && \
    eget kubecolor/kubecolor --asset tar.gz --to /tmp/bin/ && \
    eget kubernetes-sigs/kustomize --to /tmp/bin/ && \
    eget aquasecurity/trivy --asset 64bit.tar.gz --asset '^pem' --asset '^sig' --to /tmp/bin/ && \
    eget tektoncd/cli --file tkn --to /tmp/bin/ && \
    unzip -od /tmp/bin /tmp/terraform.zip terraform && \
    chmod 755 /tmp/bin/*

# image finale
FROM ghcr.io/sylchamber/base:${VARIANT}
LABEL org.opencontainers.image.base.name ghcr.io/sylchamber/base:${VARIANT}
LABEL org.opencontainers.image.description="Image de IaC et d'ingénierie de plateforme"
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG USER=ops

COPY --from=download /tmp/bin/* /usr/local/bin/

RUN apk add --no-cache \
    fuse-overlayfs \
    go-task go-task-doc go-task-fishcomp go-task-task \
    helm helm-fish-completion \
    podman podman-doc podman-fish-completion \
    podman-compose podman-compose-doc \
    podman-remote \
    podman-tui \
    python3 \
    py3-pip \
    py3-pip-doc \
    py3-pip-zsh-completion \
    pipx \
    sops

RUN \
    useradd --shell /usr/bin/fish ${USER} --groups wheel --create-home && \
    mkdir -p /home/${USER}/.config/fish/conf.d /home/${USER}/.config/fish/functions && \
    mkdir -p /home/${USER}/.local/share

ADD podman-tui.conf /home/${USER}/.config/podman-tui/podman-tui.conf
ADD pip.conf /home/${USER}/.config/pip/pip.conf

COPY --chown=${USER}:${USER} --chmod=644 ["config/fish/conf.d/*", "/home/${USER}/.config/fish/conf.d/"]
COPY --chown=${USER}:${USER} --chmod=644 ["config/fish/functions/*", "/home/${USER}/.config/fish/functions/"]

RUN chown ${USER}:${USER} -R /home/${USER}

VOLUME /home/${USER}/.local/share/containers

USER ${USER}
WORKDIR /home/${USER}
CMD [ "/usr/bin/fish" ]
