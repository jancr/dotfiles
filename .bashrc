#!/usr/bin/env bash

OS=`uname -s`
export PATH="$HOME/bin:$PATH:$HOME/.local/bin"

# tab completion
if [ $OS = "Darwin" ]; then
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
 elif [ $OS = "Linux" ]; then
	[ -f /etc/bash_completion ] && . /etc/bash_completion
fi

# powerline terminal
 if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
	     source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
