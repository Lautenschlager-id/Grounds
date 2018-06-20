	eventNewGame = function()
		if mode.jokenpo.playing then
			for k,v in next,tfm.get.room.playerList do
				if not table.find(mode.jokenpo.players,k,"name") then
					tfm.exec.killPlayer(k)
				end
			end
		end
	
		mode.jokenpo.colors = {0xE3454D,0x4577E3,0x45E374}	
		xml.attribFunc(tfm.get.room.xmlMapInfo.xml or "",{
			[1] = {
				attribute = "o",
				func = function(color)
					local c = string.split(color,"[^,]+",function(o)
						return string.match(o,"#?(.+)")
					end)
					
					for i = 1,#c do
						mode.jokenpo.colors[i] = tonumber(c[i],16)
					end
				end
			}
		})
		
		mode.jokenpo.buildSquares(mode.jokenpo.colors)
		mode.jokenpo.uiinfo()
	end,