#!/usr/bin/env bash
tabset --title localhost

# kinit if nessesary
kticket=`klist | grep Issued -A 1000 | grep  INTOMICS | grep -v Expired`
if [[ -z $kticket ]]; then
	kinit jcr@INTOMICS.COM
fi

osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down'  
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --title hydra"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "ssh -Y hydra.intomics.com"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tmux attach -t peptidomics"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'

osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tabset --title other"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'

osascript -e 'tell application "iTerm" to activate' 
osascript -e 'tell application "System Events" to keystroke "1" using command down' 
if [ $# -eq 0 ]; then
	osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "tmux"' -e 'tell application "System Events" to tell process "iTerm" to key code 52'
else
	osascript -e "tell application "System Events" to tell process "iTerm" to keystroke 'tmux attach -s $1'" -e 'tell application "System Events" to tell process "iTerm" to key code 52'
fi
# open tmux and kill the new session
sleep 2 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "a" using controll down' 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "X" 
osascript -e 'tell application "System Events" to tell process "iTerm" to keystroke "y"
