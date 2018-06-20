	getVelocity = function(mass,size,orbit)
		-- sqrt (G * M) / R
		-- sqrt (6.67e-11 * mass) / R

		-- R will be (objectRadius * orbitRadius)
		return (((6.67e-11 * mass) / ((size/2) * (orbit/2)))^.5)^.25
	end,
