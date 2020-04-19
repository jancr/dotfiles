
# install pyenv and set it to global:w
curl https://pyenv.run | bash
pyenv install 3.7.5
pyenv global 3.7.5

# install virtual env and virtualenvwrapper
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper


# all of thise packages are installed into the global pyenv
########################################
# scientific packages
########################################
pip3 install numpy matplotlib scipy pandas seaborn sklearn

########################################
# other
########################################
pip3 install pytest thefuck


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
# pip install --user powerline-status
pip3 install --user powerline-status
