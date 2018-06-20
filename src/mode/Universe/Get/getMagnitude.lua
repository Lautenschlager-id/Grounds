	getMagnitude = function(flow)
		local this = mode.universe.cosmos[id]
		-- –2.5 log(F1 / F2)
		-- -2.5 log(flow / -1.6)

		-- F2 will be –1.6 from Sirius, but it should be 0.00, from Vega
		return -2.5 * math.log(flow / -1.6)
	end,
