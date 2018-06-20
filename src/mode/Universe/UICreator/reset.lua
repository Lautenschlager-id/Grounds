	uiresetCreator = function(n)
		mode.universe.info[n].settings.palette = {1,{},1}
		mode.universe.info[n].settings.size = {-math.huge,5}
		mode.universe.info[n].settings.temperature = {-math.huge,5,true}
		mode.universe.info[n].settings.velocity = {-math.huge,1,true}
		mode.universe.info[n].settings.distance = {-math.huge,5,true}
		mode.universe.info[n].settings.rings = false
		mode.universe.info[n].settings.satellite = 0
	end,
