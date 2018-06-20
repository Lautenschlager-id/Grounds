	eventTextAreaCallback = function(i,n,c)
		local p = string.split(c,"[^%.]+")
		if p[1] == "profile" then
			if p[2] == "close" then
				for i = 0,1 do
					ui.removeTextArea(i,n)
				end
			end
		end
	end,