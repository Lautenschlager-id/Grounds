	eventNewGame = function()
		if #mode.godmode.lastShaman > 0 then
			for k,v in next,mode.godmode.lastShaman do
				mode.godmode.info[v].cheeseMice = mode.godmode.info[v].cheeseMice + mode.godmode.savedMice
				mode.godmode.info[v].deathMice = mode.godmode.info[v].deathMice + mode.godmode.deadMice
				tfm.exec.chatMessage("<CH>" .. string.format(system.getTranslation().xp,mode.godmode.savedMice,mode.godmode.deadMice),v)
				
				
				for i = #mode.godmode.titles,1,-1 do
					if mode.godmode.info[v].cheeseMice >= mode.godmode.titles[i] then
						if mode.godmode.info[v].title ~= mode.godmode.title[i] then
							mode.godmode.info[v].title = mode.godmode.title[i]
							tfm.exec.chatMessage("<J>" .. string.format(system.getTranslation().unlock,v,mode.godmode.title[i]))
						end
						break	
					end
				end
			end
		end
		
		mode.godmode.savedMice = 0
		mode.godmode.deadMice = 0
		
		mode.godmode.updateMenu()

		for k,v in next,mode.godmode.info do
			v.usedNails = 0
		end
		for k,v in next,mode.godmode.getShaman() do
			mode.godmode.info[v].roundSha = mode.godmode.info[v].roundSha + 1
			tfm.exec.chatMessage("<CH>" .. system.getTranslation().shaman,v)
		end
		
		tfm.exec.setGameTime(183)
	end,