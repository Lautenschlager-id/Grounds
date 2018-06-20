	getFlow = function(luminosity,size)
		-- L / 4πr²
		-- luminosity / 4 * 3.14 * (size/2)^2
		return (luminosity / (4 * 3.14 * (size/2)^2))^.25
	end,
