OS=`uname -s`
#
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle vi-mode
# antigen bundle thefuck
antigen bundle pip
antigen bundle command-not-found
antigen bundle autojump
antigen bundle compleat
antigen bundle npm
antigen bundle z

# new copied from Christian Ravn
antigen bundle git
antigen bundle pyenv
antigen bundle pip
antigen bundle yarn
antigen bundle cargo

if [[ $OS == "Darwin" ]]; then
	antigen bundle osx
	antigen bundle iterm2
fi
#antigen bundle fasd

# other repos
antigen bundle tarruda/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting 
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
