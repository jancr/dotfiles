#!/usr/bin/env bash
OS=`uname -s`
mkdir -p $HOME/.config

# Install dependencies using apt/brew
if [[ "$OS" == "Darwin" ]]; then
	bash $HOME/.local/bin/install/macos_dependencies.sh
elif [[ "$OS" == "Linux" ]]; then
	bash $HOME/.local/bin/install/linux_dependencies.sh
fi

# install using pip/node/etc
bash $HOME/.local/bin/install/python.sh
bash $HOME/.local/bin/install/npm.sh

# shells
bash $HOME/.local/bin/install/bash.sh
bash $HOME/.local/bin/install/zsh.sh
bash $HOME/.local/bin/install/tmux.sh

bash $HOME/.local/bin/install/neovim.sh
bash $HOME/.local/bin/install/jupyter.sh
bash $HOME/.local/bin/install/other.sh

z
