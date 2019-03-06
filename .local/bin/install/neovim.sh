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
