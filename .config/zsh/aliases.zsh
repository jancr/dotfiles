# Aliases and mappings
if [[ -a "$(which nvim 2> /dev/null)" ]]; then
	export EDITOR=`which nvim`
	alias vim='nvim';
else
	export EDITOR=`which vim`
fi;

alias chrome=google-chrome
unalias ll
alias "ll=ls -lh"
# TODO alias and completion for the alias
# alias t="todo.sh"
# alias iperl="$HOME/.local/p5-iperl/bin/iperl"


if [ $OS = "Darwin" ]; then
	alias c="pbcopy"
	alias v="pbpaste"
	alias excel='/Applications/Microsoft Excel.app'
	alias word='/Applications/Microsoft Word.app'
	alias powerpoint='/Applications/Microsoft PowerPoint.app'
	# export PATH="$PATH:/$HOME/Library/Python/2.7/bin"
	# export PATH="$PATH:/$HOME/Library/Python/3.6/bin"
elif [ $OS = "Linux" ]; then
	if [[ -a "$(which nodejs 2> /dev/null)" ]]; then
		alias node="nodejs"
	fi;
	if [[ -a "$(which xclip 2> /dev/null)" ]]; then
		alias c="xclip -selection clipboard"
		alias v="xclip -selection clipboard -o"
	fi;
fi

# function aliases
#
# function cpu_hog {
	# ps -eo pcpu,user | egrep "\s$1\$" | cut -f 1 -d ' ' | python3 -c "import sys; print(sum(map(float, sys.stdin.read().split())))"
# }
