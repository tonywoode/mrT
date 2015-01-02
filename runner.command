#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

. mrT.cfg

selectedFile=$(. chooseFile)
echo "Selected File: $selectedFile"

chooseToUncompress() {
	echo "And are we going to uncompress this file before passing to the emulator?"
	read cf 										
	cf=$(echo $cf | tr "[:upper:]" "[:lower:"])		# all lowercase
	if [[ "$cf" == "y" ]]; then						
		my7zip="$selectedFile"
		echo "You selected this 7zip: $my7zip;"
		. un7zip_goodmerge
		echo "Running this rom: $pathToRom"
	fi
	if [[ "$cf" == "n" ]]; then	 
		pathToRom="$selectedFile" # If we aren't extracting pass directly to emu, don't bother with temp dir 
	fi
	if [[ "$cf" != "n" ]]; then	 
		echo "Please respond with a [y/n]: "
		getConfirm
	fi 
} 	

chooseToUncompress

. select_libretro_core;
echo "Selected Core: $libretroCore"

retroarchCall() {
	"$retroarch" -- "$pathToRom" -L "$libretroCore"
}
if retroarchCall; then

# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit
fi
echo "Can't start the emulator, sorry. I called this command:"
echo "\"$retroarch\" -- \"$pathToRom\" -L \"$libretroCore\""


