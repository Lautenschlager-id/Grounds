	eventPlayerWon = function(n)
		if not tfm.get.room.playerList[n].isShaman then
			mode.godmode.savedMice = mode.godmode.savedMice + 1
			mode.godmode.updateMenu()
		end
	end,