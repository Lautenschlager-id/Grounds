	eventLoop = function()
		if mode.jokenpo.playing then
			if mode.jokenpo.timer > 0 then
				mode.jokenpo.timer = mode.jokenpo.timer - .5
				ui.addTextArea(0,"<p align='center'><font size='35'><J>"..math.floor(mode.jokenpo.timer),nil,380,85,40,40,1,1,0,true)
				for i = 1,2 do
					tfm.exec.movePlayer(mode.jokenpo.players[i].name,({285,515})[i],330)
					tfm.exec.playEmote(mode.jokenpo.players[i].name,26)
				end
			else
				mode.jokenpo.pNextRound()
			end
		else
			if mode.jokenpo.partialTimer > 0 then
				mode.jokenpo.partialTimer = mode.jokenpo.partialTimer - .5
				ui.addTextArea(0,"<p align='center'><font size='35'><PT>"..math.floor(mode.jokenpo.partialTimer),nil,380,85,40,40,1,1,0,true)
				
				if mode.jokenpo.partialTimer <= 0 then
					mode.jokenpo.nextRound()
				end
			end
		end
	end,
