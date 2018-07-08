mode.chess = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to the module! Sit on an armchair and enjoy the game with a friend!\n\tYou, chess lord, report any bug to Bolodefchoco!",
		
			-- Info
			team = "%s is playing with the %s pieces",
			space = "Space",
		
			-- System
			move = "You can only move the %s pieces!",
			win = "%s pieces won!",
			left = "%s left the game",
			turn = "%s's turn.",
			promo = "Pawn Promotion",
			
			-- Colors
			colors = {"White", "Black"},
			
			-- Promo Pieces
			pieces = {
				queen = "Queen",
				rook = "Rook",
				bishop = "Bishop",
				knight = "Knight",
			},
		},
		br = {
			welcome = "Bem-vindo ao módulo! Sente numa poltrona e aproveite o jogo com um amigo!\n\tVocê, senhor do xadrez, reporte qualquer bug para Bolodefchoco!",
		
			team = "%s está jogando com as peças de cor %s",
			space = "Espaço",
		
			move = "Você só pode mover as peças de cor %s!",
			win = "As peças de cor %s venceram!",
			left = "%s deixou o jogo",
			turn = "Vez das peças de cor %s.",
			promo = "Promoção de Peão",
			
			colors = {"Branca", "Preta"},
			
			pieces = {
				queen = "Rainha",
				rook = "Torre",
				bishop = "Bispo",
				knight = "Cavalo",
			},
		},
	},
	langue = "",
	--[[ Board ]]--
	setBoard = function()
		return
		{
			{'♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜'},
			{'♟', '♟', '♟', '♟', '♟', '♟', '♟', '♟'},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'♙', '♙', '♙', '♙', '♙', '♙', '♙', '♙'},
			{'♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'}
		}
	end,
	--[[ Data ]]--
	board = {},
	colors = {
		background = 0x2F363F,
		whiteSquare = 0xFFCE9E,
		whitePiece = 'FFFFFF',
		blackSquare = 0xD18B47,
		blackPiece = '1',
		specialMove = 0xB300EF,
		emptyMove = 0x2ECF73,
		captureMove = 0xAF2A2A,
		lastMove = 0xFFCF5F,
		selectedPiece = '<PT>',
	},
	pieces = {
		king = 1,
		queen = 2,
		rook = 3,
		bishop = 4,
		knight = 5,
		pawn = 6
	},
	players = {},
	moveTimer = 0,
	canStart = false,
	currentPlayer = 2,
	currentPlayerColor = "",
	lastMove = {},
	coloredSquares = {},
	--[[ StringRef ]]--
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
	--[[ System ]]--
	-- playerInfo
	playerInfo = function()
		return 
		{
			[1] = { name = "", pieces = 16, castling = {true, true}, lastMove = "" },
			[2] = { name = "", pieces = 16, castling = {true, true}, lastMove = "" },
		}
	end,
	-- White Piece
	isWhitePiece = function(p)
		p = string.byte(p, 3, 3)
		return p > 147 and p < 154
	end,
	-- Square Exists
	existSquare = function(row, column)
		return mode.chess.board[row] and mode.chess.board[row][column]
	end,
	-- isPiece
	isPieceSquare = function(row, column)
		return mode.chess.existSquare(row, column) and mode.chess.board[row][column] ~= ''
	end,
	-- Piece Different Color
	pieceDifColor = function(p1, p2)
		return mode.chess.isWhitePiece(p1) ~= mode.chess.isWhitePiece(p2)
	end,
	-- Piece ID
	pieceID = function(p)
		return (string.byte(p, 3, 3) - 148) % 6 + 1
	end,
	-- Check Capture
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
	-- Turn
	changeTurn = function()
		mode.chess.currentPlayer = (mode.chess.currentPlayer == 1 and 2 or 1)
		mode.chess.currentPlayerColor = system.getTranslation().colors[mode.chess.currentPlayer]
		
		local text = "<B><p align='center'><font size='18'>" .. string.format(system.getTranslation().turn, mode.chess.currentPlayerColor)
		mode.chess.border(text)
	end,
	--[[ Refresh ]]--
	refresh = function()
		mode.chess.canStart = false

		mode.chess.uiclearColoredSquares()
		
		for k, v in next, mode.chess.players do
			tfm.exec.movePlayer(v.name, 400, 375)
		end
		
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()

		mode.chess.currentPlayer = 2
		for i = 3, 5 do
			ui.removeTextArea(-i)
		end
		
		for i = 1, 2 do
			ui.addTextArea(-i, "<font color='#" .. system.getTranslation().colors[i] .. "'><p align='center'><font size='20'>[" .. system.getTranslation().space .. "]", nil, 5 + (i - 1) * 595, 180, 200, nil, 1, 1, 0, true)
		end
		
		mode.chess.uiboard()
	end,
	--[[ UI ]]--
	-- Border
	border = function(text)
		ui.addTextArea(-4, "<font color='#1'>" .. text, nil, 5, 367, 792, nil, 1, 1, 0, true)
		ui.addTextArea(-5, "<PS>" .. text, nil, 5, 365, 790, nil, 1, 1, 0, true)
	end,
	-- Clear Squares
	uiclearColoredSquares = function()
		for k, v in next, table.copy(mode.chess.coloredSquares) do
			if v then
				ui.removeTextArea(k)
				mode.chess.coloredSquares[k] = nil
			end
		end
	end,
	-- Update Square
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
	-- Update Move
	uiupdateLastMove = function(...)
		if mode.chess.lastMove[1] and mode.chess.lastMove[2] then
			mode.chess.uiupdateSquare(mode.chess.lastMove[1], mode.chess.lastMove[2])
		end
		mode.chess.lastMove = {...}
	end,
	-- Board
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
	--[[ Init ]]--
	init = function()
		mode.chess.stringReference.realReference()
	
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()
	
		for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
			tfm.exec["disable" .. v]()
		end

		tfm.exec.newGame(1995980)
		
		system.roomAdmins["Billysmille#0000"] = true
		
		mode.chess.refresh()
	end,
	--[[ Events ]]--
	-- TextAreaCallback
	eventTextAreaCallback = function(i, n, c)
		if mode.chess.canStart and mode.chess.players[mode.chess.currentPlayer].name == n and os.time() > mode.chess.moveTimer then
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
	-- Loop
	eventLoop = function()
		if not mode.chess.canStart then
			local totalPlayers = 0
			for i = 1, 2 do
				if mode.chess.players[i].name == "" then
					tfm.exec.addShamanObject(0, 40 + 720 * (i - 1), 200)
				else
					totalPlayers = totalPlayers + 1
				end
			end
			
			if totalPlayers == 2 then
				mode.chess.canStart = true
				mode.chess.changeTurn()
			end
		end
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		mode.chess.uiboard(n)
		tfm.exec.respawnPlayer(n)
		system.bindKeyboard(n, 32, true, true)
		tfm.exec.chatMessage("<S>[#Chess] " .. system.getTranslation().welcome, n)
	end,
	-- Keyboard
	eventKeyboard = function(n, k, d, x)
		for k, v in next, mode.chess.players do
			if v.name == n then
				return
			end
		end
		
		local id = x < 76 and 1 or x > 724 and 2 or 0
		if id > 0 then
			if mode.chess.players[id].name == "" then
				mode.chess.players[id].name = n
				local color = system.getTranslation().colors[id]
				ui.addTextArea(-id, "<font color='#" .. mode.chess.colors[(id == 1 and "white" or "black") .. "Piece"] .. "' size='20'><p align='center'>" .. n .. "\n«" .. color .. "»", nil, 5 + (id - 1) * 595, 180, 200, nil, 1, 1, 0, true)
				tfm.exec.playEmote(n, 8)
				tfm.exec.chatMessage("<S>[#Chess] " .. string.format(system.getTranslation().team , n, color))
			end
		end
	end,
	-- EmotePlayed
	eventEmotePlayed = function(n, t)
		if t == 8 then
			mode.chess.eventKeyboard(n, 32, nil, tfm.get.room.playerList[n].x)
		end
	end,
	-- PlayerLeft
	eventPlayerLeft = function(n)
		for i = 1, 2 do
			if mode.chess.players[i].name == n then
				tfm.exec.chatMessage("<S>[#Chess] " .. string.format(system.getTranslation().left, n))
				mode.chess.refresh()
				break
			end
		end
	end,
	-- PlayerDied
	eventPlayerDied = tfm.exec.respawnPlayer,
}