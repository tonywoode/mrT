#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit;

. mrT.cfg;

selectedFile=$(. chooseFile);
echo "Selected File: $selectedFile";

. select_libretro_core;
echo "Selected Core: $libretroCore";

# TODO: we need to check if its a 7zip and if it is pass to goodmerge
# echo "SELECTED FILE: $myFile"
# if [[ ${myFile##*. }= .7zip]]; then
# 	do
my7zip="$selectedFile";
echo "You selected this 7zip: $my7zip;"
. un7zip_goodmerge;
echo "Running this rom: $pathToRom";
"$retroarch" -- "$pathToRom" -L "$libretroCore";

# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit




