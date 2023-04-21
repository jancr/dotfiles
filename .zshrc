OS=`uname -s`
export TERM=xterm-256color


# import zle and autojump before oh-my-zsh
zmodload zsh/zle
[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh


################################################################################
# linuxbrew and oh-my-posh
################################################################################
# linuxbrew is installed normally
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
   	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
# linuxbrew is cloned because I do not have admin rights
elif [ -f $HOME/.linuxbrew/bin/brew ]; then
   	eval "$($HOME/.linuxbrew/bin/brew shellenv)" 
elif command -v oh-my-posh &> /dev/null; then
	# oh my posh is installed elsewere
else
	echo "Homebrew is not installed, this will make oh-my-posh fail :*"
fi

# oh-my-posh is installed by linux brew and thus needs to be invoked later
eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/.posh.omp.json)"

################################################################################
# oh-my-zsh // antigen 
################################################################################
source ~/.local/bin/antigen.zsh
source ~/.config/zsh/antigen.zsh
antigen apply

# Enables terminal application mode and updates editor information.
zle -N zle-line-init

# this is set such that z works on windows linux subsystem
setopt nobgnice


################################################################################
# mangle PATHS
################################################################################
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"


################################################################################
# pyenv
################################################################################
source $HOME/.config/zsh/pyenv.zsh 


################################################################################
# source sub configs
################################################################################
[ -f $HOME/.local/qfc/bin/qfc.sh ] && source $HOME/.local/qfc/bin/qfc.sh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/vim.zsh
source $HOME/.config/zsh/utf8.zsh

# History settings
export HISTFILE=~/.history
export HIST_STAMPS="dd/mm/yyyy"
setopt EXTENDED_HISTORY     # store date in .history
export SAVEHIST=9999999     # number of lines to save
export HISTSIZE=$SAVEHIST   # number of lines from .history to read in at start of new shell
setopt HIST_IGNORE_ALL_DUPS # history is de-duped
#setopt INC_APPEND_HISTORY  # append as we execute, not when we leave the shell
#setopt SHARE_HISTORY       # share one history between all open shells

# enable **/file expansion, negation [^ab]*, and more
setopt EXTENDED_GLOB


################################################################################
# other 
################################################################################
setopt rm_star_silent
# make gir read ~/.ssh/config
export GIT_SSH_COMMAND="ssh"

################################################################################
export DISABLE_AUTO_TITLE="true" 

# if you do not have admin rights, then change defaults to local install
if groups | egrep "admin|sudo" > /dev/null; then; else
	source $HOME/.config/zsh/no_admin.zsh
fi

# source local server settings last so it can overwrite defaults
[ -f $HOME/.config/zsh/extra.zsh ] && source $HOME/.config/zsh/extra.zsh

# force spark to use python3!
export PYSPARK_PYTHON=python3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
