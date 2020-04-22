#!/usr/bin/env bash
command_exists () {
    type "$1" &> /dev/null ;
}

OS=`uname -s`
export PATH="$HOME/.local/bin:$PATH:"
[ -f $HOME/.config/bash_extra.sh ] && source $HOME/.config/bash_extra.sh
[ -f $HOME/.local/qfc/bin/qfc.sh ] && source $HOME/.local/qfc/bin/qfc.sh

if [ $OS = "Darwin" ]; then
	# tab completion
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
 elif [ $OS = "Linux" ]; then
	# tab completion
	[ -f /etc/bash_completion ] && . /etc/bash_completion
fi

################################################################################
# Bash_it
################################################################################
# Path to the bash it configuration
export BASH_IT="$HOME/.local/bash_it"
export BASH_IT_CUSTOM="$HOME/.config/bash_it_custom"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='sexy'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

unset MAILCHECK
export IRC_CLIENT='irssi'
export TODO="t"
# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh

################################################################################
# custom stuff
################################################################################
set -o emacs
export PYTHONPATH='.'
