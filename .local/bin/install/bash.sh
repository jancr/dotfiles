OS=`uname -s`

########################################
# bash_it (if no zsh is avalible)
########################################
touch $HOME/.config/bash_extra.sh

#!/usr/bin/env bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.local/bash_it
bash $HOME/.local/bash_it/install.sh --no-modify-config
source ~/.bashrc

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
