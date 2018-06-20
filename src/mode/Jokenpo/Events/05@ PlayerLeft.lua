	eventPlayerLeft = function(n)
		if table.find(mode.jokenpo.players,n,"name") then
			mode.jokenpo.round = mode.jokenpo.roundsPerGame
			mode.jokenpo.nextRound()
		end
	end,