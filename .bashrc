##!/usr/bin/env bash
OS=`uname -s`
export TERM=xterm-256color
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

################################################################################
# linuxbrew and oh-my-posh
################################################################################
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
eval "$(oh-my-posh --init --shell bash --config $HOME/.config/.posh.omp.json)"

################################################################################
# pyenv
################################################################################
source $HOME/.config/zsh/pyenv.zsh 

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
