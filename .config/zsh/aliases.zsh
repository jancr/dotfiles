
# Aliases and mappings
if [ $+commands[nvim] ]; then
	export EDITOR=`which nvim`
	alias vim='nvim';
else
	export EDITOR=`which vim`
fi;

alias chrome=google-chrome
# TODO alias and completion for the alias
alias t="todo.sh"
alias iperl="$HOME/.local/p5-iperl/bin/iperl"


if [ $OS = "Darwin" ]; then
	alias c="pbcopy"
	alias v="pbpaste"
	alias excel='/Applications/Microsoft Excel.app'
	alias word='/Applications/Microsoft Word.app'
	alias powerpoint='/Applications/Microsoft PowerPoint.app'
	export PATH="$PATH:/$HOME/Library/Python/2.7/bin"
	export PATH="$PATH:/$HOME/Library/Python/3.6/bin"
	# compdef excel='open'
	# compdef word='open'
	# compdef powerpoint='open'
elif [ $OS = "Linux" ]; then
	alias node="nodejs"
	alias c="xclip -selection clipboard"
	alias v="xclip -selection clipboard -o"
fi

# function aliases
#
# function cpu_hog {
	# ps -eo pcpu,user | egrep "\s$1\$" | cut -f 1 -d ' ' | python3 -c "import sys; print(sum(map(float, sys.stdin.read().split())))"
# }
