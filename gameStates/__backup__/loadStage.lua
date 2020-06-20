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
  local nwpX, nwpY, nwpZ = gameData:getNextWorldPosition()
  local cwpX, cwpY, cwpZ = gameData:getWorldPosition()
  if nwpX ~= cwpX or nwpY ~= cwpY or nwpZ ~= cwpZ then
    gameData:setWorldPosition(nwpX, nwpY, nwpZ)
  end
  
  local wx,wy,wz = gameData:getWorldPosition()
  local room = overWorld:getRoom(wx,wy,wz)
  local ents ={}
  room:activateRoom()
  ents = room:getRoomEntities()
  entitySystem:registerEntityTable(ents)

  local fruitCount = 0
  for e=1,#ents do
    if ents[e].group == "fruit" then fruitCount = fruitCount + 1 end
  end


  gameData:setData("levelFruit", fruitCount)
  gameStateManager:setState("playStage")
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