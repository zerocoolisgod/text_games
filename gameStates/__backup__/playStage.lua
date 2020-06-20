
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


local state = {}


function state:init()
  local wx,wy,wz = gameData:getWorldPosition()
  self.room = overWorld:getRoom(wx,wy,wz)
end


function state:update(dt)
  self.room:update(dt)
end


function state:draw()
  self.room:draw()
  love.graphics.print(gameData:getData("levelFruit"),16,16)
end


function state:keypressed(key, isrepeat)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

function state:checkRoomChange()
end

return state