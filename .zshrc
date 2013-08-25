# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bapp="cd ~/Sites/bookapp-utils"
alias pserver="python -m SimpleHTTPServer"
alias sshwww="ssh azhkha@thomas-mifflin.dreamhost.com"

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
plugins=(git zsh-syntax-highlighting brew bundler rails3 pygmentize-zsh)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/azhar/.rvm/gems/ruby-1.9.3-p194/bin:/Users/azhar/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/azhar/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/azhar/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/usr/local/share/python:/Users/azhar/bin

PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}%{$fg[blue]%}@%m%{$reset_color%}%{$fg_bold[green]%} %~%{$reset_color%} %{$fg_bold[black]%}➜ %{$reset_color%} '

function git_prompt {
	local DIRTY="%{$fg[yellow]%}"
	local CLEAN="%{$fg[green]%}"
	local UNMERGED="%{$fg[red]%}"
	local RESET="%{$terminfo[sgr0]%}"
	git rev-parse --git-dir >& /dev/null
	
	if [[ $? == 0 ]]
	then
			if [[ `git ls-files -u >& /dev/null` == '' ]]
			then
					git diff --quiet >& /dev/null
					if [[ $? == 1 ]]
					then
							echo -n $DIRTY
					else
							git diff --cached --quiet >& /dev/null
							if [[ $? == 1 ]]
							then
									echo -n $DIRTY
							else
									echo -n $CLEAN
							fi
					fi
			else
					echo -n $UNMERGED
			fi
			echo -n `git branch | grep '* ' | sed 's/..//'`
			echo -n $RESET
	fi
}
#GIT_PROMPT_PREFIX="%{$fg[black]%}[%{$reset_color%}"
#GIT_PROMPT_SUFFIX="%{$fg[black]%}]%{$reset_color%}"
RPROMPT='[$(git_prompt)]'
# Disable Hostnmae Completion
zstyle ':completion:*' hosts off
# Speed up Git Completion
__git_files () { 
      _wanted files expl 'local files' _files     
    }

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Sites
source /usr/local/bin/virtualenvwrapper.sh
