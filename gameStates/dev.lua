-------------------------------------------------------------------------------
-- Dev state for testing
local room = require("bge.room")
local owMap = require("bge.overworldMap")

-----------------------------
-- Localized Globals
local gameStateManager  = GSTMAN
local entitySystem      = ENTSYS
local collisionSystem   = COLSYS
local camera            = CAMERA
local resourceManager   = RESMAN
local gameData          = GAMDAT
local overWorld         = OVRWLD

local state = {}


function state:init()
end


function state:update(dt)
end


function state:draw()
end

return state