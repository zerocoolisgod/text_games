-- Imports
BGE = require("bge.basicGameEngine")


 
-------------------------------------------------------------------------------
-- Load Function
-------------------------------------------------------------------------------
function love.load(arg)
  BGE:load()
  BGE.gameStateSystem:addState("play", require("gameStates.play"))
  BGE.gameStateSystem:addState("loadGame", require("gameStates.loadGame"))
  BGE.gameStateSystem:setState("loadGame")
  BGE:setUseGameStates(true)
end


-------------------------------------------------------------------------------
-- Main Loop
-------------------------------------------------------------------------------
function love.update(dt)
  BGE:update(dt)
end


-------------------------------------------------------------------------------
-- Drawing Loop
-------------------------------------------------------------------------------
function love.draw()
  BGE:draw()
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

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--* Build the actual fucking spelling game for Beth to use!!
--*
--* Consolidate "BGE.objects.textBox" with "BGE.textSystem"
--* Merge changes in this BGE with the BGE-Master repo
--* Merge this into its own repo
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------