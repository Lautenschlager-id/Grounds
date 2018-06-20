	victory = function(noone)
		noone = noone or system.players() < 1
		
		if noone then
			tfm.exec.chatMessage("<J>" .. system.getTranslation().nowinner)
			mode.presents.chooseTimer = 0
			mode.presents.blockTimer = 0
		else
			tfm.exec.chatMessage("<S>" .. table.concat(system.players(true),"<J>, <S>",function(k,v)
				mode.presents.info[v].victories = mode.presents.info[v].victories + 1
				return v
			end) .. " <J>" .. system.getTranslation().won)
		end
		mode.presents.newMapTimer = 10.5
	end,