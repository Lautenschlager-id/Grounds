	getWithType = function(a)
		local values = string.split(a or "","[^,]+")
		
		local out = {}
		
		for k,v in next,values do
			local icon,value = string.match(v,"([@?#!])(.*)")
			if icon and value then	
				if icon == "#" then
					out[#out + 1] = tonumber(value)
				elseif icon == "@" then
					out[#out + 1] = string.trim(tostring(value))
				elseif icon == "!" then
					out[#out + 1] = value == "true"
				elseif icon == "?" then
					out[#out + 1] = system.loadTable(value)
				end
			end
		end
		
		return out
	end,