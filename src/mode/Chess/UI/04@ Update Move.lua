	uiupdateLastMove = function(...)
		if mode.chess.lastMove[1] and mode.chess.lastMove[2] then
			mode.chess.uiupdateSquare(mode.chess.lastMove[1], mode.chess.lastMove[2])
		end
		mode.chess.lastMove = {...}
	end,