--===========================================================================--
-- Play Game Progress
--
-- Where the sausage is made.
--===========================================================================--


local Room = require("bge.room")

-----------------------------
-- Localized Globals
local gameStateManager  = GSTMAN
local entitySystem      = ENTSYS
local collisionSystem   = COLSYS
local camera            = CAMERA
local resourceManager   = RESMAN
local gameData          = GAMDAT
local overWorld         = OVRWLD
local textSystem        = TXTSYS
local palatte           = PALETT

local state = {}


function state:init()
  self.tb = textSystem:newInputBox(16, 16, 200, 128)
  self.tb:setBackgroundColor(palatte:getColor("pico8",2))
  self.tb:setBorderColor(palatte:getColor("pico8",2))
  self.tb:setTextColor(palatte:getColor("pico8",14))

  self.tb:setText("You are standing in an open field west of a white house, with a boarded front door.\n\nThere is a small mailbox here.")
end


function state:update(dt)
end


function state:draw()
  self.tb:draw()
end


function state:keypressed(key, isrepeat)
  self.tb:onKeyPressed(key)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

function state:checkRoomChange()
end

return state