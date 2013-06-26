export CLICOLOR=1
source ~/.bashrc
alias ls="ls -G"
alias bapp='cd ~/Sites/bookapp-backend'


PATH=$PATH:~/bin
export PATH
export PS1="\[\e[0;32m\]:\u \[\e[0;34m\][ \w ]\[\e[0;35m\] ~ \[\e[00m\] "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
