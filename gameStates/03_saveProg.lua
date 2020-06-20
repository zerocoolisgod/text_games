--===========================================================================--
-- Save Game Progress
--
-- Writes current game state to file and returnes to playGame exits to 
-- titleScreen.
--===========================================================================--


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

-----------------------------
-- Localized Globals
local gameStateManager  = GSTMAN
local entitySystem      = ENTSYS
local collisionSystem   = COLSYS
local camera            = CAMERA
local resourceManager   = RESMAN
local gameData          = GAMDAT
local overWorld         = OVRWLD


function state:init()
  
end


function state:update(dt)
  
end


function state:draw()
end


function state:keypressed(key, isrepeat)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

return state