	getTemperature = function(class,orbit)
		-- Unknown Algorithm Method
		if class == 1 then
			return math.random(1e3,1e4)
		else
			return math.log(orbit,mode.universe.cosmos[1].luminosity)
		end
	end,
