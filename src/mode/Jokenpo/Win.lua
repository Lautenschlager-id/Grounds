	decision = function()
		for i = 1,2 do
			mode.jokenpo.players[i].obj = mode.jokenpo.players[i].obj ~= 0 and mode.jokenpo.players[i].obj or false
			if mode.jokenpo.players[i].obj then
				mode.jokenpo.players[i].remId = tfm.exec.addShamanObject(mode.jokenpo.objects[mode.jokenpo.players[i].obj],({350,455})[i],200)
			end
		end

		local winner = ((mode.jokenpo.players[1].obj and mode.jokenpo.players[2].obj) and ((3 + mode.jokenpo.players[1].obj - mode.jokenpo.players[2].obj) % 3) or mode.jokenpo.players[1].obj and 1 or mode.jokenpo.players[2].obj and 2 or 0)
		
		if winner == 0 then
			mode.jokenpo.tie = mode.jokenpo.tie + 1
			tfm.exec.chatMessage("<CE>[•] <J>" .. system.getTranslation().tie)
			
			for k,v in next,mode.jokenpo.players do
				tfm.exec.playEmote(v.name,mode.jokenpo.emote.tie)
			end
		else
			mode.jokenpo.players[winner].score = mode.jokenpo.players[winner].score + 1
			tfm.exec.playEmote(mode.jokenpo.players[winner].name,mode.jokenpo.emote.victory)
			
			local looser = (winner == 1 and 2 or 1)
			local looserEmote = mode.jokenpo.emote.fail
			if not mode.jokenpo.players[looser].obj then
				looserEmote = mode.jokenpo.emote.no
			end
			tfm.exec.playEmote(mode.jokenpo.players[looser].name,looserEmote)

			tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[winner].color .. mode.jokenpo.players[winner].name .. " " .. system.getTranslation().won)
		end
		
		ui.addTextArea(5,string.format("<font size='50'><p align='center'>%s%d <PT>| <J>%d <PT>| %s%s",mode.jokenpo.players[1].color,mode.jokenpo.players[1].score,mode.jokenpo.tie,mode.jokenpo.players[2].color,mode.jokenpo.players[2].score),nil,5,270,795,nil,1,1,0,true)
	end,