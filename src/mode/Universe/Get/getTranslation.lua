	getTranslation = function(mass,size)
		-- (4 * π^2 / G * M) * r^3 
		-- (4 * 9.85 / 6.67e-11 * mass) * (size/2)^3
		
		return ((4 * 9.85 / 6.67e-11 * mass) * ((size/2)^3))^.5
	end,
