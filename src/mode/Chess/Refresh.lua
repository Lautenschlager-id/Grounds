	refresh = function()
		mode.chess.canStart = false

		mode.chess.uiclearColoredSquares()
		
		for k, v in next, mode.chess.players do
			tfm.exec.movePlayer(v.name, 400, 375)
		end
		
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()

		mode.chess.currentPlayer = 2
		for i = 3, 5 do
			ui.removeTextArea(-i)
		end
		
		for i = 1, 2 do
			ui.addTextArea(-i, "<font color='#" .. system.getTranslation().colors[i] .. "'><p align='center'><font size='20'>[" .. system.getTranslation().space .. "]", nil, 5 + (i - 1) * 595, 180, 200, nil, 1, 1, 0, true)
		end
		
		mode.chess.uiboard()
	end,