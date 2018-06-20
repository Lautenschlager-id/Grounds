	killOutOfRange = function()
		local gift = mode.presents.gifts[mode.presents.currentGift] - 2099
		for k,v in next,tfm.get.room.playerList do
			if not v.isDead then
				if v.x >= (gift * 120) and v.x <= (gift * 120 + 80) and v.y > 267 then
					mode.presents.info[k].gifts = mode.presents.info[k].gifts + 1
					tfm.exec.setPlayerScore(k,1,true)
				else
					tfm.exec.killPlayer(k)
				end
			end
		end
	end,