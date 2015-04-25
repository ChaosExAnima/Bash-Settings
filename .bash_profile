export PATH=/usr/local/bin:$PATH
export PATH=~/Scripts:$PATH
export PATH=~/Scripts/phpcs/scripts:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias ll='ls -lah'

if [ -f git-completion.bash ]; then
  . git-completion.bash
fi

if [ -f wp-completion.bash ]; then
	. wp-completion.bash
fi

eval "$(grunt --completion=bash)"

# For grunt watch.
ulimit -n 1024