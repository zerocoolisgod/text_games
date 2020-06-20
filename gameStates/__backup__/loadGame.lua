-------------------------------------------------------------------------------
-- Load Game State
-- Used to initialize game specific stuff

-----------------------------
-- Localized Globals
local gameStateManager  = GSTMAN
local entitySystem      = ENTSYS
local collisionSystem   = COLSYS
local camera            = CAMERA
local resourceManager   = RESMAN
local gameData          = GAMDAT
local overWorld         = OVRWLD

local lgp = love.graphics.print 

local state = {}


function state:init()
  self:initResourceManager()
  overWorld:setMapSize(16,4,1)
  overWorld:loadMaps("maps")
  gameData:setWorldPosition(1,1,1)
  self:initCamera()
  self.timer = 0.2
  self.txt = "Loading New Game!!"
end


function state:update(dt)
  self.timer = self.timer - dt
  if self.timer <= 0 then gameStateManager:setState("titleScreen") end
end


function state:draw()
  lgp(self.txt, 32, 32)
end


function state:keypressed(key, isrepeat)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end


function state:initCamera()
  love.window.setMode(0, 0)
  local screenWidth, screenHeight = love.graphics.getDimensions()
    
  local nes = {x = 256, y = 240} --(32x30) 8x8 pixel sprites
  local gbc = {x = 160, y = 144} --(20x18) 8x8 pixel sprites
  local gba = {x = 240, y = 160} --(30x20) 8x8 pixel sprites
  local tpg = {x = 320, y = 180} --(40x22) 8x8 pixel sprites
  local camRes = tpg
  local windowScale = 3
  local windowSize = {x = camRes.x * windowScale, y = camRes.y * windowScale}
  --local fullscreenSize = {x = 1366, y = 768}
  local fullscreenSize = {x = screenWidth, y = screenHeight}
  local mode = "window"

  camera:init()
  camera:setViewSize(camRes.x, camRes.y)
  camera:setWindowSize(windowSize.x, windowSize.y)
  camera:setFullscreenSize(fullscreenSize.x, fullscreenSize.y)
  camera:setMode(mode)
end


function state:initResourceManager()
  resourceManager:loadEntities("entities/")
  resourceManager:loadImages("graphics/tilesets/")
  resourceManager:loadImages("graphics/spriteSheets/")
end

return state