	eventPlayerDied = function(n)
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.setGameTime(10,false)
			mode.godmode.info[n].deathSha = mode.godmode.info[n].deathSha + 1
			tfm.exec.chatMessage("<R>" .. system.getTranslation().fail,n)
		else
			mode.godmode.deadMice = mode.godmode.deadMice + 1
			mode.godmode.updateMenu()
		end
	end,