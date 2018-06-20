	getMass = function(gravity,size)
		-- g * r² / G
		-- gravity * (size/2)^2 / 6.67e-11

		-- Size is improved
		size = size * 5
		return (gravity * (size/2)^2) / 6.67e-11
	end,
