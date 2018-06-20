	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+",string.lower)
		if p[1] == "title" and p[2] and system.roomAdmins[n] then
			mode.chat.chatTitle = string.sub(table.concat(p," ",nil,2),1,40)
			mode.chat.displayChat()
		elseif p[1] == "np" and p[2] then
			tfm.exec.chatMessage(string.format("<S>%s %s %s",string.sub(p[2],1,1) == "@" and p[2] or "@" .. p[2],system.getTranslation().loadmap,n))
			tfm.exec.newGame(p[2])
		elseif p[1] == "sha" then
			mode.chat.hasShaman = not mode.chat.hasShaman
			
			tfm.exec.chatMessage("<S>• " .. system.getTranslation().shaman .. " " .. system.getTranslation()[(mode.chat.hasShaman and "disabled" or "enabled")],n)
			tfm.exec.disableAutoShaman(mode.chat.hasShaman)
		elseif p[1] == "new" then
			mode.chat.autoNeWGame = not mode.chat.autoNeWGame
		
			tfm.exec.chatMessage("<S>• " .. system.getTranslation().newGame .. " " .. system.getTranslation()[(mode.chat.autoNeWGame and "disabled" or "enabled")],n)
			tfm.exec.disableAutoNewGame(mode.chat.autoNeWGame)
			tfm.exec.disableAutoTimeLeft(mode.chat.autoNeWGame)
		elseif string.sub(c,1,6) == "unlock" then
			tfm.exec.chatMessage("<J>" .. string.format(system.getTranslation().title,n,string.sub(c,8)),n)
		end
	end,