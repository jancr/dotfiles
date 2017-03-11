#!/usr/bin/env bash

OS=`uname -s`
my_dir=`pwd`

########################################
# OS specific dependencies
########################################
if [ $OS = "Darwin"]; then
	echo "Not Implemented";
	#install OSX dependencies
	brew install git curl tmux node cmake

	# OSX specific stuff
elif [ $OS = "Linux" ]; then

	# asumes debian/ubuntu
	# install debian dependencies

	# dependencies
	sudo apt-get update
	# python 2
	sudo apt-get -y install python-ipython python-pip

	# python 3
	sudo apt-get -y install python3-ipython python3-pip

	#other
	sudo apt-get -y install git curl tmux nodejs cmake fonts-powerline

	# debian specific stuff
#else
	# cygwin
fi;


########################################
# Other Dependencies
########################################
# antigen (zsh extension manager)
curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > $HOME/bin/antigen.zsh

# powerline, tmux and zsh dependency
pip3 install --user powerline-status

########################################
# vim / neovim
########################################
#nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/nvim/colors
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo
mkdir -p $HOME/.local/share/nvim/backup
#wget http://www.vim.org/scripts/download_script.php?src_id=13400 -O $HOME/.config/nvim/colors/wombat256mod.vim

# nvim python
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim

# install plugins
nvim +PlugInstall +qall

# compile tab completion
cd $HOME/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer
cd $my_dir

########################################
# tmux
########################################
# ctrl+A, I

########################################
# ipython
########################################
pip3 install jupyter_contrib_nbextensions
pip3 install --upgrade jupyterthemes

# install vim bindings
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding

# fix vimbindings to work with dark color scheme
cd vim_binding
ln -s $HOME/.config/ln/jupyter_vim_binding.css vim_bindings.css
cd $my_dir

# enable dark theme
jupyter nbextension enable vim_binding/vim_binding
jt -t onedork


