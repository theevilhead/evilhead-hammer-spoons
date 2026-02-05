local M = {}

-- Move focused window to next screen
function M.moveToNextScreen()
    local win = hs.window.focusedWindow()
    if not win then return end
    -- true argument discourages animation if possible, though strict usage varies
    win:moveToScreen(win:screen():next(), true, true)
end

-- Move focused window to previous screen
function M.moveToPrevScreen()
    local win = hs.window.focusedWindow()
    if not win then return end
    win:moveToScreen(win:screen():previous(), true, true)
end

return M
