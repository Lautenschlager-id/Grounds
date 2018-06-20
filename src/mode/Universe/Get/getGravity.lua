	getGravity = function(class,orbit)
		-- G * M / r²
		-- 6.67e-11 * mass / (size/2)^2
		
		if class == 1 then
			return 6.67e-11 * ((orbit * .49) * 1.3e6)
		elseif class == 2 then
			-- g will be (orbit * 0.49), since the distance Star-Earth(1) = 20 and 20/9.8 (its gravity) = 0.49
			return (orbit * .49)
		elseif class == 3 then
			return (orbit * .15)
		end
	end,
