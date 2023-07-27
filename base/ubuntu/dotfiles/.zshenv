# ~/.zshenv
# variables d'environnement
# https://zsh.sourceforge.io/Intro/intro_3.html

# ajouter les bin privés au PATH
if [ -d $HOME/.local/bin ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi
