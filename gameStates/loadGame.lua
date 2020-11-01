-------------------------------------------------------------------------------
-- Load Game State
local lgprint = love.graphics.print

local state={}


function state:init()
  -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
  love.keyboard.setKeyRepeat(true)
  math.randomseed(os.time())
  self.tmr = 0.2
  BGE.resourceManager:loadImages("data/imgs/")
  BGE.resourceManager:loadSounds("data/snds/")
end


function state:update(dt)
  self.tmr = self.tmr - dt

  if self.tmr <= 0 then
    BGE.gameStateSystem:setState("title")
  end
end


function state:draw()
end

function state:keypressed(key, isrepeat)
end


function state:textinput(t)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

return state
