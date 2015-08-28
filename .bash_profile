export PATH=/usr/local/bin:$PATH
export PATH=~/Scripts:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

alias ll='ls -lah'

if [[ $- == *i* ]]; then
	# Custom bash prompt via kirsle.net/wizards/ps1.html
	export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
fi

if [ -f ~/.bash_custom ]; then
	source ~/.bash_custom
fi

CUR_PATH=$(readlink ~/.bash_profile)
CUR_DIR=$(dirname "${CUR_PATH}")

if [ -f "${CUR_DIR}/git-completion.bash" ]; then
  . "${CUR_DIR}/git-completion.bash"
fi

if [ -f "${CUR_DIR}/wp-completion.bash" ]; then
	. "${CUR_DIR}/wp-completion.bash"
fi

if [ hash grunt 2>/dev/null ]; then
	eval "$(grunt --completion=bash)"
fi

# For grunt watch.
ulimit -n 1024
