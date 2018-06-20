	eventKeyboard = function(n,k,d,x,y)
		if k == 32 and #mode.jokenpo.players < 2 then
			for k,v in next,{{285,330,270},{515,330,425}} do
				if math.pythag(v[1],v[2],x,y,30) then
					if not table.find(mode.jokenpo.players,n,"name") then
						if not table.find(mode.jokenpo.players,k,"id") then
							mode.jokenpo.players[#mode.jokenpo.players + 1] = {
								name = n,
								x = v[3],
								score = 0,
								color = string.format("<font color='#%s'>",string.format("%x",mode.jokenpo.colors[k])),
								id = k,
								obj = 0,
								remId = nil,
							}
							
							tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[#mode.jokenpo.players].color .. string.format(system.getTranslation().guide,"B","N","M"),n)
							
							mode.jokenpo.uiinfo()
							tfm.exec.playEmote(n,mode.jokenpo.emote.sit)
						end
					end
				end
			end
			
			if #mode.jokenpo.players == 2 then
				table.sort(mode.jokenpo.players,function(p1,p2) return p1.id < p2.id end)
				mode.jokenpo.playing = true

				mode.jokenpo.round = mode.jokenpo.round + 1
				mode.jokenpo.uiinfo()
			end
		else
			if mode.jokenpo.playing then
				local foundObject,objectIndex = table.find({string.byte("BNM",1,3)},k)
				if foundObject then	
					local found,i = table.find(mode.jokenpo.players,n,"name")
					if found then
						i = mode.jokenpo.players[i]
						if i.obj == 0 then
							i.obj = objectIndex

							tfm.exec.chatMessage("<CE>[•] " .. i.color .. string.format(system.getTranslation().selected,system.getTranslation().items[objectIndex]),n)
						end
					end
				end
			end
		end
	end,
