function podman --wraps=podman --description 'alias podman=podman --remote'
 command podman --remote $argv
end
