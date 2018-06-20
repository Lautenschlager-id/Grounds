	uiupdateSquare = function(row, column, n, color, href, notNeg)
		if mode.chess.existSquare(row, column) then
			local isNeg = false
			if not notNeg then
				isNeg = not not (color or href)
			end

			local squareText = href or mode.chess.board[row][column] == '' and '' or string.format("%s%s<a href='event:square_%s_%s'>%s", mode.chess.stringReference.squareFormat, "<font color='#" .. mode.chess.colors[(mode.chess.isWhitePiece(mode.chess.board[row][column]) and "white" or "black") .. "Piece"] .. "'>", row, column, mode.chess.board[row][column])
			
			ui.addTextArea((row..column) * (isNeg and -1 or 1), squareText, n, 252 + (column - 1) * 38, 50 + (row - 1) * 38, 30, 30, color or (((row + column) % 2 == 0) and mode.chess.colors.whiteSquare or mode.chess.colors.blackSquare), 1, 1, true)
			
			ui.setShamanName(string.format("-   <G>|   <S>%s x %s", mode.chess.players[1].pieces, mode.chess.players[2].pieces))
			if isNeg then
				mode.chess.coloredSquares[-(row..column)] = true
			end
		end
	end,