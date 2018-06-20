	eventLoop = function()
		mode.grounds.gsys.groundEffects()
		
		if _G.currentTime % 5 == 0 then
			mode.grounds.alivePlayers,mode.grounds.totalPlayers = system.players()
		end
		
		if not mode.grounds.isHouse and _G.currentTime == 3 and math.random(50) < 16 and os.time() > mode.grounds.announceTimer then
			mode.grounds.announceTimer = os.time() + 5000
			tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",system.getTranslation().powersenabled))
		end

		if mode.grounds.isHouse then
			if _G.currentTime%5 == 0 then
				if _G.leftTime <= 2 then
					tfm.exec.newGame(mode.grounds.newMap())
				end
			end
		else
			if _G.currentTime%2 == 0 and not mode.grounds.review then
				if mode.grounds.alivePlayers < 1 or _G.leftTime <= 2 then
					tfm.exec.newGame(mode.grounds.newMap())
				elseif mode.grounds.alivePlayers == 1 and _G.leftTime > 50 and mode.grounds.totalPlayers > 1 then
					tfm.exec.setGameTime(30)
				elseif mode.grounds.podium > 5 and mode.grounds.alivePlayers > 3 then
					tfm.exec.setGameTime(20,false)
				end
			end
		end
		
		for n,v in next,mode.grounds.info do
			v.isWalking = (tfm.get.room.playerList[n] and (tfm.get.room.playerList[n].movingRight or tfm.get.room.playerList[n].movingLeft) or false)
			v.right = (tfm.get.room.playerList[n] and (tfm.get.room.playerList[n].isFacingRight) or false)
			if v.powersOP.GTYPE ~= 7 then -- Sand
				ui.removeTextArea(-1,n)
			end
			if mode.grounds.hasWater then
				if _G.currentTime%2 == 0 then
					if tfm.get.room.playerList[n] then
						if not tfm.get.room.playerList[n].isDead and v.powersOP.GTYPE ~= 9 then -- Water
							if v.drown > 0 then
								v.drown = v.drown - math.random(1,math.floor(v.stats.powers.water[1]))
								mode.grounds.displayWaterBar(n)
							end
						end
					end
				end
			end
		end
	end,
