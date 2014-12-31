#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit;

. ./mrT.cfg;

. ./select_libretro_core;
echo "SELECTED CORE: $libretroCore";

. ./un7zip_goodmerge;

"$retroarch" -- "$pathToRom" -L "$libretroCore";

# http://stackoverflow.com/questions/8798641/close-terminal-window-from-within-shell-script-unix
# http://stackoverflow.com/questions/5560167/how-should-i-properly-exit-terminal-using-a-terminal-command-on-mac-os-x
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit




