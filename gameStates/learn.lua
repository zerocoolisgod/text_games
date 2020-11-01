-------------------------------------------------------------------------------
-- Learn State
local lgdraw = love.graphics.draw

local state = {}


function state:init()
  self.screenWidth = love.graphics.getWidth()
  self.words = require("data.wordlist")
  self.wordIndex = 1
  self.word = ""
  self.chars = {}
  self.wordImage = false
  
  self.textBox = self:createTextBox()
  self.inputBox = self:createInputBox()

  self:generateTest()
  BGE.resourceManager:playMusic("music", 0.1)
end


function state:update(dt)
end


function state:draw()
  self:drawImage()
  self.textBox:draw()
  self.inputBox:draw()
end

function state:drawImage()
  if self.wordImage then
    local viewSize = BGE.camera:getViewSize()
    local iw, ih = self.wordImage:getDimensions()
    local ix = (viewSize.x / 2) - (iw / 2)
    local iy = 24

    lgdraw(self.wordImage, ix, iy)
  end
end

function state:keypressed(key, isrepeat)
  if key == "backspace" then
    BGE.resourceManager:playSound("backspace", 0.1)
    self.inputBox:backspace()
    self:updateCharacters()
  end
    
  if key == "return" then 
    self:checkSpelling()
    self:updateCharacters()
  end

  if key == "f5" then 
    self:generateTest()
  end

end


function state:textinput(t)
  self.inputBox:addText(t)
  self:updateCharacters()
  BGE.resourceManager:playSound("key", 0.1)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end


function state:generateTest()
  self.inputBox:setText("")
  self:getWord()
  self.chars = self.words[self.wordIndex].chars
  self:incWordIndex()
  self:updateCharacters()
end


function state:getWord() 
  self.word = self.words[self.wordIndex].word
  if self.words[self.wordIndex].img then
    self.wordImage = BGE.resourceManager:getImage(self.words[self.wordIndex].word)
  end
end

function state:incWordIndex() 
  self.wordIndex = self.wordIndex + 1
  if self.wordIndex > #self.words then
    self.wordIndex = 1
  end
end


function state:checkSpelling()
  local input = self.inputBox:getText()
  self.inputBox:setText("")
  if input == self.word then
    self:generateTest()
    BGE.resourceManager:playSound("right", 0.5)
  else
    BGE.resourceManager:playSound("wrong", 0.5)
  end
end


function state:updateCharacters()
  -- this is fucking ugly
  -- refactor incoming!
  local input = self.inputBox:getText()
  local inputChars = {}
  for i = 1, #input do
    table.insert(inputChars, input:sub(i, i))
  end
  
  self.textBox:setText("")
  
  for i = 1, #self.chars do
    local used = false
    
    for j = 1, #inputChars do
      if self.chars[i] == inputChars[j] then 
        used = true
        inputChars[j] = ""
        break
      end
    end
    
    if not used then
      self.textBox:addText(self.chars[i].." ")
    end
  end
end


function state:createTextBox()
  local viewSize = BGE.camera:getViewSize()
  local tbw = 129
  local tbh = 8
  local tbx = (viewSize.x / 2) - (tbw / 2)
  local tby = 8
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
  local ibx = (viewSize.x / 2) - (ibw / 2)
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
