	checkCapture = function(n, row, column, newRow, newColumn, boolCapture, boolEmpty)
		boolCapture = boolCapture == nil or boolCapture
		boolEmpty = boolEmpty == nil or boolEmpty

		if mode.chess.isPieceSquare(newRow, newColumn) then
			if boolCapture and mode.chess.pieceDifColor(mode.chess.board[row][column], mode.chess.board[newRow][newColumn]) then
				mode.chess.uiupdateSquare(newRow, newColumn, n, mode.chess.colors.captureMove, string.format(mode.chess.stringReference.piece, row, column, newRow, newColumn, mode.chess.board[newRow][newColumn]))
			end
			return true
		end
		if boolEmpty then
			mode.chess.uiupdateSquare(newRow, newColumn, n, mode.chess.colors.emptyMove, string.format(mode.chess.stringReference.select, row, column, newRow, newColumn))
		end
		return false
	end,