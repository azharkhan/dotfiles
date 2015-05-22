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

# SSH

alias sshbox="ssh azhar@a-ca.manas.ca"
alias sshru="ssh -L 8081:127.0.0.1:80 -N azhar@a-ca.manas.ca"
alias sshplex="ssh -L 32400:127.0.0.1:32400 -N azhar@a-ca.manas.ca"
alias sshproxy="ssh -N -D 2001 azhar@209.105.232.237"

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# powerline
function _update_ps1() {
   export PS1="$(~/projects/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
