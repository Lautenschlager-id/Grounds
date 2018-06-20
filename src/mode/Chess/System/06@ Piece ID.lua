	pieceID = function(p)
		return (string.byte(p, 3, 3) - 148) % 6 + 1
	end,