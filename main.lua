-- Imports
BGE = require("bge.basicGameEngine")
local _BS_ = {}
local _DEBUG_ = false
local _test_tab_ = {}

 
-------------------------------------------------------------------------------
-- Load Function
-------------------------------------------------------------------------------
function love.load(arg)
  BGE:load()
  BGE.gameStateSystem:addState("play", require("gameStates.play"))
  BGE.gameStateSystem:addState("loadGame", require("gameStates.loadGame"))
  BGE.gameStateSystem:setState("loadGame")
  BGE:setUseGameStates(true)
  if _DEBUG_ then _BS_:load() end
end


-------------------------------------------------------------------------------
-- Main Loop
-------------------------------------------------------------------------------
function love.update(dt)
  BGE:update(dt)
  if _DEBUG_ then _BS_:update(dt) end
end


-------------------------------------------------------------------------------
-- Drawing Loop
-------------------------------------------------------------------------------
function love.draw()
  BGE:draw()
  if _DEBUG_ then _BS_:draw() end
end


-------------------------------------------------------------------------------
-- Other Callbacks
-------------------------------------------------------------------------------
function love.focus(f)
end


function love.textinput(t)
  BGE.gameStateSystem:textinput(t)
end


function love.keypressed(key)
  BGE.gameStateSystem:keypressed(key)
end


--=============================================================================
-- DEBUG CALLBACKS
--=============================================================================


function _BS_:load()
  
end


function _BS_:update(dt)
end


function _BS_:draw() 

end