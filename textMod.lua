function printF(t, x, y)
  -- A text string.
  local text = t 
  
  -- The Font object to use.
  local font = lgGetFont()
  
  -- The position on the x-axis.
  local x = x or 0
  
  -- The position on the y-axis.
  local y = y or 0
  
  -- Wrap the line after this many horizontal pixels.
  local limit = 128
  
  -- The alignment.
  local align = "left" -- default ("left")
  
  -- Orientation (radians).
  local r = 0 -- default (0)
  
  -- Scale factor (x-axis).
  local sx = 1 -- default (1)
  
  -- Scale factor (y-axis).
  local sy = sx-- default (sx)
  
  -- Origin offset (x-axis).
  local ox = 0 -- default (0)
  
  -- Origin offset (y-axis).
  local oy = 0 -- default (0)
  
  -- Shearing factor (x-axis).
  local kx = 0 -- default (0)
  
  -- Shearing factor (y-axis).
  local ky = 0 -- default (0)
  
  
  lgPrintf( text, font, x, y, limit, align, r, sx, sy, ox, oy, kx, ky )
end