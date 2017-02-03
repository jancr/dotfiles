# Licensed CC Attribution -- you are free to use, share, modify this configuration, but please attribute
# Jan Christians Refsgaards .zshrc, originally inspired by Helen Cooks awesome zsh

#
OS=`uname -s`
export TERM=xterm-256color
################################################################################
# antibody // oh-my-zsh // antigen // zgen
################################################################################
# use antibidy for some stuff because it is faster
# antibody bundle < ~/.zsh/antibody.plugins >> ~/.zsh/antibody.sources

# and antibody for the rest
source ~/bin/antigen.zsh
#antigen init ~/.zsh/.antogenrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle pip
antigen bundle command-not-found
antigen bundle autojump
antigen bundle brew
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
export PATH=$PATH:~/bin
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
# zsh vim mode is messed up, so we fix that
bindkey '^R' history-incremental-search-backward
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" backward-kill-line  

################################################################################
# Aliases and mappings

alias chrome=google-chrome
# TODO alias and completion for the alias
alias t="todo.sh"

############################################################
# distribution specific
############################################################
if [ $OS = "Darwin" ]; then
	alias c="pbcopy"
	alias v="pbpaste"
else;
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
# stuff added by homebrew or because of homebrew
################################################################################
if [ $OS = "Darwin" ]; then
	#unalias run-help
	autoload run-help
	HELPDIR=/usr/local/share/zsh/help

	export PERL5LIB="/usr/local/Cellar/perl/5.24.0_1/lib/perl5/5.24.0/darwin-thread-multi-2level/"
	export PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
	export PERL_MB_OPT="--install_base \"${PERL5LIB}\"";
	export PERL_MM_OPT="INSTALL_BASE=${PERL5LIB}"


	# add node packages to path
	export PATH="$PATH:/usr/local/Cellar/node/6.6.0/libexec/npm/bin/"
	export PATH="/usr/local/sbin:$PATH"
else;

fi;



#
