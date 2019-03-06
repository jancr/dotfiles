OS=`uname -s`
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
if [[ $OS == "Darwin" ]]; then
	iterm2-tab-set
fi;
