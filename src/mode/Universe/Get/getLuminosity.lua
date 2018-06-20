	getLuminosity = function(size,temperature)
		-- 4πR^2sT^4
		-- 4 * 3.14 * size^2 * 5.67e-8 * temperature^4

		return 4 * 3.14 * size^2 * 5.67e-8 * temperature^4
	end,
