# Production des images

user := quay.io/sylchambr
image_name := ${user}/base

# déterminer le client de conteneur: docker ou podman
cli != [ -f /usr/bin/podman ] && echo "/usr/bin/podman" || ( [ -f /usr/bin/docker ] && echo "/usr/bin/docker" )

ifndef cli
  $(error ERROR: docker ou podman doivent être installés)
endif

.PHONY: build
build:
	${cli} build -t ${image_name} -t ${image_name}:alpine .

.PHONY: push
push:
	${cli} push ${image_name}
	${cli} push ${image_name}:alpine
