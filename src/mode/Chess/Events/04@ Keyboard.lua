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