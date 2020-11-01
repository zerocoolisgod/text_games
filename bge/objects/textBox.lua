--===========================================================================--
-- Text Box Class
--===========================================================================--

local lgGetFont   = love.graphics.getFont
local lgPrintf    = love.graphics.printf
local lgSetColor  = love.graphics.setColor
local lgDrawRec   = love.graphics.rectangle
local lgDraw      = love.graphics.draw

local camera = BGE.camera

local obj = {}
function obj:new(x, y, w, h, t)
  local tb = {}
  local viewS = camera:getViewSize()

  tb.fgColor = {1, 1, 1, 1}
  tb.bgColor = {1, 0, 0, 1}
  tb.borderColor = {0, 0, 0, 0}
  tb.borderSize = 8
  tb.frameX = x -1
  tb.frameY = y -1 
  tb.frameWidth = (w+2) or viewS.x - 1
  tb.frameHeight = (h+2) or viewS.y - 1
  tb.textLimit = 1028
  tb.frameImg = nil
  
  local wwl = w - 1 or viewS.x - 1
  tb.text = t or ""       -- A text string.
  tb.font = lgGetFont()   -- The Font object to use.
  tb.x = x or 1           -- The position on the x-axis.
  tb.y = y or 1           -- The position on the y-axis.
  tb.wrapLimit = wwl      -- Wrap the line after this many horizontal pixels.
  tb.align = "left"       -- default ("left"), The alignment.
  tb.r = 0                -- default (0),  Orientation (radians).
  tb.sx = 1               -- default (1)  Scale factor (x-axis).
  tb.sy = 1               -- default (sx)  -- Scale factor (y-axis).
  tb.ox = 0               -- default (0)  -- Origin offset (x-axis).
  tb.oy = 0               -- default (0)  -- Origin offset (y-axis).
  tb.kx = 0               -- default (0)  -- Shearing factor (x-axis).
  tb.ky = 0               -- default (0)  -- Shearing factor (y-axis).

  function tb:draw()
    self:drawBoarder()
    self:drawFrame()

    lgSetColor(self.fgColor)
    lgPrintf(self.text, self.font, self.x, self.y, self.wrapLimit, self.align, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
    lgSetColor({1, 1, 1, 1})
  end

  function tb:drawBoarder()
    local x,y = self.frameX - self.borderSize, self.frameY - self.borderSize
    local w,h = self.frameWidth + (self.borderSize * 2), self.frameHeight + (self.borderSize * 2)
    
    lgSetColor(self.borderColor)
    lgDrawRec("fill", x, y, w, h)
    lgSetColor({1, 1, 1, 1})
  end

  function tb:drawFrame()
    local x,y = self.frameX, self.frameY
    local w,h = self.frameWidth, self.frameHeight

    lgSetColor(self.bgColor)
    lgDrawRec("fill", x, y, w, h)
    lgSetColor({1,1,1,1})

    if self.frameImg then
      lgDraw(self.frameImg, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
    end
  end


  function tb:backspace()
    local utf8 = require("utf8")
    -- get the byte offset to the last UTF-8 character in the string.
    local byteoffset = utf8.offset(self.text, -1)
    
    if byteoffset then
      -- remove the last UTF-8 character.
      -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
      self.text = string.sub(self.text, 1, byteoffset - 1)
    end
  end
  
  -------------------------------------
  -- Setters
  -- call with not argument to reset to default values
  function tb:setText(t)
    self.text = t or ""
  end


  function tb:addText(t)
    -- appends text, use "setText()" to compleatly redefine text
    local addedText = t or ""
    if string.len(self.text) < self.textLimit then
      self.text = self.text..addedText
    end
  end

  function tb:setFont(f)
    self.font = f or lgGetFont()
  end
  

  function tb:setLocation(x,y)
    self.x = x or 0 
    self.y = y or 0
  end
  
  function tb:setWrapLimit(wl)
    self.wrapLimit = wl or 128
  end
  
  function tb:setTextLimit(wl)
    self.textLimit = wl or 1028
  end

  function tb:setAlignment(a)
    self.align = a or "left"
  end

  function tb:setRotation(r)
    self.r = r or 0
  end
  
  function tb:setScale(sx, sy)
    self.sx = sx or 1
    self.sy = sy or self.sx
  end

  function tb:setOriginOffset(ox,oy) 
    self.ox = ox or 0
    self.oy = oy or 0
  end

  function tb:setShearing(kx, ky)
    self.kx = kx or 0
    self.ky = ky or 0
  end

  function tb:setTextColor(c)
    self.fgColor = c or {1, 1, 1, 1}
  end
  
  function tb:setBackgroundColor(c)
    self.bgColor = c or {0, 0, 0, 0}
  end
  
  function tb:setBorderColor(c)
    self.borderColor = c or {0, 0, 0, 0}
  end
  
  function tb:setBorderSize(s)
    self.borderSize = s or 1
  end
  
  function tb:setFrameWidth(w)
    local viewS = camera:getViewSize()
    self.frameWidth = w or viewS.x - 1
  end
  
  function tb:setFrameHeight(h)
    local viewS = camera:getViewSize()
    self.frameHeight = h or viewS.y - 1
  end
  
  function tb:setFrameImage(i)
    self.frameImg = i or nil
  end

  -------------------------------------
  -- Getters
  function tb:getText()
    return self.text
  end


  return tb
end

return obj