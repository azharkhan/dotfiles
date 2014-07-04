# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Load functions
. ~/.functions

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias glpb="cd ~/projects/gallop/gallop_django"
alias glpa="cd ~/projects/gallop/gallop_angular"
alias f8="find . -name '*.py' -not -path '*/migrations/*'  -exec flake8 --max-line-length=5000 --show-source {} \;"
alias p8="find . -name '*.py' -not -path '*/migrations/*' -exec pep8 --max-line-length=5000 --show-source {} \;"
alias evt="cd ~/projects/gallop-event-tracking-service"
alias brew-update="brew update && brew upgrade `brew outdated`"
alias sshfree="ssh root@m-azhar.m-dal.manas.ca"
alias p="cd ~/projects"

# Back and Forward one word
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting git-flow-completion)

source $ZSH/oh-my-zsh.sh

VIRTUAL_ENV_DISABLE_PROMPT="true"

# Customize to your needs...
export PATH=$PATH:/Users/azhar/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
eval "$(rbenv init -)"

[ -s "/Users/azhar/.scm_breeze/scm_breeze.sh" ] && source "/Users/azhar/.scm_breeze/scm_breeze.sh"
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
export EDITOR=/usr/bin/vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
