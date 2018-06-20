	eventLoop = function()
		if mode.click.partialTimer > 0 then
			mode.click.partialTimer = mode.click.partialTimer - .5
			ui.setMapName(string.format(system.getTranslation().newGame,"<ROSE>"..math.floor(mode.click.partialTimer).."<J>") .. "<")
			if mode.click.partialTimer <= 0 then
				mode.click.spawnCircle(true)
				
				mode.click.counter = math.max(20,system.miscAttrib)
				
				for k,v in next,mode.click.info do
					v.canPlay = true
					tfm.exec.respawnPlayer(k)
				end
				
				ui.removeTextArea(1,nil)
				ui.setMapName(system.getTranslation().click .. "<")
			end
		else
			if mode.click.counter > 0 then
				mode.click.counter = mode.click.counter - .5
				ui.addTextArea(0,"<p align='center'><font size='28'>" .. string.format(system.getTranslation().clickfast,math.floor(mode.click.counter)),nil,0,30,800,50,1,1,0,true)
				if mode.click.counter <= 0 then
					mode.click.spawnCircle(false)

					mode.click.partialTimer = 10.5

					ui.removeTextArea(0,nil)
					mode.click.uileaderboard()
				end
			end
		end
	end,