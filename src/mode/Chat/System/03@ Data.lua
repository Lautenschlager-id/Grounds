	loadData = function()
		local message = "<font size='7'>\n</font>"
		for i = 18,1,-1 do
			if #message < 1900 then
				local line = mode.chat.displayData[i] or ""
				message = message .. line
			end
		end
		return message
	end,