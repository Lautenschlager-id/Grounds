	stringReference = {
		emptySquare = "<textformat leftmargin='30' rightmargin='30' leading='30'>",
		HREF_select = "<a href='event:select_%s_%s_%s_%s'>",
		squareFormat = "<font size='25'><B>",
		
		realReference = function()
			mode.chess.stringReference.select = mode.chess.stringReference.emptySquare .. mode.chess.stringReference.HREF_select .. "\n"
			mode.chess.stringReference.piece = mode.chess.stringReference.squareFormat .. mode.chess.stringReference.HREF_select .. "%s"
			mode.chess.stringReference.castling = mode.chess.stringReference.emptySquare .. "<a href='event:kingpass_%s_%s_%s'>\n"
		end,
	},
