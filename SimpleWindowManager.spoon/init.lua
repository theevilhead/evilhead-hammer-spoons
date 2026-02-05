local obj = {}
obj.name = "SimpleWindowManager"
obj.version = "1.0"
obj.author = "User"
obj.license = "MIT"
obj.homepage = "https://github.com/myuser/SimpleWindowManager.spoon"

obj.spoonPath = hs.spoons.scriptPath()

local function load_internal(name)
    local f = dofile(obj.spoonPath .. name .. ".lua")
    package.loaded["SimpleWindowManager." .. name] = f
    return f
end

-- Load dependencies (Order matters for internal requires)
local config = load_internal("config")
local window = load_internal("window") -- requires SimpleWindowManager.config
local screen = load_internal("screen")
local layout = load_internal("layout") -- requires SimpleWindowManager.window

-- Expose modules if needed
obj.config = config
obj.window = window
obj.screen = screen
obj.layout = layout

-- Default mapping
obj.defaultHotkeys = {
    reload = {config.mash, "R"},
    left = {config.mash, "Left"},
    right = {config.mash, "Right"},
    top = {config.mash, "Up"},
    bottom = {config.mash, "Down"},
    topLeft = {config.mash, "U"},
    topRight = {config.mash, "I"},
    bottomLeft = {config.mash, "J"},
    bottomRight = {config.mash, "K"},
    maximize = {config.mash, "M"},
    center = {config.mash, "C"},
    cycleWidth = {config.mash, "="},
    prevScreen = {{"cmd", "alt", "ctrl", "shift"}, "Left"},
    nextScreen = {{"cmd", "alt", "ctrl", "shift"}, "Right"},
    layoutCoding = {config.mash, "1"},
    layoutDebugging = {config.mash, "2"},
    layoutResearch = {config.mash, "3"},
    layoutMeeting = {config.mash, "4"},
}

function obj:bindHotkeys(mapping)
    local def = self.defaultHotkeys
    local map = mapping or def
    
    -- Helper to bind if mapped
    local function bind(name, fn)
        if map[name] then
            hs.hotkey.bind(map[name][1], map[name][2], fn)
        end
    end

    bind("reload", hs.reload)
    
    bind("left", window.left)
    bind("right", window.right)
    bind("top", window.top)
    bind("bottom", window.bottom)
    
    bind("topLeft", window.topLeft)
    bind("topRight", window.topRight)
    bind("bottomLeft", window.bottomLeft)
    bind("bottomRight", window.bottomRight)
    
    bind("maximize", window.maximize)
    bind("center", window.center)
    bind("cycleWidth", window.cycleWidth)
    
    bind("prevScreen", screen.moveToPrevScreen)
    bind("nextScreen", screen.moveToNextScreen)
    
    bind("layoutCoding", function() layout.apply("Coding") end)
    bind("layoutDebugging", function() layout.apply("Debugging") end)
    bind("layoutResearch", function() layout.apply("Research") end)
    bind("layoutMeeting", function() layout.apply("Meeting") end)

    hs.alert.show("SimpleWindowManager Spoon Loaded")
end

-- Standard start method - optional but good practice
function obj:start()
    -- If the user didn't call bindHotkeys, we don't bind automatically to avoid conflicts?
    -- Spoons usually require explicit bindHotkeys.
    -- But for backward compatibility with the user's workflow, I will leave it to them to call bindHotkeys.
    return self
end

return obj
