	uiclearCreator = function(n,range)
		for i = 1,#mode.universe.info[n].settings.create do
			if i > (range or 1) then
				mode.universe.info[n].settings.create[i] = nil
			end
		end
	end,
