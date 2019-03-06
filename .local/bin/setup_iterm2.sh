#!/usr/bin/env bash

# terminal agnostic version of tabset --title localhost
#echo -ne "\033]0;localhost\007"
tabset --title localhost
# I do not know of a terminal agnostic equivalent of --color :(
tabset --color gray

# kinit if nessesary
kticket=`klist | grep Issued -A 1000 | grep  INTOMICS | grep -v Expired`
if [[ -z $kticket ]]; then
	kinit jcr@INTOMICS.COM
fi

# connect ipython to hydra
ssh -N -L 8888:localhost:8888 jcr@hydra &


osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down'  
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --title hydra"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --color green"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "ssh -Y hydra"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tmux attach"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'

osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --title other"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --color yellow"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'

osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to keystroke "1" using command down' 

#osascript -e 'tell application "Tunnelblick" connect "Intomics VPN"'

# open tmux and kill the new session
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tmux attach"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "a" using controll down' 
# sleep 0.5
# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "X" 
# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "y"
# if [ $# -ne 0 ]; then
	# # switch to session $1
	# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "a" using controll down' 
	# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "g" -e 'tell application "System Events" to tell process "iTerm" to key code 52'
	# osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "$1" -e 'tell application "System Events" to tell process "iTerm" to key code 52'
# fi
# 
