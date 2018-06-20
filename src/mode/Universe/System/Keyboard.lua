	keyboard = function()
		local k = ""
		local key = "<a href='event:keyboard.@.insert.%s'>%s</a> "
		for i = string.byte("A"),string.byte("Z") do -- Letters
			k = k .. string.format(key,i,string.char(i))
		end
		
		k = k .. "\n"
		
		for i = string.byte("0"),string.byte("9") do -- Numbers
			k = k .. string.format(key,i,string.char(i))
		end
		
		k = k .. "\n"
		
		for i,j in next,{string.byte("-_",1,2)} do -- Characters
			k = k .. string.format(key,j,string.char(j))
		end
    
		return k
	end,
