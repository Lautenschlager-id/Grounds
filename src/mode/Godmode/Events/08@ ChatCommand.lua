	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+",string.lower)
		if p[1] == "info" then
			tfm.exec.chatMessage("<J>" .. system.getTranslation().info,n)
		elseif p[1] == "p" then
			if p[2] then
				p[2] = string.nick(p[2])
				if mode.godmode.info[p[2]] then
					mode.godmode.profile(n,p[2])
				end
			else
				mode.godmode.profile(n,n)
			end
		elseif p[1] == "np" and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 1)) then
			tfm.exec.newGame(p[2] or "#4")
		end
	end,