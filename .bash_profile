export PATH=/usr/local/bin:$PATH
export PATH=~/Scripts:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

alias ll='ls -lah'

# Taken from http://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
alias gitcl='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'

if [[ $- == *i* ]]; then
	# Custom bash prompt via kirsle.net/wizards/ps1.html
	export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
fi

if [ -f "$HOME/.bash_custom" ]; then
	source "$HOME/.bash_custom"
fi

CUR_PATH=$(readlink ~/.bash_profile)
CUR_DIR=$(dirname "${CUR_PATH}")

. "${HOME}/${CUR_DIR}/git-completion.bash"

. "${HOME}/${CUR_DIR}/wp-completion.bash"

if [ hash grunt 2>/dev/null ]; then
	eval "$(grunt --completion=bash)"
fi

# For grunt watch.
ulimit -n 1024
