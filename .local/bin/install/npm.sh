OS=`uname -s`
########################################
# npm packages
########################################
# ubuntu and debian has node named nodejs, which makes some package fail as the
# node binary name is hardcoded
# if which node; then; else
	# ln -s `which nodejs` $HOME/.local/bin/node
# fi

sudo npm install -g gnomon
sudo npm install -g markdown-pdf
sudo npm install -g yarn
# npm install -g shellbridge
if [[ $OS == "Darwin" ]]; then
	iterm2-tab-set
fi;
