function ls --wraps='lsd --header --group-directories-first --git' --description 'alias ls lsd --header --group-directories-first --git'
  lsd --header --group-directories-first --git $argv

end
