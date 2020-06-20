------------------------------------------------------------------------------
-- Entity System
------------------------------------------------------------------------------


local entSys = {}

entSys.ents = {}

-------------------------------------------------------------------------------
-- Entity Table Managment
-------------------------------------------------------------------------------
function entSys:clearEnts()
	self.ents = {}
end

function entSys:registerEntityTable(entTable)
	self.ents = entTable
end

function entSys:getEnts()
	return self.ents
end


function entSys:addEntity(e)
	table.insert(self.ents, e)
end


-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------
function entSys:updateEnts(dt)
	for i = #self.ents, 1, -1 do
		if self.ents[i].remove then 
			table.remove(self.ents, i)
		end
	end
	
	for i = 1, #self.ents do
		self.ents[i]:update(dt)
	end
end


function entSys:drawEnts()
	for i = 1, #self.ents do
		self.ents[i]:draw()
	end
end



-------------------------------------------------------------------------------
-- New Ent
-------------------------------------------------------------------------------
function entSys:newEnt(x,y,w,h)
	local e = {}
	e.id = "new ent"
	
	e.pos = {
		x = x or 0,
		y = y or 0
	}
	
	e.size = {
		w = w or 8,
		h = h or 8
	}
	
	e.logSys = {}
	e.renSys = {}
	
	-------------------------------------
	-- Methods
	function e:update(dt)
	  for i = 1, #self.logSys do
			self.logSys[i](self, dt)
		end
	end
	

	function e:draw()
		for i = 1, #self.renSys do
			self.renSys[i](self)
		end
	end
	
	
	function e:addLogSys(sys)
		table.insert(self.logSys, sys)
	end
	

	function e:addRenSys(sys)
		table.insert(self.renSys, sys)
	end
	

	function e:setId(id)
		self.id = id
	end
	

	function e:setGroup(group)
		self.group = group
	end
	
	-----------------------------------------------------------------------------
	-- getters
	function e:getPosition()
		return self.pos.x, self.pos.y
	end

	
	function e:getSize()
		return self.size.w, self.size.h
	end
  return e
end


return entSys