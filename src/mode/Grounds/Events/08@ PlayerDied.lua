	eventPlayerDied = function(n)
		if mode.grounds.info[n].groundsDataLoaded and mode.grounds.availableRoom then
			mode.grounds.info[n].stats.deaths = mode.grounds.info[n].stats.deaths + 1
		end
		if mode.grounds.hasWater then
			if mode.grounds.info[n].drown > 0 then
				mode.grounds.displayWaterBar(n)
			end
		end
		
		system.bindKeyboard(n,32,true,false)
		ui.removeTextArea(-1,n)
		
		if mode.grounds.review or mode.grounds.isHouse then
			tfm.exec.respawnPlayer(n)
		end
	end,
