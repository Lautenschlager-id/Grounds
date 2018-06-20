	uileaderboard = function()
		local data = {}
		for k,v in next,mode.click.info do
			if v.canPlay and v.roundClick > 0 then
				data[#data + 1] = {k,v.roundClick}
			end
			
			if v.highScore < v.roundClick then
				v.highScore = v.roundClick
			end
			v.totalClick = v.totalClick + v.roundClick
			v.roundClick = 0
		end
		
		table.sort(data,function(p1,p2) return p1[2] > p2[2] end)
		
		local str = ""
		for k,v in next,data do
			if k < 51 then
				if k == 1 then
					mode.click.info[v[1]].victories = mode.click.info[v[1]].victories + 1
					tfm.exec.chatMessage("<J>" .. v[1] .. " <G>" .. system.getTranslation().won)
					tfm.exec.setPlayerScore(v[1],1,true)
				end
				
				str = str .. string.format("<J>%s. <V>%s <BL>- <PT>%sP\n",k,v[1],v[2])
			end
		end
		
		ui.addTextArea(1,str,nil,5,30,250,330,1,1,.9,true)
	end,