

OS=`uname -s`
my_dir=`pwd`

#if [ $OS = "Darwin"]; then
	#install OSX dependencies

	# OSX specific stuff
#else; if [ $OS = "Linux" ]; then
	# install debian dependencies

	# debian specific stuff
#else;
	# cygwin
#fi;

# antigen
curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > $HOME/antigen.zsh

########################################
# vim / neovim
########################################
# vim
# install vundle, or change to vim-plug
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
#mkdir -p $HOME/.vim/colors
#mkdir -p $HOME/.vim/rc
#mkdir -p $HOME/.vim/swap
#mkdir -p $HOME/.vim/undo
#./install.py --clag-completer

#nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#mkdir -p $HOME/.config/nvim/rc
mkdir -p $HOME/.conf/nvim/colors
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo
mkdir -p $HOME/.local/share/nvim/backup
wget http://www.vim.org/scripts/download_script.php?src_id=13400 -O $HOME/.config/nvim/colors/wombat256mod.vim

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
# powerline install instructions?!?!
# ctrl+A, I

########################################
# Ipython
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
ln -s $HOME/.config/ln/jupyter_vim_bindings.css vim_bindings.css
cd $my_dir

# enable dark theme
jupyter nbextension enable vim_binding/vim_binding
jt -t onedork


