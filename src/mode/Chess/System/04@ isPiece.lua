	isPieceSquare = function(row, column)
		return mode.chess.existSquare(row, column) and mode.chess.board[row][column] ~= ''
	end,