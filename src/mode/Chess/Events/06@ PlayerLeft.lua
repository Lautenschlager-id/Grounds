	eventPlayerLeft = function(n)
		for i = 1, 2 do
			if mode.chess.players[i].name == n then
				tfm.exec.chatMessage("<S>[#Chess] " .. string.format(system.getTranslation().left, n))
				mode.chess.refresh()
				break
			end
		end
	end,