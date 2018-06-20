	eventLoop = function()
		local mapName = "<N>" .. system.getTranslation().rival .." : <V>" .. math.isNegative(system.players()-1,0)
		if _G.currentTime > 4 and mode.presents.isRunning then
			if mode.presents.chooseTimer > 0 then
				mode.presents.chooseTimer = mode.presents.chooseTimer - .5
				
				if mode.presents.chooseTimer <= 0 then
					mode.presents.blockTimer = 5
					tfm.exec.addPhysicObject(4,400,270,{
						type = 4,
						height = 10,
						width = 640,
						miceCollision = true,
						groundCollision = false
					})
					tfm.exec.removePhysicObject(mode.presents.currentGift)
				else
					mapName = mapName .. "   <G>|   <J>" .. string.format(system.getTranslation().choose,math.floor(mode.presents.chooseTimer).."<J>")
				end
				
				if system.players() == 0 then
					mode.presents.victory(true)
				end
			end
			
			if mode.presents.blockTimer > 0 then
				mode.presents.blockTimer = mode.presents.blockTimer - .5
				
				if mode.presents.blockTimer == 2 then
					mode.presents.killOutOfRange()
				end
				
				if mode.presents.blockTimer <= 0 then
					mode.presents.currentGift = mode.presents.currentGift + 1
					if mode.presents.currentGift > 3 then
						mode.presents.victory()
					else
						tfm.exec.removePhysicObject(4)
						mode.presents.chooseTimer = 15
					end
				else
					mapName = mapName .. "   <G>|   <R>" .. system.getTranslation().kill
				end
			end
			
			if mode.presents.newMapTimer > 0 then
				mode.presents.newMapTimer = mode.presents.newMapTimer - .5
				
				mapName = "<PS>" .. string.format(system.getTranslation().newGame,math.floor(mode.presents.newMapTimer) .. "<PS>")
				if mode.presents.newMapTimer <= 0 then
					mode.presents.generateMap()
				end
			end
		end
		ui.setMapName(mapName .. "<")
	end,
