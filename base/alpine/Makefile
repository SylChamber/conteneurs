# Production des images

user := quay.io/sylchambr
image_name := ${user}/base
variant := alpine

# déterminer le client de conteneur: docker ou podman
cli != [ -f /usr/bin/podman ] && echo "/usr/bin/podman" || ( [ -f /usr/bin/docker ] && echo "/usr/bin/docker" )

ifndef cli
  $(error ERROR: docker ou podman doivent être installés)
endif

.PHONY: build
build:
	${cli} build -t ${image_name}:${variant} .

.PHONY: push
push:
	${cli} push ${image_name}:${variant}
