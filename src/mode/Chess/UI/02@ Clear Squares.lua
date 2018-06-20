	uiclearColoredSquares = function()
		for k, v in next, table.copy(mode.chess.coloredSquares) do
			if v then
				ui.removeTextArea(k)
				mode.chess.coloredSquares[k] = nil
			end
		end
	end,