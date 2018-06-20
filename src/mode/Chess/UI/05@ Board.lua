	uiboard = function(n)
		--[[
			[11:88] -> Squares
			[-88:-11] -> Effects
			[-10:0] -> Others
		]]
		ui.addTextArea(0, "", n, 247, 45, 306, 306, mode.chess.colors.background, mode.chess.colors.background, 1, true)
		for row = 1, 8 do
			for column = 1, 8 do
				mode.chess.uiupdateSquare(row, column, n)
			end
		end
	end,