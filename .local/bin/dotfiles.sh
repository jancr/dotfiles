#!/usr/bin/env bash

OS=`uname -s`
my_dir=`pwd`

########################################
# OS specific dependencies
########################################
if [ $1 -ne "--no-admin" ]; then
	if [ $OS = "Darwin" ]; then
		#install OSX dependencies
		brew install git curl tmux node cmake

		# iperl dependencies
		brew install zeromq libmagic
		
		# gnu tools:
		brew install coreutils
		brew tap homebrew/dupes 
		brew tap homebrew/science
		brew install transpose
		brew install binutils diffutils gawk wget gzip screen watch gnutls
		brew install ed --with-default-names
		brew install findutils --with-default-names
		brew install gnu-indent --with-default-names
		brew install gnu-sed --with-default-names
		brew install gnu-tar --with-default-names
		brew install gnu-which --with-default-names
		brew install grep --with-default-names
		brew install wdiff --with-gettext

		# other
		brew install jq

		# OSX specific stuff
		wget https://www.iterm2.com/utilities/imgcat -P ~/.local/bin
		chmod +x ~/.local/bin/imgcat
	elif [ $OS = "Linux" ]; then

		# asumes debian/ubuntu
		# install debian dependencies

		# dependencies
		sudo apt-get update
		# python 2
		sudo apt-get -y install python-ipython python-pip ipython-notebook

		# python 3
		sudo apt-get -y install python3-ipython python3-pip ipython-notebook

		#other
		sudo apt-get -y install git curl tmux nodejs cmake fonts-powerline nvim vim jq

		# dependencies for iperl
		sudo apt-get install libzmq3-dev libmagic-dev
		# debian specific stuff
	#else
		# cygwin
	fi;
fi;


########################################
# powerline (tmux and zsh dependency)
########################################
if [ $OS = "Linux"]; then
	sudo apt-get -y install powerline
fi
pip install --user powerline-status
pip3 install --user powerline-status

################################################################################
# Shells
################################################################################
mkdir -p $HOME/.config
touch $HOME/.config/zsh/extra.zsh
touch $HOME/.config/bash_extra.sh

########################################
# antigen (zsh extension manager)
########################################
curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > $HOME/.local/bin/antigen.zsh
# make file for system specific configuration
########################################
# bash_it (if no zsh is avalible)
########################################
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

if [ $OS = "Linux" ]; then
	bash-it enable alias apt 
elif [ $OS = "Darwin" ]; then
	bash-it search osx brew --enable
fi

########################################
# vim / neovim
########################################
#nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/nvim/colors
mkdir -p $HOME/.config/nvim/sourceforge
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo
mkdir -p $HOME/.local/share/nvim/backup
#wget http://www.vim.org/scripts/download_script.php?src_id=13400 -O $HOME/.config/nvim/colors/wombat256mod.vim

# nvim python
# pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim

# install plugins
nvim --headless +PlugInstall +qall

# compile tab completion
cd $HOME/.config/nvim/plugged/YouCompleteMe
# ./install.py --clang-completer
python3 install.py --clang-completer
cd $my_dir

########################################
# tmux
########################################
# cloning and crtl+A, Is now done from .tmux.conf itself
# ctrl+A, I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
mkdir -p $HOME/.config/tmux
touch $HOME/.config/tmux/local.conf

########################################
# jupyter (ipython and iperl)
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

# enable dark theme # and 100 cell width
jupyter nbextension enable vim_binding/vim_binding
jt -t onedork-f roboto -fs 12 -cellw 90%

####################
# iperl
git clone https://github.com/EntropyOrg/p5-Devel-IPerl.git $HOME/.local/p5-iperl
ln -s $HOME/local/p5-iperl/bin/iperl $HOME/.local/bin/iperl


########################################
# fpp
########################################
if [ $OS = "Darwin" ]; then
	brew install fpp
else; then
	cd $HOME/.local/
	git clone https://github.com/facebook/PathPicker.git
	cd PathPicker/
	ln -s "$(pwd)/fpp" $HOME/.local/bin/fpp
	cd $my_dir
fi;
########################################
# npm packages
########################################
# ubuntu and debian has node named nodejs, which makes some package fail as the
# node binary name is hardcoded
if which node; then; else
	ln -s `which nodejs` $HOME/.local/bin/node
fi

npm install -g gnomon
npm install -g markdown-pdf
npm install -g yarn
# npm install -g shellbridge
if [ $OS = "Darwin" ]; then
	iterm2-tab-set
fi;

# Other
########################################
# qfs (Quick Command-line File Completion)
git clone https://github.com/pindexis/qfc $HOME/.local/qfc/bin/qfs.sh

