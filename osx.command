#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

chooseFile() {
	osascript -e 'tell application (path to frontmost application as text)
	set myFile to choose file
	POSIX path of myFile
	end'
}

# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
	# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
	
platformExit() {
	osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
	exit
}

. runner

