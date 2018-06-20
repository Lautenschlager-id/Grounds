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