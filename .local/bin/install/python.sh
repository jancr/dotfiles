########################################
# Upgrade pip
########################################
pip install --upgrade pip
pip3 install --upgrade pip

pip3 install thefuck

########################################
# powerline (tmux and zsh dependency)
########################################
if [[ $OS == "Linux" ]]; then
	sudo apt-get -y install powerline
fi
pip install --user powerline-status
pip3 install --user powerline-status
