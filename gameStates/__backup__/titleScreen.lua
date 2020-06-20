-------------------------------------------------------------------------------
-- Title Screen

-----------------------------
-- Localized Globals
local gameStateManager  = GSTMAN
local entitySystem      = ENTSYS
local collisionSystem   = COLSYS
local camera            = CAMERA
local resourceManager   = RESMAN
local gameData          = GAMDAT
local overWorld         = OVRWLD
local inputs						= INPUTS

local lgp = love.graphics.print
local ran = love.math.random
local nesCP = require("bge.palette")

local state = {}

function state:init()
  self.txt = "This is the screen!\nLa La La La\nTitle Screen!!"
end


function state:update(dt)
  if inputs:isPressed("start") then gameStateManager:setState('loadStage') end
end


function state:draw()
  love.graphics.setColor(nesCP[5])
  lgp(self.txt,32,32)
  love.graphics.setColor(1,1,1)
end


function state:keypressed(key, isrepeat)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

return state