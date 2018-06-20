	eventKeyboard = function(n,k)
		if k == 80 then
			mode.godmode.profile(n,n)
		elseif not tfm.get.room.playerList[n].isDead and tfm.get.room.playerList[n].isShaman then
			if table.find({66,67,74,78,86},k) then -- B;C;V;N;J
				mode.godmode.info[n].usedNails = mode.godmode.info[n].usedNails + 1
				if mode.godmode.info[n].usedNails > 4 then
					tfm.exec.killPlayer(n)
					tfm.exec.chatMessage("<R>" .. system.getTranslation().fail .. " " .. system.getTranslation().kill,n)
				else
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation().nail,5 - mode.godmode.info[n].usedNails),n)
				end
			end
		end
	end,