#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit;

. ./mrT.cfg;

selectedFile=$(. ./chooseFile);
echo "my file ISSSSSSS: $selectedFile";

. ./select_libretro_core;
echo "SELECTED CORE: $libretroCore";

# echo "SELECTED FILE: $myFile"
# if [[ ${myFile##*. }= .7zip]]; then
# 	do
my7zip="$selectedFile";
echo "You selected this 7zip: $my7zip;"
. ./un7zip_goodmerge;
echo "You selected this file in the goodmerged 7zip: $pathToRom";
echo ""$retroarch" -- "$pathToRom" -L "$libretroCore"";
"$retroarch" -- "$pathToRom" -L "$libretroCore"; #TODO: remove $pathToRom from config
echo "current dir is" && pwd;
# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit




