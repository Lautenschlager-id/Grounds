	setPlayerTools = function(k)
		mode.xmas.info[k] = {
			db = {
				eventNoelGifts = {0,0},
			},
			catch = 0,
			lastColor = 0xB73535,
		}
		if not tfm.get.room.playerList[k].isDead then
			system.bindKeyboard(k,32,true,true)
		end
		mode.xmas.updateBar(k)
	end,