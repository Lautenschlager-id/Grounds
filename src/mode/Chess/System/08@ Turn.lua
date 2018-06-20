	changeTurn = function()
		mode.chess.currentPlayer = (mode.chess.currentPlayer == 1 and 2 or 1)
		mode.chess.currentPlayerColor = system.getTranslation().colors[mode.chess.currentPlayer]
		
		local text = "<B><p align='center'><font size='18'>" .. string.format(system.getTranslation().turn, mode.chess.currentPlayerColor)
		mode.chess.border(text)
	end,