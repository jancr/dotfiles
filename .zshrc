 
# Jan Christians Refsgaards .zshrc, originally inspired by Helen Cooks awesome zsh

OS=`uname -s`
export TERM=xterm-256color
################################################################################
# antibody // oh-my-zsh // antigen // zgen
################################################################################
# use antibidy for some stuff because it is faster
# antibody bundle < ~/.zsh/antibody.plugins >> ~/.zsh/antibody.sources

# import zle before oh-my-zsh
zmodload zsh/zle

# and antibody for the rest
source ~/.local/bin/antigen.zsh
source ~/.config/zsh/antigen.zsh
antigen apply

# Enables terminal application mode and updates editor information.
zle -N zle-line-init

# this is set such that z works on windows linux subsystem
setopt nobgnice

################################################################################
eval $(thefuck --alias fix)
# mangle PATHS
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"


################################################################################
# pyenv
################################################################################
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export QT_QPA_PLATFORM='offscreen'
export PYTHON_CONFIGURE_OPTS="--enable-shared"
eval "$(pyenv init -)"
if [ -f $HOME/.config/zsh/pyenv.zsh ]; then
	# modify this script if you do not want 3.7.5 as default
	source $HOME/.config/zsh/pyenv.zsh 
else
	pyenv global 3.7.5
	eval "$(pyenv virtualenv-init -)"
fi

# I fail to see the advantage of pyenv-virtualenvwrapper over pyenv-virtualenv
# so I have commented it out untill I am enlightend
# export WORKON_HOME=$HOME/.virtualenvs
# mkdir -p $WORKON_HOME
# VIRTUALENVWRAPPER_PYTHON=/Users/jcr/.pyenv/shims/python
# source /usr/local/bin/virtualenvwrapper.sh

# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Set the pyenv shims to initialize
# eval "$(pyenv virtualenv-init -)"
# if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
# fi
################################################################################

#
# source sub configs
[ -f $HOME/.local/qfc/bin/qfc.sh ] && source $HOME/.local/qfc/bin/qfc.sh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/vim.zsh
source $HOME/.config/zsh/utf8.zsh

# History settings
export HISTFILE=~/.history
export HIST_STAMPS="dd/mm/yyyy"
setopt EXTENDED_HISTORY     # store date in .history
export SAVEHIST=9999999     # number of lines to save
export HISTSIZE=$SAVEHIST   # number of lines from .history to read in at start of new shell
setopt HIST_IGNORE_ALL_DUPS # history is de-duped
#setopt INC_APPEND_HISTORY  # append as we execute, not when we leave the shell
#setopt SHARE_HISTORY       # share one history between all open shells

# enable **/file expansion, negation [^ab]*, and more
setopt EXTENDED_GLOB


################################################################################
# no training wheels!
################################################################################
setopt rm_star_silent

################################################################################
export DISABLE_AUTO_TITLE="true" 

# if you do not have admin rights, then change defaults to local install
if groups | egrep "admin|sudo" > /dev/null; then; else
	source $HOME/.config/zsh/no_admin.zsh
fi

# source local server settings last so it can overwrite defaults
[ -f $HOME/.config/zsh/extra.zsh ] && source $HOME/.config/zsh/extra.zsh

# force spark to use python3!
export PYSPARK_PYTHON=python3
