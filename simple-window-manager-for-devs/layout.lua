local window = require("wm.window")
local M = {}

-- Layout Definitions
M.layouts = {
    Coding = {
        -- Editor (VS Code) Left 70%
        { app = "Code", role = "main", x = 0, y = 0, w = 0.7, h = 1 },
        { app = "Visual Studio Code", role = "main", x = 0, y = 0, w = 0.7, h = 1 },
        -- Terminal Right 30%
        { app = "iTerm2", role = "side", x = 0.7, y = 0, w = 0.3, h = 1 },
        { app = "Terminal", role = "side", x = 0.7, y = 0, w = 0.3, h = 1 },
    },
    Debugging = {
        -- Editor Left 50%
        { app = "Code", x = 0, y = 0, w = 0.5, h = 1 },
        { app = "Visual Studio Code", x = 0, y = 0, w = 0.5, h = 1 },
        -- Browser Top Right
        { app = "Google Chrome", x = 0.5, y = 0, w = 0.5, h = 0.5 },
        { app = "Safari", x = 0.5, y = 0, w = 0.5, h = 0.5 },
        { app = "Arc", x = 0.5, y = 0, w = 0.5, h = 0.5 },
        -- Terminal Bottom Right
        { app = "iTerm2", x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
    },
    Research = {
        -- Browser uses most space
        { app = "Google Chrome", x = 0, y = 0, w = 0.7, h = 1 },
        { app = "Safari", x = 0, y = 0, w = 0.7, h = 1 },
        { app = "Arc", x = 0, y = 0, w = 0.7, h = 1 },
        -- Notes side
        { app = "Obsidian", x = 0.7, y = 0, w = 0.3, h = 1 },
        { app = "Notes", x = 0.7, y = 0, w = 0.3, h = 1 },
    },
    Meeting = {
        -- Video App Centered
        { app = "Zoom", centered = true },
        { app = "Microsoft Teams", centered = true },
        -- Notes Side
        { app = "Obsidian", x = 0.7, y = 0, w = 0.3, h = 1 },
    }
}

function M.apply(layoutName)
    local rules = M.layouts[layoutName]
    if not rules then 
        hs.alert.show("Layout not found: " .. layoutName)
        return 
    end

    hs.alert.show("Applying " .. layoutName .. " Layout")

    for _, rule in ipairs(rules) do
        local app = hs.application.get(rule.app)
        if app then
            local wins = app:visibleWindows()
            -- For simplicity, take the first window. 
            -- A more complex engine might match titles or roles.
            local win = wins[1]
            
            if win then
                if rule.centered then
                    -- Use window.lua center function or manual center
                    window.center() -- Note: window.center() operates on focused window. We need to focus this win or pass win to a modified center.
                    -- window.center() in wm/window.lua calls getWin() matching focusedWindow().
                    -- We should update window.lua to accept an optional window arg or set focus.
                    
                    -- Let's set focus then center, or manually center here.
                    -- Setting focus is disruptive. Let's manually resize.
                    local f = win:frame()
                    local screen = win:screen()
                    local max = screen:frame()
                    f.w = max.w * 0.8
                    f.h = max.h * 0.8
                    f.x = max.x + (max.w * 0.1)
                    f.y = max.y + (max.h * 0.1)
                    win:setFrame(f)
                else
                    window.setRelativeFrame(win, rule.x, rule.y, rule.w, rule.h)
                end
            end
        end
    end
end

return M
