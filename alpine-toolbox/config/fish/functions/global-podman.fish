function podman --description 'alias podman=flatpak-spawn --host podman'
    command flatpak-spawn --host podman $argv
end
