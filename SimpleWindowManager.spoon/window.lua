local config = require("SimpleWindowManager.config")
local M = {}

-- Disable animations globally based on config
hs.window.animationDuration = config.animationDuration

-- Helper to get focused window
local function getWin()
    return hs.window.focusedWindow()
end

-- Helper to set frame based on relative coordinates
-- x, y, w, h are multipliers of screen size (0.0 to 1.0)
function M.setRelativeFrame(win, x, y, w, h)
    if not win then return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * x)
    f.y = max.y + (max.h * y)
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f)
end

-- Halves
function M.left() M.setRelativeFrame(getWin(), 0, 0, 0.5, 1) end
function M.right() M.setRelativeFrame(getWin(), 0.5, 0, 0.5, 1) end
function M.top() M.setRelativeFrame(getWin(), 0, 0, 1, 0.5) end
function M.bottom() M.setRelativeFrame(getWin(), 0, 0.5, 1, 0.5) end

-- Quadrants
function M.topLeft() M.setRelativeFrame(getWin(), 0, 0, 0.5, 0.5) end
function M.topRight() M.setRelativeFrame(getWin(), 0.5, 0, 0.5, 0.5) end
function M.bottomLeft() M.setRelativeFrame(getWin(), 0, 0.5, 0.5, 0.5) end
function M.bottomRight() M.setRelativeFrame(getWin(), 0.5, 0.5, 0.5, 0.5) end

-- Maximize
function M.maximize() M.setRelativeFrame(getWin(), 0, 0, 1, 1) end

-- Center (80% size)
function M.center()
    local win = getWin()
    if not win then return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = max.w * 0.8
    f.h = max.h * 0.8
    f.x = max.x + (max.w * 0.1)
    f.y = max.y + (max.h * 0.1)
    win:setFrame(f)
end

-- Cycle width: 30% -> 50% -> 70%
function M.cycleWidth()
    local win = getWin()
    if not win then return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    -- Calculate current ratio
    local currentRatio = f.w / max.w
    
    local ratios = config.ratios
    local targetRatio = ratios[1] -- default to first
    
    -- Find the next ratio in the cycle
    -- We allow some tolerance because exact float matching is flaky
    for i, r in ipairs(ratios) do
        if math.abs(currentRatio - r) < 0.05 then
            targetRatio = ratios[(i % #ratios) + 1]
            break
        end
    end
    -- If we aren't at one of the ratios, snap to the nearest or first?
    -- Let's just snap to the next largest, or default to first if we are weird.
    -- The logic above covers "next in sequence". If not found, it resets to ratios[1] (0.3).

    local oldW = f.w
    f.w = max.w * targetRatio

    -- Determine anchor logic
    -- If effectively left-aligned, stay left.
    -- If effectively right-aligned, stay right.
    -- Else, center.
    local isLeft = math.abs(f.x - max.x) < 50
    local isRight = math.abs((f.x + oldW) - (max.x + max.w)) < 50

    if isLeft then
        f.x = max.x
    elseif isRight then
        f.x = (max.x + max.w) - f.w
    else
        -- Center
        f.x = max.x + (max.w - f.w) / 2
    end
    
    win:setFrame(f)
end

return M
