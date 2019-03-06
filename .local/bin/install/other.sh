####################
# iperl
if [[ "$OS" != "Linix" ]]; then
	git clone https://github.com/EntropyOrg/p5-Devel-IPerl.git $HOME/.local/p5-iperl
	ln -s $HOME/local/p5-iperl/bin/iperl $HOME/.local/bin/iperl
fi

########################################
# fpp
########################################
if [[ $OS == "Darwin" ]]; then
	brew install fpp
else
	cd $HOME/.local/
	git clone https://github.com/facebook/PathPicker.git
	cd PathPicker/
	ln -s "$(pwd)/fpp" $HOME/.local/bin/fpp
	cd $my_dir
fi;

# Other
########################################
# qfs (Quick Command-line File Completion)
git clone https://github.com/pindexis/qfc $HOME/.local/qfc/bin/qfs.sh
