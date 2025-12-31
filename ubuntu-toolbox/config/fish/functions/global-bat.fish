function bat --wraps=batcat --description 'alias bat=batcat'
  set -l DISTRO (cat /etc/os-release | rg '^NAME=' | sed -r 's/NAME="(.*)"/\1/')

  if test "$DISTRO" = "Ubuntu"
    command batcat $argv
  else
    command bat $argv
  end

end
