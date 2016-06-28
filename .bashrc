export CLICOLOR=1
export EDITOR=vim

alias l="ls"
alias ll="ls -l"
alias ..="cd .."
alias ...="cd ../.."

# github hub
alias git="hub"
eval "$(hub alias -s)"
source ~/.git-completion.bash
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# tmux aliases

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# powerline
function _update_ps1() {
   export PS1="$(~/projects/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
