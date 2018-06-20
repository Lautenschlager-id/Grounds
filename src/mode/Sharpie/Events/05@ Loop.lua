	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			local alive,total = system.players()
			mode.sharpie.totalPlayers = total
			
			-- Warning
			mode.sharpie.uiborder(system.getTranslation().nothacker,10,382)
		end
		
		if _G.leftTime <= 1 or system.players() < 1 then
			tfm.exec.newGame()
		end

		if mode.sharpie.hardmode and _G.currentTime > 1 and _G.currentTime % 7 == 0 then
			system.newTimer(function()
				local x,y = math.random(0,mode.sharpie.mapInfo[1]),math.random(0,mode.sharpie.mapInfo[2])
				local id = tfm.exec.addImage(table.random(mode.sharpie.modeImages) .. ".png","&0",x - 56,y - 51) -- 112x103 img
				system.newTimer(function()
					tfm.exec.removeImage(id)

					tfm.exec.displayParticle(24,x,y)
					tfm.exec.explosion(x,y,50,100)
				end,1250,false)
			end,1000,false)
		end
	end,