	uicloseSplash = function(n,close)
		for i = 10,19 do
			mode.universe.uiremove(i,n)
		end
		
		if not close then
			mode.universe.uicreator(n)
		end
	end,
