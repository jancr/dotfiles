OS=`uname -s`
export TERM=xterm-256color


# import zle and autojump before oh-my-zsh
zmodload zsh/zle
[ -f /usr/share/autojump/autojump.sh ] && source /usr/share/autojump/autojump.sh


################################################################################
# linuxbrew and oh-my-posh
################################################################################
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
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
# no training wheels!
################################################################################
setopt rm_star_silent

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
