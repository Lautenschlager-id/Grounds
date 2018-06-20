	eventPlayerWon = function(n)
		if mode.grounds.availableRoom and not mode.grounds.review and mode.grounds.info[n].groundsDataLoaded and system.isPlayer(n) then
			mode.grounds.podium = mode.grounds.podium + 1
			
			if mode.grounds.podium < 4 then
				mode.grounds.info[n].stats.podiums = mode.grounds.info[n].stats.podiums + 1
				
				local addedCoins = 20 - mode.grounds.podium * 5
				mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins + addedCoins
				tfm.exec.setPlayerScore(n,4-mode.grounds.podium,true)
				tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",string.format(system.getTranslation(n).gotcoin,"<J>+$"..addedCoins.."</J>")),n)
				
				if mode.grounds.podium == 1 then
					tfm.exec.setGameTime(60,false)
				end
			else
				if mode.grounds.podium == 4 then
					tfm.exec.setGameTime(30,false)
				end
				
				mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins + 1
				tfm.exec.setPlayerScore(n,1,true)
			end
			
			if mode.grounds.hasWater then
				mode.grounds.displayWaterBar(n)
			end
			
			if system.miscAttrib ~= 0 then
				if mode.grounds.podium == system.miscAttrib then
					tfm.exec.setGameTime(0)
				end
			end
		end
		
		if mode.grounds.review or mode.grounds.isHouse then
			tfm.exec.respawnPlayer(n)
		else
			mode.grounds.info[n].canRev = false
		end
	end,
