ARG VARIANT=latest
FROM quay.io/sylchambr/base:${VARIANT}
LABEL org.opencontainers.image.base.name quay.io/sylchambr/base
LABEL org.opencontainers.image.source https://github.com/SylChamber/conteneurs

ARG USER=user

RUN adduser -s /bin/zsh -D ${USER} && \
  adduser ${USER} wheel && \
  apk add --no-cache \
  github-cli github-cli-doc github-cli-zsh-completion

USER ${USER}
WORKDIR /home/${USER}
CMD [ "/bin/zsh" ]
