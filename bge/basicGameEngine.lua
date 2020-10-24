-----------------------------
-- Import Engine as Globals
BGE = {}
BGE.gameStateSystem  = require("bge.gameStateSystem")
BGE.collisionSystem   = require("bge.collisionSystem")
BGE.camera            = require("bge.camera")
BGE.resourceManager   = require("bge.resourceManager")
BGE.gameData          = require("bge.gameData")
BGE.overWorld         = require("bge.overworldMap")
BGE.inputManager      = require("bge.inputManager")
BGE.entitySystem      = require("bge.entitySystem")
BGE.logicComponents   = require("bge.logicComponents")
BGE.renderComponents  = require("bge.renderComponents")
BGE.palettes          = require("bge.palettes")


BGE.objects = {}
BGE.objects.entity     = require("bge.objects.entity")
BGE.objects.textBox    = require("bge.objects.textBox")

require("bge.gameMath")
require("bge.customRun") -- Comment out for default run

BGE._framAcum = 0 -- i dont think i need this anyy more

function BGE:load()
  -- Scaling filter / Mouse Cursor Off
  love.graphics.setDefaultFilter('nearest')
  love.mouse.setVisible(false)
  BGE.camera:setLowResMode("tpg")

  -- load font
  local font = love.graphics.newFont("bge/OSC_Font.ttf", 8)
  love.graphics.setFont(font)

  -- Set Volume
  local volume = 0
  love.audio.setVolume(volume)
  if self.onLoad then self:onLoad() end
end

function BGE:update(dt) end
function BGE:draw() end


--Using Game State Manager
function BGE:gsmUpdate(dt)
  self.inputManager:update(dt)
  self.gameStateSystem:updateState(dt)
  if self.onUpdate then self:onUpdate(dt) end
  self.camera:update(dt)
end

function BGE:gsmDraw()
  self.camera:set()
  self.gameStateSystem:drawState()
  if self.onDraw then self:onDraw() end
  self.camera:unset()
end


-- Using Statless update
-- Easier for prototyping
-- onUpdate and onDraw are not run untill defined
function BGE:statelessUpdate(dt)
  self.inputManager:update(dt)
  self.entitySystem:updateEnts(dt)
  if self.onUpdate then self:onUpdate(dt) end
  self.camera:update(dt)
end


function BGE:statelessDraw()
  self.camera:set()
  self.entitySystem:drawEnts()
  if self.onDraw then self:onDraw() end
  self.camera:unset()
end


function BGE:setUseGameStates(ugs)
  -- games states must be loaded before this is set
  self.update = self.statelessUpdate
  self.draw = self.statelessDraw
  
  if ugs then
    self.update = self.gsmUpdate
    self.draw = self.gsmDraw
  end
end


BGE:setUseGameStates(false)

return BGE