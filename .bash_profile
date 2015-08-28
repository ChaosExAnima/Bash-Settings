export PATH=/usr/local/bin:$PATH
export PATH=~/Scripts:$PATH
export PATH=~/Scripts/phpcs/scripts:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
if [[ $- == *i* ]]; then
	# Custom bash prompt via kirsle.net/wizards/ps1.html
	export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
fi

alias ll='ls -lah'

if [ -f Scripts/git-completion.bash ]; then
  . Scripts/git-completion.bash
fi

if [ -f Scripts/wp-completion.bash ]; then
	. Scripts/wp-completion.bash
fi

eval "$(grunt --completion=bash)"

# For grunt watch.
ulimit -n 1024