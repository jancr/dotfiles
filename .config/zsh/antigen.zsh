# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle vi-mode
antigen bundle git
antigen bundle thefuck
antigen bundle pip
antigen bundle command-not-found
antigen bundle autojump
antigen bundle compleat
antigen bundle z

# antigen bundle docker
#antigen bundle npm
#antigen bundle pyenv
#antigen bundle yarn
#antigen bundle cargo

# Load bundles from external repos
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle tarruda/zsh-autosuggestions
#antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
#
