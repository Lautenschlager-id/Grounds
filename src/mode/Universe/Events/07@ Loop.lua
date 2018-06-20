	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			for k,v in next, (system.players(true)) do
				tfm.exec.killPlayer(v)
			end
		end
		
		if _G.currentTime % 80 == 0 then
			if mode.universe.ufoId > -1 then
				tfm.exec.removeImage(mode.universe.ufoId)
			end

			mode.universe.ufoId = tfm.exec.addImage(table.random(mode.universe.images.ufos) .. ".png","!65",math.random(200,7800),math.random(200,7800))
		end
	end
