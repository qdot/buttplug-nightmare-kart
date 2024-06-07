# buttplug.io mod for Nightmare Kart

Not done yet but I'm busy this weekend so here's the code.

Install instructions:

- Install ue4ss
- Make a `ButtplugNMKart/Scripts` directory tree under mods
- Put `main.lua` in the Scripts directory
- Compile buttplug-mlua, copy resulting DLL to Scripts directory
- Copy `lua54.dll` (You'll have to get this yourself) into the **BASE GAME BINARY DIRECTORY**. It
  must be in the DLL search path for the process, not in the scripts directory!
- The mod currently has no reconnect logic, so Intiface Central must be up when running the mod.