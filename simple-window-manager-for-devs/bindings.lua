local hs = hs
local config = require("wm.config")
local window = require("wm.window")
local screen = require("wm.screen")
local layout = require("wm.layout")

local M = {}

local mash = config.mash
local shift_mash = {"cmd", "alt", "ctrl", "shift"}

function M.init()
    -- Reload Config
    hs.hotkey.bind(mash, "R", function()
        hs.reload()
    end)

    -- Window Manipulation (Halves)
    hs.hotkey.bind(mash, "Left", window.left)
    hs.hotkey.bind(mash, "Right", window.right)
    hs.hotkey.bind(mash, "Up", window.top)
    hs.hotkey.bind(mash, "Down", window.bottom)

    -- Quadrants
    hs.hotkey.bind(mash, "U", window.topLeft)
    hs.hotkey.bind(mash, "I", window.topRight)
    hs.hotkey.bind(mash, "J", window.bottomLeft)
    hs.hotkey.bind(mash, "K", window.bottomRight)

    -- Maximize & Center
    hs.hotkey.bind(mash, "M", window.maximize)
    hs.hotkey.bind(mash, "C", window.center)
    
    -- Cycle Width
    hs.hotkey.bind(mash, "=", window.cycleWidth)

    -- Multi-Monitor
    hs.hotkey.bind(shift_mash, "Left", screen.moveToPrevScreen)
    hs.hotkey.bind(shift_mash, "Right", screen.moveToNextScreen)

    -- Layouts
    hs.hotkey.bind(mash, "1", function() layout.apply("Coding") end)
    hs.hotkey.bind(mash, "2", function() layout.apply("Debugging") end)
    hs.hotkey.bind(mash, "3", function() layout.apply("Research") end)
    hs.hotkey.bind(mash, "4", function() layout.apply("Meeting") end)

    hs.alert.show("WM Bindings Loaded")
end

return M
