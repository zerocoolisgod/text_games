-------------------------------------------------------------------------------
-- Load Game State
local lgprint = love.graphics.print
local lgSetColor = love.graphics.setColor
local lgRect = love.graphics.rectangle

local state={}


function state:init()
  self.menu = {
    {
      text = "Learn your words",
      x = 32,
      y = 32,
      state = "learn"
    },
    {
      text = "Practice your words",
      x = 32,
      y = 64,
      state = "practice"
    },
    {
      text = "Take a Test",
      x = 32,
      y = 96,
      state = "test"
    }
  }

  self.selection = 1
end


function state:update(dt)
end


function state:draw()
  lgprint("Make a selection",64,8)
  
  lgSetColor({0.5,0.5,0})
  lgRect("fill", self.menu[self.selection].x - 16, self.menu[self.selection].y, 8, 8)

  lgSetColor({1,1,1})
  for i = 1, #self.menu do
    lgprint(self.menu[i].text, self.menu[i].x, self.menu[i].y)
  end
end

function state:keypressed(key, isrepeat)
  if key == "return" then 
    local ns = self.menu[self.selection].state
    BGE.gameStateSystem:setState(ns)
  end
  
  if key == "up" then self.selection = self.selection - 1 end
  if self.selection < 1 then self.selection = #self.menu end
  
  if key == "down" then self.selection = self.selection + 1 end
  if self.selection > #self.menu then self.selection = 1 end
end


function state:textinput(t)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

return state
