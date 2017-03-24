#!/usr/bin/env bash

OS=`uname -s`
export PATH="$HOME/bin:$PATH:$HOME/.local/bin"

if [ $OS = "Darwin" ]; then
	# tab completion
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
	export PATH="$PATH:/$HOME/Library/Python/2.7/bin"
	export PATH="$PATH:/$HOME/Library/Python/3.6/bin"
	# powerline (dosen't seem to work)
	POWERLINE_CONFIG_COMMAND=powerline
	if [ -f /$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source /$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
	elif [ -f /$HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source /$HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/bash/powerline.sh
	fi
 elif [ $OS = "Linux" ]; then
	# tab completion
	[ -f /etc/bash_completion ] && . /etc/bash_completion

	# powerline 
	if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
	elif [ -f ~/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source ~/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
	fi
fi

# powerline terminal
