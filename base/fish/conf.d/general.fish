# variables d'environnement générales
set -x PATH $HOME/.local/bin $PATH
set -gx EDITOR micro

# abréviations et commandes générales pour sessions interactives
if status is-interactive
  abbr -a -- batp 'bat -p'
  abbr -a -- dfl 'df -h -t ext4'
  abbr -a -- ff fastfetch

  abbr -a -- cdr 'cd (git rev-parse --show-toplevel)'
  abbr -a -- ggt 'git rev-parse --show-toplevel'

  starship init fish | source
end
