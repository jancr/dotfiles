########################################
# vim / neovim
########################################

# make dirs
mkdir -p $HOME/.config/nvim/colors
mkdir -p $HOME/.config/nvim/sourceforge
mkdir -p $HOME/.local/share/nvim/swap
mkdir -p $HOME/.local/share/nvim/undo
mkdir -p $HOME/.local/share/nvim/backup
#wget http://www.vim.org/scripts/download_script.php?src_id=13400 -O $HOME/.config/nvim/colors/wombat256mod.vim

# nvim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		#
# download the newest version of neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage $HOME/.local/bin/nvim


# nvim python
pip2 install --user --upgrade neovim

# coc depends on a new version of node!
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
$HOME/.nvm/nvm.sh
nvm install node
nvm install --lts
nvm install 18.12.1
nvm use 18.12.1
npm install -g neovim

# install plugins
nvim --headless +PlugInstall +qall

## Manudal steps
# :CocInstall coc-pyright

# compile tab completion
# cd $HOME/.local/share/nvim/plugged/YouCompleteMe/
# python install.py --clang-completer
