	welcomeMessage = (function()
		if system.roomNumber == 666 then
			return {"<R>","<R>","<R>","<R>"}
		else
			return {"<BV>","<PT>","<BV>","<VP>"}	
		end
	end)(),
	isHouse = system.roomNumber == 801 or system.officialMode[1] == "village",