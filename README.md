# My Hammerspoon Spoons

A collection of custom Spoons for [Hammerspoon](https://www.hammerspoon.org/).

## Spoons

| Spoon | Description |
|-------|-------------|
| [SimpleWindowManager](SimpleWindowManager.spoon) | A modular, high-performance window manager with tiling, layouts, and multi-monitor support. |

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/hammerspoon-spoons.git
   ```

2. Symlink the spoon you want to use into your Hammerspoon Spoons directory:

   ```bash
   ln -s $(pwd)/SimpleWindowManager.spoon ~/.hammerspoon/Spoons/
   ```

3. Configure it in your `~/.hammerspoon/init.lua`:

   ```lua
   -- Load the SimpleWindowManager Spoon
   hs.loadSpoon("SimpleWindowManager")

   -- Bind default hotkeys (Cmd+Alt+Ctrl + arrows/etc)
   spoon.SimpleWindowManager:bindHotkeys()

   -- Start the manager
   spoon.SimpleWindowManager:start()
   ```

## Usage

See the README in each Spoon directory for specific usage instructions.
