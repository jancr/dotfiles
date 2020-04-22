OS=`uname -s`

########################################
# bash_it (if no zsh is avalible)
########################################
touch $HOME/.config/bash_extra.sh

#!/usr/bin/env bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.local/bash_it
bash $HOME/.local/bash_it/install.sh --no-modify-config
source ~/.bashrc

################################################################################
# pyenv
################################################################################
# export PYENV_ROOT="$HOME/.local/pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export QT_QPA_PLATFORM='offscreen'

# Setup virtualenv home
export WORKON_HOME=$HOME/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# Tell pyenv-virtualenvwrapper to use pyenv when creating new Python environments
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Set the pyenv shims to initialize
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi


#bash-it alias
bash-it enable alias clipboard 

# bash-it plugin
bash-it enable plugin autojump base battery browser dirs edit-mode-vi extract git hg history latex less-pretty-cat node pyenv python ruby ssh tmux todo visual-studio-code fasd

# bash-it completions
bash-it enable completion bash-it bundler conda defaults dirs django docker gem git makefile npm pip pip3 rake ssh tmux todo virtualbox

if [[ $OS == "Linux" ]]; then
	bash-it enable alias apt 
elif [[ $OS == "Darwin" ]]; then
	bash-it search osx brew --enable
fi
