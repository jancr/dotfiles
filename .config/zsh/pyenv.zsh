export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.local/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export QT_QPA_PLATFORM='offscreen'
export PYTHON_CONFIGURE_OPTS="--enable-shared"
if type pyenv &> /dev/null; then
	if [ -f $HOME/.config/zsh/pyenv_extra.zsh ]; then
		# create this script if you do not want 3.10.5 as default
		source $HOME/.config/zsh/pyenv_extra.zsh 
	else
		eval "$(pyenv init -)"
		pyenv global 3.10.5
		eval "$(pyenv virtualenv-init -)"
	fi

	eval "$(pyenv init -)"
	pyenv global system
	eval "$(pyenv virtualenv-init -)"
fi
