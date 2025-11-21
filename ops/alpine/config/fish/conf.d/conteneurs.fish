# abréviations pour docker et podman
if status is-interactive
  abbr -a -- d docker
  abbr -a -- db 'docker build'
  abbr -a -- dc 'docker container'
  abbr -a -- di 'docker image'
  abbr -a -- dp 'docker pull'
  abbr -a -- dps 'docker ps'
  abbr -a -- dr 'docker container run'
  abbr -a -- dv 'docker volume'
  abbr -a -- fx 'docker exec'

  abbr -a -- p podman
  abbr -a -- pb 'podman build'
  abbr -a -- pc 'podman container'
  abbr -a -- pi 'podman image'
  abbr -a -- pils 'podman image ls --sort repository'
  abbr -a -- pp 'podman pull'
  abbr -a -- pps 'podman ps'
  abbr -a -- pr 'podman container run'
  abbr -a -- pv 'podman volume'
  abbr -a -- px 'podman exec'
end
