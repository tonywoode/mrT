MrT - a meta multisystem retro-game archive runner
==================================================

An archive-compatible runner for multi-system emulators supporting RetroArch and Libretro on OSX, that aspires to platform independence

## What does that mean?

It means you can choose to run emulator roms and other games on multiple emulators from a single standard system, even if the roms live compressed in an archive.  Designed to be compatible with GoodTool’s GoodMerge format, as well as any generally compressed file sets

## But why?

Multi-system emulator frontends have historically been too (Windows) platform-dependent, however platform-independent multi-system emulators exist such as the RetroArch frontend to the Libretro Core system. RetroArch is a great platform independent frontend, however its GUI is designed for the casual gamer: it has to cater its interface generically - for use on devices such as htpcs or tablets. This tool caters for the retro-gaming enthusiast, who probably uses a laptop or desktop pc and its keyboard (or a keyboard to joypad mapper), stores their games (with hashes checked against some tool format) in archives, and wishes to automate certain standardisation procedures (like the location of their save game and emulator configuration folders)

## What’s the current state of the project?

Currently functions as a standalone command-line runner utilising RetroArch on OSX (though porting to Linux should prove trivial)

## Tell me more about RetroArch and Libretro?

The Libretro Core system uses Cores as Facades: Emulators that don’t share any implementation or configuration are packaged so they can present a standard API, which can be run by code capable of running such Cores. Libretro Cores are conceptually similar to Docker’s containers in that deployment and configuration can be simplified and standardised whilst keeping implementation separated

## How do I install this?

On OSX, first have a standalone RetroArch installation (including cores) anywhere on your filesystem . Provide the path to that installation in mrT.cfg, along with paths such as the temp directory to use for unarchiving files (which for your convenience you might want in mrT’s own dir)

## How do I use this?

On OSX, Run up osx.command, which will prompt you to first navigate to a file. If its an archive file you can choose what is unarchived and what is run. Then choose a Core to run it with. Then look to RetroArch’s own config for playing games etc (on OSX find in
~/Library/Application Support/RetroArch/retroarch.cfg)

## License

Distributed under the BSD-3 License - see Package/bsd.txt