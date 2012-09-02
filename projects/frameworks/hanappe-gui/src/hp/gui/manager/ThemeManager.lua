----------------------------------------------------------------
-- This is a class to manage Theme.<br>
--
-- @auther Makoto
-- @class table
-- @name ThemeManager
----------------------------------------------------------------

-- import
local Event             = require "hp/event/Event"
local EventDispatcher   = require "hp/event/EventDispatcher"
local Theme             = require "hp/gui/theme/Theme"

-- class define
local M                 = EventDispatcher()
local theme             = Theme

----------------------------------------------------------------
-- Sets the default widget theme to use.
-- @param theme Widget theme.
----------------------------------------------------------------
function M:setTheme(value)
    value = type(value) == "string" and dofile(value) or value
    if theme ~= value then
        theme = value
        self:dispatchEvent("themeChanged")
    end
end

----------------------------------------------------------------
-- Returns the current default theme.
-- @return GuiTheme.
----------------------------------------------------------------
function M:getTheme()
    return theme
end

----------------------------------------------------------------
-- Returns the current default theme.
-- @return component theme.
----------------------------------------------------------------
function M:getComponentTheme(name)
    return theme[name]
end

return M