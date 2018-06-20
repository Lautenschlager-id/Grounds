	eventTextAreaCallback = function(i, n, c)
		if mode.chess.players[mode.chess.currentPlayer].name == n and os.time() > mode.chess.moveTimer then
			mode.chess.moveTimer = os.time() + 250
		
			c = string.split(c, "[^_]+", function(value)
				return tonumber(value) or value
			end)
			
			local row, column = c[2], c[3]
			
			mode.chess.uiclearColoredSquares()
			if c[1] == "transform" then
				ui.removeTextArea(-3, n)
				mode.chess.board[row][column] = string.char(226, 153, (c[4] == 2 and c[5] + 6 or c[5]))
				
				mode.chess.uiupdateSquare(row, column, nil, mode.chess.colors.lastMove, nil, true) 
				
				mode.chess.changeTurn()
			elseif c[1] == "kingpass" then
				local initialSquare = (c[4] == "left" and -1 or 1)
				local finalSquare = column + (c[4] == "right" and 3 or -4)
				
				local iniTwo = column + (2 * initialSquare)
				local iniSig = column + (1 * initialSquare)
				
				mode.chess.board[row][iniTwo] = mode.chess.board[row][column]
				mode.chess.board[row][column] = ''
				
				mode.chess.board[row][iniSig] = mode.chess.board[row][finalSquare]
				mode.chess.board[row][finalSquare] = ''
				
				mode.chess.players[mode.chess.currentPlayer].castling = {false, false}
				mode.chess.players[mode.chess.currentPlayer].lastMove = ''
				
				mode.chess.uiupdateLastMove(row, iniTwo)
				
				mode.chess.uiupdateSquare(row, iniTwo, nil, mode.chess.colors.lastMove, nil, true)
				mode.chess.uiupdateSquare(row, column)
				mode.chess.uiupdateSquare(row, iniSig)
				mode.chess.uiupdateSquare(row, finalSquare)
				
				mode.chess.changeTurn()
			else
				local piece = mode.chess.pieceID(mode.chess.board[row][column])
			
				if c[1] == "square" then
					local whitePiece = mode.chess.isWhitePiece(mode.chess.board[row][column])
					if (mode.chess.currentPlayer == 1 and not whitePiece) or (mode.chess.currentPlayer == 2 and whitePiece) then
						tfm.exec.chatMessage("<S>[#Chess] " .. string.format(system.getTranslation().move, mode.chess.currentPlayerColor), n)
						return
					end

					-- Highlights the piece you've selected
					mode.chess.uiupdateSquare(row, column, n, nil, mode.chess.stringReference.squareFormat .. mode.chess.colors.selectedPiece .. mode.chess.board[row][column])
					
					local dir = whitePiece and -1 or 1
					if piece == mode.chess.pieces.pawn then
						-- In front, 1 or 2 squares
						for i = 1, ((row == 2 or row == 7) and 2 or 1) do
							local newRow = row + i * dir
							
							if mode.chess.isPieceSquare(newRow, column) then
								break
							end
							
							mode.chess.uiupdateSquare(newRow, column, n, ((newRow == 1 or newRow == 8) and mode.chess.colors.specialMove or mode.chess.colors.emptyMove), string.format(mode.chess.stringReference.select, row, column, newRow, column))
						end
						
						-- En passant
						if mode.chess.players[3 - mode.chess.currentPlayer].lastMove ~= "" then
							local grid = string.split(mode.chess.players[3 - mode.chess.currentPlayer].lastMove, "[^_]+", tonumber)
							if grid[1] and grid[2] then
								for i = -1, 1, 2 do
									if grid[1] == row and grid[2] + i == column then
										mode.chess.uiupdateSquare(grid[1] + dir, grid[2], n, mode.chess.colors.specialMove, string.format(mode.chess.stringReference.piece, row, column, grid[1], grid[2] .. "_" .. (grid[1] + dir), "\n"))
										break
									end
								end
							end
						end
					end
					if piece == mode.chess.pieces.rook or piece == mode.chess.pieces.queen or piece == mode.chess.pieces.king then
						local range = (piece == mode.chess.pieces.king and 1 or 8)
						
						-- Horizontal and Vertical
						local coord = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}}
						for i = 1, 4 do
							for j = 1, range do
								local newRow = row + j * coord[i][1]
								local newColumn = column + j * coord[i][2]
								
								if mode.chess.checkCapture(n, row, column, newRow, newColumn) then
									break
								end
							end
						end
					end
					if piece == mode.chess.pieces.knight then
						-- L Shape
						local coord = {{-2, -1}, {-1, -2}, {-2, 1}, {-1, 2}, {1, -2}, {2, -1}, {1, 2}, {2, 1}}
						for i = 1, 8 do
							local newRow = row + coord[i][1]
							local newColumn = column + coord[i][2]
							
							mode.chess.checkCapture(n, row, column, newRow, newColumn)
						end
					end
					if piece == mode.chess.pieces.bishop or piece == mode.chess.pieces.queen or piece == mode.chess.pieces.king or piece == mode.chess.pieces.pawn then
						local isPawn = piece == mode.chess.pieces.pawn
						local range = ((piece == mode.chess.pieces.king or isPawn) and 1 or 8)
						
						-- Diagonal
						local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
						for i = 1, 4 do
							for j = 1, range do
								local newRow = row + j * coord[i][1]
								local newColumn = column + j * coord[i][2]
								
								local check = mode.chess.checkCapture(n, row, column, newRow, newColumn, (not isPawn or coord[i][1] == dir), not isPawn)
								if check then
									break
								end
							end
						end
					end
					if piece == mode.chess.pieces.king then
						-- Castling
						local d = 1
						for i = 1, 2 do
							if mode.chess.players[mode.chess.currentPlayer].castling[i] and not mode.chess.isPieceSquare(row, column + d) and not mode.chess.isPieceSquare(row, column + (d * 2)) then
								if d > 0 or not mode.chess.isPieceSquare(row, column - 3) then
									mode.chess.uiupdateSquare(row, column + (d > 0 and 2 or -3), n, mode.chess.colors.specialMove, string.format(mode.chess.stringReference.castling, row, column, (d > 0 and "right" or "left")))
								end
							end
							d = -d
						end
					end
				elseif c[1] == "select" then
					local newRow, newColumn = c[4], c[5]
				
					mode.chess.uiupdateLastMove(c[6] or newRow, newColumn)
					
					-- Checks the attack
					local checkmate = false
					if mode.chess.isPieceSquare(row, column) and mode.chess.isPieceSquare(newRow, newColumn) and mode.chess.pieceDifColor(mode.chess.board[row][column], mode.chess.board[newRow][newColumn]) then
						mode.chess.players[3 - mode.chess.currentPlayer].pieces = mode.chess.players[3 - mode.chess.currentPlayer].pieces - 1
						checkmate = mode.chess.pieceID(mode.chess.board[newRow][newColumn]) == mode.chess.pieces.king
					end
					
					-- Updates the squares
					mode.chess.board[c[6] or newRow][newColumn] = mode.chess.board[row][column]
					if c[6] then
						mode.chess.board[newRow][newColumn] = ''
						mode.chess.uiupdateSquare(c[6], newColumn, nil, mode.chess.colors.lastMove, nil, true) 
					end
					mode.chess.uiupdateSquare(newRow, newColumn, nil, (not c[6] and mode.chess.colors.lastMove or nil), nil, true)
					
					mode.chess.board[row][column] = ''
					mode.chess.uiupdateSquare(row, column)
					
					if checkmate then
						tfm.exec.chatMessage("<S>[#Chess] " .. string.format(system.getTranslation().win, mode.chess.currentPlayerColor))
						tfm.exec.setPlayerScore(n, 10, true)
						mode.chess.refresh()
						return
					end
					
					-- Sets the lastMove
					mode.chess.players[mode.chess.currentPlayer].lastMove = ((piece == mode.chess.pieces.pawn and math.abs(newRow - row) == 2) and (newRow .. "_" .. newColumn) or '')

					-- Pawn promotion
					if piece == mode.chess.pieces.pawn then
						if newRow == 1 or newRow == 8 then
							local text = "<textformat leading='40'><p align='center'><font size='25'>" .. string.upper(system.getTranslation().promo) .. "<font size='15'>\n<B>"
							for k, v in next, {
								{'<ROSE>' .. system.getTranslation().pieces.queen, 149},
								{'<J>' .. system.getTranslation().pieces.rook, 150},
								{'<PT>' .. system.getTranslation().pieces.bishop, 151},
								{'<BV>' .. system.getTranslation().pieces.knight, 152}
							} do
								text = text .. string.format("<a href='event:transform_%s_%s_%s_%s'>%s\n", newRow, newColumn, mode.chess.currentPlayer, v[2], "<CH>" .. string.char(226, 153, v[2]) .. " " .. v[1] .. " <CH>" .. string.char(226, 153, v[2] + 6))
							end
							ui.addTextArea(-3, text, n, 247, 45, 306, 306, nil, nil, .9, true)
							mode.chess.border("<B><p align='center'><font size='18'>" .. system.getTranslation().promo .. " (" .. mode.chess.currentPlayerColor .. ")")
							return
						end
					-- Disable Castling
					elseif piece == mode.chess.pieces.king then
						mode.chess.players[mode.chess.currentPlayer].castling = {false, false}
					elseif piece == mode.chess.pieces.rook then
						if mode.chess.players[mode.chess.currentPlayer].castling[1] or mode.chess.players[mode.chess.currentPlayer].castling[2] then
							local pieceColumn = column == 1 and 1 or column == 8 and 2 or 0
							if pieceColumn > 0 then
								mode.chess.players[mode.chess.currentPlayer].castling[pieceColumn] = true
							end
						end
					end
					
					mode.chess.changeTurn()
				end
			end
		end
	end,