	eventLoop = function()
		local alive,total = system.players()
		if _G.leftTime < 2 or (total > 1 and alive < 2) or alive == 0 then
			mode.godmode.lastShaman = mode.godmode.getShaman()
			tfm.exec.newGame("#4")
		end
	end,