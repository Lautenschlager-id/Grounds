	-- Partial Next Round
	pNextRound = function()
		mode.jokenpo.playing = false
		mode.jokenpo.timer = 9.5
		mode.jokenpo.partialTimer = 3.5
		mode.jokenpo.decision()
		if mode.jokenpo.round == mode.jokenpo.roundsPerGame then
			table.sort(mode.jokenpo.players,function(p1,p2) return p1.score > p2.score end)
			if (mode.jokenpo.players[1].score == mode.jokenpo.players[2].score) or (mode.jokenpo.tie > mode.jokenpo.players[1].score) then
				tfm.exec.chatMessage("<CE>[•] " .. system.getTranslation().tie)
			else
				tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[1].color .. mode.jokenpo.players[1].name .. " " .. system.getTranslation().victory)
			end
		end
	end,
	-- Next Round
	nextRound = function()
		for i = 1,2 do
			if mode.jokenpo.players[i].remId then
				tfm.exec.removeObject(mode.jokenpo.players[i].remId)
			end
			mode.jokenpo.players[i].remId = nil
			mode.jokenpo.players[i].obj = 0
		end
		ui.removeTextArea(5,nil)
		mode.jokenpo.partialTimer = 0
		if mode.jokenpo.roundsPerGame > mode.jokenpo.round then
			mode.jokenpo.playing = true
			mode.jokenpo.round = mode.jokenpo.round + 1
		else
			mode.jokenpo.playing = false
			mode.jokenpo.round = 0
			mode.jokenpo.tie = 0
			mode.jokenpo.timer = 9.5
			mode.jokenpo.partialTimer = 0
			mode.jokenpo.players = {}
			tfm.exec.newGame(table.random(mode.jokenpo.maps))
			for i = 2,3 do
				ui.removeTextArea(i,nil)
			end
		end
		mode.jokenpo.uiinfo()
	end,