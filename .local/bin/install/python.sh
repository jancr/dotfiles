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
pip install --user powerline-status
pip3 install --user powerline-status


