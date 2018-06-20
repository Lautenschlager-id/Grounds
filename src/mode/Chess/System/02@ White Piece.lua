	isWhitePiece = function(p)
		p = string.byte(p, 3, 3)
		return p > 147 and p < 154
	end,