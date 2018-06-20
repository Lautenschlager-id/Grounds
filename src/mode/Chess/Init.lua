	init = function()
		mode.chess.stringReference.realReference()
	
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()
	
		for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
			tfm.exec["disable" .. v]()
		end

		tfm.exec.newGame(1995980)
		
		system.roomAdmins["Billysmille#0000"] = true
		
		mode.chess.refresh()
	end,