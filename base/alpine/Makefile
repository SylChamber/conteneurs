# Production des images

local := sylchamber
registry := quay.io/sylchambr
image_name := base
variant := alpine

# déterminer le client de conteneur: docker ou podman
cli != [ -f /usr/bin/podman ] && echo "/usr/bin/podman" || ( [ -f /usr/bin/docker ] && echo "/usr/bin/docker" )

ifndef cli
  $(error ERROR: docker ou podman doivent être installés)
endif

.PHONY: build
build:
	${cli} build -t ${local}/${image_name}:${variant} \
	-t ${registry}/${image_name}:${variant} .

.PHONY: push
push:
	${cli} push ${registry}/${image_name}:${variant}
