
# make sure the paths are the same as in .zshrc
export PYENV_ROOT="$HOME/.local/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-shared"

# install pyenv and set it to global:w
# curl https://pyenv.run | bash
git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.10.5
pyenv global 3.10.5
python -m pip install --upgrade pip

# all of thise packages are installed into the global pyenv
########################################
# scientific packages
########################################
pip install numpy matplotlib scipy pandas seaborn sklearn

########################################
# other
########################################
pip install pytest thefuck


########################################
# Upgrade pip
########################################
#pip install --upgrade pip
#pip3 install --upgrade pip


########################################
# powerline (tmux and zsh dependency)
########################################
if [[ $OS == "Linux" ]]; then
	sudo apt-get -y install powerline
fi
pip install --user powerline-status
