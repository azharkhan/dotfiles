#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/gvim

# Add aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# VIM Colors
[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
