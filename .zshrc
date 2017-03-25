 
# Jan Christians Refsgaards .zshrc, originally inspired by Helen Cooks awesome zsh

OS=`uname -s`
export TERM=xterm-256color
################################################################################
# antibody // oh-my-zsh // antigen // zgen
################################################################################
# use antibidy for some stuff because it is faster
# antibody bundle < ~/.zsh/antibody.plugins >> ~/.zsh/antibody.sources

# import zle before oh-my-zsh
zmodload zsh/zle

# and antibody for the rest
source ~/.local/bin/antigen.zsh
#antigen init ~/.zsh/.antogenrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle vi-mode
antigen bundle pip
antigen bundle command-not-found
antigen bundle autojump
antigen bundle compleat
antigen bundle npm
antigen bundle z

# other repos
antigen bundle tarruda/zsh-autosuggestions
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

antigen apply

# Enables terminal application mode and updates editor information.
zle -N zle-line-init

################################################################################
export PYTHONPATH=~/Projects/python_modules
export PATH="$HOME/bin:$PATH:$HOME/.local/bin"
[ -f $HOME/.config/zsh_extra ] && source $HOME/.config/zsh_extra
[ -f $HOME/.local/qfc/bin/qfc.sh ] && source $HOME/.local/qfc/bin/qfc.sh


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
# vim 
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -M vicmd v edit-command-line
export KEYTIMEOUT=1 # wait 0.1 sek after escape is clicked for input (default 0.4)

# undo the things from vi-mode.plugin.zsh that does not work with bullet train
export RPS1=""
function vi_mode_prompt() {
	# echo "${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
	case $KEYMAP in
		vicmd) 
			# export BULLETTRAIN_CUSTOM_BG='black'
			echo "NORMAL";;
		viins|main)
			# export BULLETTRAIN_CUSTOM_BG='yellow'
			echo "INSERT";;
	esac
	echo "${${KEYMAP/vicmd/$VI_MODE}/(main|viins)/}"
}

export BULLETTRAIN_CUSTOM_BG='yellow'
export BULLETTRAIN_CUSTOM_FG='black'
export BULLETTRAIN_CUSTOM_MSG='$(vi_mode_prompt)'

################################################################################
# Aliases and mappings
if [ $+commands[nvim] ]; then
	export EDITOR=`which nvim`
	alias vim='nvim';
else
	export EDITOR=`which vim`
fi;

alias chrome=google-chrome
# TODO alias and completion for the alias
alias t="todo.sh"

############################################################
# distribution specific
############################################################
if [ $OS = "Darwin" ]; then
	alias c="pbcopy"
	alias v="pbpaste"
	alias excel='/Applications/Microsoft Excel.app'
	alias word='/Applications/Microsoft Word.app'
	alias powerpoint='/Applications/Microsoft PowerPoint.app'
	export PATH="$PATH:/$HOME/Library/Python/2.7/bin"
	export PATH="$PATH:/$HOME/Library/Python/3.6/bin"
	# compdef excel='open'
	# compdef word='open'
	# compdef powerpoint='open'
elif [ $OS = "Linux" ]; then
	alias node="nodejs"
	alias c="xclip -selection clipboard"
	alias v="xclip -selection clipboard -o"
fi


################################################################################
# UTF-8
################################################################################
export LANG="en_US.UTF-8"  
export LC_COLLATE="en_US.UTF-8"  
export LC_CTYPE="en_US.UTF-8"  
export LC_MESSAGES="en_US.UTF-8"  
export LC_MONETARY="en_US.UTF-8"  
export LC_NUMERIC="en_US.UTF-8"  
export LC_TIME="en_US.UTF-8"  
export LC_ALL="en_US.UTF-8"  

################################################################################
# functions
################################################################################
# makes ztrl go back to vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


################################################################################
# no training wheels!
################################################################################
setopt rm_star_silent

################################################################################
# stuff added by homebrew or because of homebrew
################################################################################
if [ $OS = "Darwin" ]; then
	#unalias run-help
	autoload run-help
	HELPDIR=/usr/local/share/zsh/help

	export PERL5LIB="/usr/local/Cellar/perl/5.24.1/lib"
	export PERL_MB_OPT='--install_base "/usr/local/Cellar/perl/5.24.0_1/lib/perl5/5.24.1/darwin-thread-multi-2level/"'
	export PERL_MM_OPT="INSTALL_BASE=/usr/local/Cellar/perl/5.24.1/lib/perl5/5.24.1/darwin-thread-multi-2level/"
	# add node packages to path
	export PATH="$PATH:/usr/local/Cellar/node/6.6.0/libexec/npm/bin/"
	export PATH="/usr/local/sbin:$PATH"

#else;
fi;


################################################################################
# extra rc file that is 'server specific and not part of the yadm repository
if [[ -a $HOME/.config/zshrc_extra.sh ]]; then
	source $HOME/.config/zshrc_extra.sh
fi

export DISABLE_AUTO_TITLE="true" 

