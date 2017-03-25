
################################################################################
# vim 
################################################################################
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

