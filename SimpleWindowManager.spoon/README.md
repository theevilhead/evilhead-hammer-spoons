# SimpleWindowManager Spoon

A modular, high-performance window manager for Hammerspoon, designed for developers.

## Features

- **Window Management**: Halves, Quadrants, Maximize, Center.
- **Multi-Monitor**: Move windows between screens easily.
- **Layouts**: Pre-defined window layouts for Coding, Research, Meetings, etc.
- **Customizable**: Configurable keybindings and layouts.

## Installation

1. Download distribution or clone this repository.
2. Double click `SimpleWindowManager.spoon` to install it (if supported) or manually move it to `~/.hammerspoon/Spoons/`.

## Usage

Load the spoon in your `~/.hammerspoon/init.lua`:

```lua
hs.loadSpoon("SimpleWindowManager")
spoon.SimpleWindowManager:bindHotkeys()
-- Or with custom mapping:
-- spoon.SimpleWindowManager:bindHotkeys({
--   left = {{"cmd", "alt", "ctrl"}, "Left"},
--   ...
-- })
spoon.SimpleWindowManager:start()
```

## Default Key Bindings

Modifier: `Cmd + Alt + Ctrl` (Mash)

### Window Movement

- **Left/Right**: `Mash + Left/Right`
- **Top/Bottom**: `Mash + Up/Down`
- **Quadrants**: `Mash + U/I/J/K`
- **Maximize**: `Mash + M`
- **Center**: `Mash + C`
- **Cycle Width**: `Mash + =`

### Multi-Monitor

- **Move to Next Screen**: `Cmd + Alt + Ctrl + Shift + Right`
- **Move to Prev Screen**: `Cmd + Alt + Ctrl + Shift + Left`

### Layouts

- **Coding**: `Mash + 1`
- **Debugging**: `Mash + 2`
- **Research**: `Mash + 3`
- **Meeting**: `Mash + 4`

## Customization

You can override the default configuration by modifying `config.lua` or passing settings (if supported in future versions).
Currently, layouts are defined in `layout.lua`.

## License

MIT
