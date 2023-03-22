ARG VARIANT=latest
FROM sylchamber/base:${VARIANT}

ARG USER=user

RUN adduser -s /bin/zsh -D ${USER} && \
  adduser ${USER} wheel

USER ${USER}
WORKDIR /home/${USER}
CMD [ "/bin/zsh" ]
