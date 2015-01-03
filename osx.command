#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

chooseFile() {
	osascript -e 'tell application (path to frontmost application as text)
	set myFile to choose file
	POSIX path of myFile
	end'
}

platformExit() {
	osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
	exit
}

. runner

