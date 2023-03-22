# .zshrc
# alias, fonctions, options, mappage du clavier
# https://zsh.sourceforge.io/Intro/intro_3.html 

# options zsh
setopt autocd extendedglob nomatch notify
unsetopt beep

# charger les alias
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# Keep 1000 lines of history within the shell and save it to ~/.local/zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.local/zsh_history
setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

## options touches clavier
# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# correction des key maps
# référence: https://silvercircle.subspace.cc/2017/10/26/cygwin-zsh-delete-home-end-keys/
# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word  # ^[[1;5D
bindkey "\e[1;5C" forward-word # ^[[1;5C
# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\C-_"    backward-kill-word
# kill line: delete rest of line from cursor ^K
bindkey "\e[1;5F" kill-line
# alt-bs
bindkey "\e\d"  undo
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line

## Options de couleur
# Colored man pages:
#  http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
PAGER="less"
export LESS_TERMCAP_mb=$'\E[01;31m'     # enter_blink_mode
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # enter_bold_mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m' # enter_standout_mode
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # enter_underline_mode
export LESS_TERMCAP_me=$'\E[0m'         # exit_attribute_mode
export LESS_TERMCAP_se=$'\E[0m'         # exit_standout_mode
export LESS_TERMCAP_ue=$'\E[0m'         # exit_underline_mode
export MANROFFOPT="-c"
# tailoring `less'
# LESS="--quit-at-eof --ignore-case --long-prompt --raw-control-chars"
# option RAW-CONTROL-CHARS en majuscules qui passe uniquement les codes de couleur
# open no-init pour éviter d'effacer l'écran en quittant less
LESS="--quit-at-eof --ignore-case --long-prompt --RAW-CONTROL-CHARS --no-init"

# options de couleurs pour ls, puisque dircolors n'est pas installé par défaut
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

# Set up the prompt
# prompt zsh classique
#  autoload -Uz promptinit
#  promptinit && prompt adam1
# prompt starship.rs
eval "$(starship init zsh)"
