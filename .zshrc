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
#export EDITOR=/usr/local/bin/vim
export EDITOR=/usr/local/bin/code
export VISUAL=/usr/local/bin/code

# Ensure local packages takes precedence
export PATH="/usr/local/bin:$PATH"

# z.sh
. "/usr/local/etc/profile.d/z.sh"

# Add aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Alias `hub` to `git`
eval "$(hub alias -s)"

# VIM Colors
[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color-italic

# Terminal Colors
if [ "$TERM_PROGRAM" = "Apple Terminal" ]; then
    source ~/.vim/bundle/gruxbox/gruvbox_256palette.sh
fi

# Pure Prompt
autoload -U promptinit && promptinit
prompt pure

# Setup Completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

export PATH="~/.yarn/bin:$PATH"
export TERM=xterm-256color-italic
export NPM_TOKEN="4b8e3022a34650f0a8ddb3b7af610d3b97c6141e"

# Overrides script

runConfigTask(){
  environment=$1 #$1
  [ -z $2 ] && region='us-east-1' || region=$2
  cluster=hubba-${environment} #$3
  # count=`aws --region ${region} ecs describe-clusters --clusters ${cluster} --output text --query clusters[0].registeredContainerInstancesCount`
  count=10 # aws :(
  aws --region ${region} ecs run-task --cluster ${cluster} --task-definition update-overrides-${environment} --count ${count}
}
overrides(){
  cd ~/ws/hubba/overrides
  aws s3 sync s3://hubba-builds/overrides/ ./
}
overridesUp(){
  cd ~/ws/hubba/overrides
  aws s3 sync ./ s3://hubba-builds/overrides/
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"
export PATH="/Users/azhar/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

