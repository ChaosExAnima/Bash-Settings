export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

# Variables
CUR_PATH=$(readlink ~/.bash_profile)
CUR_DIR=$(dirname "${CUR_PATH}")

# Shortcuts
alias ll='ls -lah'

# Taken from http://stackoverflow.com/questions/6127328/how-can-i-delete-all-git-branches-which-have-been-merged
alias gitcl='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'

# Runs a command in a screen.
alias screencmd='screen -L -dm time'

# Starts a simple HTTP server.
alias serve='python -m SimpleHTTPServer'

# Opens the iOS Simulation. Mac only.
if [[ $OSTYPE == *darwin* ]]; then
	alias iossim='open -a "Simulator"'
fi

if [[ $- == *i* ]]; then
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		export PS1="\[$(tput setaf 4)\]\u\[$(tput setaf 5)\]@\h \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] "
	else
		export PS1="\[$(tput setaf 4)\]\u \[$(tput setaf 6)\]\W\\$\[$(tput sgr0)\] "
	fi
fi

# Loads custom bash files, if the file exists.
if [ -f "$HOME/.bash_custom" ]; then
	source "$HOME/.bash_custom"
fi

# Autocompletion
. "${HOME}/${CUR_DIR}/git-completion.bash"

. "${HOME}/${CUR_DIR}/wp-completion.bash"

# Taken from: https://medium.com/@jamischarles/adding-autocomplete-to-npm-install-5efd3c424067
# BASH standalone npm install autocomplete. Add this to ~/.bashrc file.
_npm_install_completion () {
	local words cword
	if type _get_comp_words_by_ref &>/dev/null; then
		_get_comp_words_by_ref -n = -n @ -w words -i cword
	else
		cword="$COMP_CWORD"
		words=("${COMP_WORDS[@]}")
	fi

	local si="$IFS"

	# if your npm command includes `install` or `i `
	if [[ ${words[@]} =~ 'install' ]] || [[ ${words[@]} =~ 'i ' ]]; then
		local cur=${COMP_WORDS[COMP_CWORD]}

		# supply autocomplete words from `~/.npm`, with $cur being value of current expansion like 'expre'
		COMPREPLY=( $( compgen -W "$(ls ~/.npm )" -- $cur ) )
	fi

	IFS="$si"
}
# bind the above function to `npm` autocompletion
complete -o default -F _npm_install_completion npm
## END BASH npm install autocomplete

# Adds Grunt autocompletion.
# See: https://github.com/gruntjs/grunt-cli#shell-tab-auto-completion
if hash grunt 2>/dev/null; then
	eval "$(grunt --completion=bash)"
fi

# Adds Hub alias.
# See: https://github.com/github/hub#aliasing
if hash hub 2>/dev/null; then
	eval "$(hub alias -s)"
fi

# For grunt watch.
ulimit -n 1024
