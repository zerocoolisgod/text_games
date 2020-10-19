-- Princess Game DX

-- Imports
BGE = require("bge.basicGameEngine")


-- Localized love
local lgRect = love.graphics.rectangle
local lgDraw = love.graphics.draw
local lgSetColor = love.graphics.setColor
local lgPop = love.graphics.pop
local lgPush = love.graphics.push
local lgScale = love.graphics.scale


-- Localized Vars
local why = "wtf"




-------------------------------------------------------------------------------
-- Load Function
-------------------------------------------------------------------------------
function love.load(arg)
  BGE:load()

  local plr = newPlayer(16,16)
  BGE.entitySystem:addEntity(plr)
  BGE.camera:setFocus(plr)
  makeWalls()
end


-------------------------------------------------------------------------------
-- Main Loop
-------------------------------------------------------------------------------
function love.update(dt)
  BGE:update(dt)
end


-------------------------------------------------------------------------------
-- Drawing Loop
-------------------------------------------------------------------------------
function love.draw()
  BGE:draw()
end


-------------------------------------------------------------------------------
-- Other Callbacks
-------------------------------------------------------------------------------
function love.focus(f)
end


function love.keypressed(key, isrepeat)
  if key == 'escape' or key == 'q' then love.event.quit() end
  if key == "f" then _CAMERA:toggleFullscreen() end
end


function love.joystickpressed(joystick, button)
end


function love.joystickaxis(joystick, axis, value)
end



-------------------------------------------------------------------------------
-- Entites
-------------------------------------------------------------------------------
function newPlayer(x,y)
  local p = BGE.entity:new(x,y,16,16)
  p:addRectangle({0.2, 0.2, 1, 1})
  p:addCollision(true)
  p:addMovement()
  

  p:addOnUpdate(
    function(self, dt)
      local moveSpeedX, moveSpeedY = 0,0
      local AccelerationX, AccelerationY = 1,1
      
      if BGE.inputManager:isDown("up") then moveSpeedY = -80 end
      if BGE.inputManager:isDown("down") then moveSpeedY = 80 end
      if BGE.inputManager:isDown("left") then moveSpeedX = -80 end
      if BGE.inputManager:isDown("right") then moveSpeedX = 80 end
      
      self:move(moveSpeedX, moveSpeedY, AccelerationX, AccelerationY, dt)
    end
  )
  
  return p
end


function newWall(x,y)
  local e = BGE.entity:new(x,y,16,16)
  e:addRectangle({0.2, 1, 0.2, 1})
  e:addCollision(true)
  return e
end

function makeWalls()
  for x = 3, 11 do
    BGE.entitySystem:addEntity(newWall(x*16, 100))
  end
end