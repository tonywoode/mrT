#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit;

. mrT.cfg;

selectedFile=$(. chooseFile);
echo "Selected File: $selectedFile";

# TODO: we need to check if its a 7zip and if it is pass to goodmerge
# echo "SELECTED FILE: $myFile"
# if [[ ${myFile##*. }= .7zip]]; then

my7zip="$selectedFile";
echo "You selected this 7zip: $my7zip;"
. un7zip_goodmerge;
echo "Running this rom: $pathToRom";

. select_libretro_core;
echo "Selected Core: $libretroCore";

retroarchCall() {
	"$retroarch" -- "$pathToRom" -L "$libretroCore";
}
if retroarchCall; then

# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit
fi;
echo "I DO APOLOGISE, BUT SOMETHING WENT WRONG";
echo "I called this command:"
echo "\"$retroarch\" -- \"$pathToRom\" -L \"$libretroCore\"";


