	getShaman = function()
		local s = {}
		for k,v in next,tfm.get.room.playerList do
			if v.isShaman then
				s[#s + 1] = k
			end
		end

		return s
	end,