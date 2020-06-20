-- Top down action adventure like OG zelda, but with a metroid-ish sci-fi style
-- Localized Another Test
local volume = 0.5
local lgr = love.graphics.rectangle
local lgp = love.graphics.print
local setColor = love.graphics.setColor

_USE_BUFFERED_SPRITESHEETS = falses

-- test from lappy

-------------------------------------------------------------------------------
-- Load Function
-------------------------------------------------------------------------------
function love.load(arg)
   
  -- Graphics
  love.graphics.setDefaultFilter('nearest')
  love.graphics.setBackgroundColor(0.5, 0.5, 0.5, 1)
  _USE_BUFFERED_SPRITESHEETS = true
  

  -- Audio
  love.audio.setVolume(volume)

  -- Font
  local font = love.graphics.newFont('font.ttf', 8)
  love.graphics.setFont(font)
  
  -- Inputs
  love.mouse.setVisible(false)

  -- BGE Imports
  GSTMAN = require("bge.gameStateSystem")
  ENTSYS = require("bge.entitySystem")
  COLSYS = require("bge.collisionSystem")
  CAMERA = require("bge.camera")
  RESMAN = require("bge.resourceManager")
  GAMDAT = require("bge.gameData")
  OVRWLD = require("bge.overworldMap")
  INPUTS = require("bge.inputManager")
  TXTSYS = require("bge.textSystem")
  PALETT = require("bge.palette")

  -- Other Imports
  require("bge.gameMath")

  
  -- Debug
  for i=0,1000 do
    love.math.random(i)
  end

  -- Add Game States
  GSTMAN:addState("loadGame",     require("gameStates.00_loadGame"))
  GSTMAN:addState("titleScreen",  require("gameStates.01_titleScreen"))
  GSTMAN:addState("loadProg",     require("gameStates.02_loadProg"))
  GSTMAN:addState("saveProg",     require("gameStates.03_saveProg"))
  GSTMAN:addState("playGame",     require("gameStates.04_playGame"))
  GSTMAN:addState("playerDied",   require("gameStates.05_playerDied"))
  GSTMAN:addState("endGame",      require("gameStates.06_endGame"))
  GSTMAN:addState("dev",          require("gameStates.dev"))

  --set game state
  GSTMAN:setState("loadGame")

  -- Other
  love.graphics.setBackgroundColor(PALETT:getColor("pico8", 1))
end


-------------------------------------------------------------------------------
-- Main Loop
-------------------------------------------------------------------------------
function love.update(dt)
  INPUTS:update()
  GSTMAN:updateState(dt)
  CAMERA:update(dt)
end


-------------------------------------------------------------------------------
-- Drawing Loop
-------------------------------------------------------------------------------
function love.draw()
  CAMERA:set()
  GSTMAN:drawState()
  CAMERA:unset()
end


-------------------------------------------------------------------------------
-- Other Callbacks
-------------------------------------------------------------------------------
function love.focus(f)
end


function love.keypressed(key, isrepeat)
  if key == 'escape' or key == 'q' then love.event.quit() end
  if key == "f" then CAMERA:toggleFullscreen() end
  GSTMAN:keypressed(key, isrepeat)
end


function love.joystickpressed(joystick, button)
  GSTMAN:joystickpressed(joystick, button)
end


function love.joystickaxis(joystick, axis, value)
  GSTMAN:joystickaxis(joystick, axis, value)
end