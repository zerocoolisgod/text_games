-------------------------------------------------------------------------------
-- PLay State
local lgdraw = love.graphics.draw

local state = {}


function state:init()
  self.screenWidth = love.graphics.getWidth()
  self.words = shuffleTable(require("data.wordlist"))
  self.wordIndex = 1
  self.word = ""
  -- self.input = "" -- may not need
  self.chars = {}
  self.wordImage = false
  
  self.textBox = self:createTextBox()
  self.inputBox = self:createInputBox()

  self:getNewWord()
end


function state:update(dt)
end


function state:draw()
  if self.wordImage then
    lgdraw(self.wordImage, 32, 8)
  end
  self.textBox:draw()
  self.inputBox:draw()
end

function state:keypressed(key, isrepeat)
  if key == "backspace" then 
    self.inputBox:backspace()
  end
    
  if key == "return" then 
    self:checkSpelling()
  end

  if key == "f5" then 
    self:getNewWord()
  end
end


function state:textinput(t)
  self.inputBox:addText(t)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end


function state:getNewWord()
  self.word = self.words[self.wordIndex].word
  if self.words[self.wordIndex].img then
    self.wordImage = BGE.resourceManager:getImage(self.words[self.wordIndex].img)
  end

  self.chars = shuffleTable(self.words[self.wordIndex].char)
  self.textBox:setText("")
  for i = 1, #self.chars do
    self.textBox:addText(self.chars[i].." ")
  end

  self.wordIndex = self.wordIndex + 1
  if self.wordIndex > #self.words then
    self.wordIndex = 1
  end
end

function state:checkSpelling()
  local input = self.inputBox:getText()
  
  if input == self.word then
    self:getNewWord()
  end

  self.inputBox:setText("")
end


function state:createTextBox()
  local viewSize = BGE.camera:getViewSize()
  local tbw = 57
  local tbh = 32
  local tbx = (viewSize.x - tbw) - 16
  local tby = 16
  local tb = BGE.objects.textBox:new(tbx, tby, tbw, tbh, "")
  tb:setTextColor(BGE.palettes:getColor("pico8", 7))
  tb:setBackgroundColor(BGE.palettes:getColor("pico8", 2))
  tb:setBorderColor(BGE.palettes:getColor("pico8", 3))
  tb:setBorderSize(4)
  return tb
end


function state:createInputBox()
  local viewSize = BGE.camera:getViewSize()
  local ibw = 129
  local ibh = 8
  local ibx = 64 
  local iby = (viewSize.y - ibh) - 16
  local ipb = BGE.objects.textBox:new(ibx, iby, ibw, ibh, "")
  ipb:setTextLimit(16)
  ipb:setTextColor(BGE.palettes:getColor("pico8", 11))
  ipb:setBackgroundColor(BGE.palettes:getColor("pico8", 2))
  ipb:setBorderColor(BGE.palettes:getColor("pico8", 13))
  ipb:setBorderSize(1)
  return ipb
end

return state
