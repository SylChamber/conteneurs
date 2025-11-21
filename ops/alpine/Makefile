# Gestion des images iac

local := sylchamber
registry := ghcr.io/sylchamber
image_name := ops
variant := alpine
git_api := https://api.github.com/repos
tag_key := .tag_name
version_regex := s/v(.*)/\1/

# transférer cette logique dans un multi-stage build
kubectl_version = $(shell curl -L -s https://dl.k8s.io/release/stable.txt)
terraform_version = $(shell curl -sL ${git_api}/hashicorp/terraform/releases/latest | jq -r ${tag_key} | sed -r '${version_regex}')
tofu_version = $(shell curl -sL ${git_api}/opentofu/opentofu/releases/latest | jq -r ${tag_key} | sed -r '${version_regex}')

# déterminer le client de conteneur: podman (prioritaire) ou docker
cli != [ -f /usr/bin/podman ] && echo "/usr/bin/podman" || ( [ -f /usr/bin/docker ] && echo "/usr/bin/docker" )

ifndef cli
  $(error ERROR: docker ou podman doivent être installés)
endif

.PHONY: info-versions
info-versions:
	@echo "kubectl: ${kubectl_version}\nterraform: ${terraform_version}\ntofu: ${tofu_version}"

.PHONY: build
build: info-versions
	${cli} build \
	--build-arg KUBECTL_VERSION=${kubectl_version} \
	--build-arg TERRAFORM_VERSION=${terraform_version} \
	--build-arg TOFU_VERSION=${tofu_version} \
	--tag ${local}/${image_name} \
	--tag ${local}/${image_name}:${variant} \
	--tag ${registry}/${image_name} \
	--tag ${registry}/${image_name}:${variant} .

.PHONY: push
push:
	${cli} push ${registry}/${image_name}
	${cli} push ${registry}/${image_name}:${variant}
