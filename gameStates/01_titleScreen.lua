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
local palatte           = PALETT

local lgp = love.graphics.print
local ran = love.math.random

local state = {}

function state:init()
  self.txt = "This is the screen!\nLa La La La\nTitle Screen!!\n\nPress the \"Space Bar\" to start."
end


function state:update(dt)
  if inputs:isPressed("start") then gameStateManager:setState('playGame') end
end


function state:draw()
  love.graphics.setColor(palatte:getColor("pico8",5))
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