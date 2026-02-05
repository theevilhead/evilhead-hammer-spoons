# Developer Window Manager - Users Guide

I have installed a modular, high-performance window manager in `~/.hammerspoon/`.

## 🚀 Setup & Usage

1. **Reload Config**: Press `Cmd + Alt + Ctrl + R` to load the new configuration.
2. **Key Bindings**: The main modifier key is "Mash": `Cmd + Alt + Ctrl`.

### 🪟 Window Management

| Action | Shortcut |
|--------|----------|
| **Left / Right Half** | `Mash + ←` / `→` |
| **Top / Bottom Half** | `Mash + ↑` / `↓` |
| **Top Left / Right (Quadrant)** | `Mash + U` / `I` |
| **Bottom Left / Right (Quadrant)** | `Mash + J` / `K` |
| **Maximize** | `Mash + M` |
| **Center (Focus Mode)** | `Mash + C` |
| **Cycle Width (30% → 50% → 70%)** | `Mash + =` |

### 🖥 Multi-Monitor

| Action | Shortcut |
|--------|----------|
| **Move to Prev/Next Monitor** | `Mash + Shift + ←` / `→` |

### 📐 Layouts

| Layout | Shortcut | Description |
|--------|----------|-------------|
| **Coding** | `Mash + 1` | VS Code Left (70%), Terminal Right (30%) |
| **Debugging** | `Mash + 2` | VS Code Left, Browser Top-Right, Terminal Bot-Right |
| **Research** | `Mash + 3` | Browser Main (70%), Notes Side |
| **Meeting** | `Mash + 4` | Zoom/Teams Center, Notes Side |

## 🛠 Extension Guide

### Adding a New Layout

Edit `~/.hammerspoon/wm/layout.lua`:

```lua
M.layouts.MyNewLayout = {
    { app = "Spotify", x = 0, y = 0, w = 0.5, h = 1 },
    { app = "Slack", x = 0.5, y = 0, w = 0.5, h = 1 }
}
```

Then bind it in `~/.hammerspoon/wm/bindings.lua`:

```lua
hs.hotkey.bind(mash, "5", function() layout.apply("MyNewLayout") end)
```

### Changing Modifiers

Edit `~/.hammerspoon/wm/config.lua`:

```lua
M.mash = {"cmd", "alt", "ctrl"} -- Change to your preference
```
