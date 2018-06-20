	eventEmotePlayed = function(n, t)
		if t == 8 then
			mode.chess.eventKeyboard(n, 32, nil, tfm.get.room.playerList[n].x)
		end
	end,