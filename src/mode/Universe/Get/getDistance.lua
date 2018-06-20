	getDistance = function(class,data,size)
		if class == 2 then
			local id = data
			if mode.universe.orbit[2] > 0 then
				local current
				repeat
					id = id - 1
					current = mode.universe.cosmos[id]
				until current.class == 2
				
				return current.distance + (#current.moons * 3.1) + size
			else
				return size / 3
			end
		else -- Moon
			return mode.universe.cosmos[data].distance + mode.universe.cosmos[data].size/2 + #mode.universe.cosmos[data].moons * 2.3
		end
	end,
