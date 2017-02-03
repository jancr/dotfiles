

OS=`uname -s`
my_dir=`pwd`

if [ $OS = "Darwin"]; then
	#install OSX dependencies

	# OSX specific stuff
else; if [ $OS = "Linux" ]; then
	# install debian dependencies

	# debian specific stuff
else;
	# cygwin
fi;


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
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo
mkdir -p $HOME/.local/share/nvim/backup

nvim +PlugInstall +qall
cd $HOME/.config/nvim/plugged/YouCompleteMe
./install.py --clag-completer
cd $my_dir

########################################
# tmux
########################################

