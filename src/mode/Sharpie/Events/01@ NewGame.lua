	eventNewGame = function()
		mode.sharpie.podium = 0
		
		local currentXml = tfm.get.room.xmlMapInfo
		currentXml = currentXml and currentXml.xml or ""
		
		mode.sharpie.mapInfo = {800,400}
		mode.sharpie.flyPower = -50
		
		xml.attribFunc(currentXml or "",{
			[1] = {
				attribute = "G",
				func = function(value)
					value = string.split(value,"[^,]+")
					value = tonumber(value[2]) or 0
					mode.sharpie.flyPower = value < 0 and 50 or -50
				end
			},
			[2] = {
				attribute = "L",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[1] = value
					end
				end
			},
			[3] = {
				attribute = "H",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[2] = value
					end
				end
			},
			[4] = {
				attribute = "P",
				func = function()
					table.foreach(tfm.get.room.playerList,tfm.exec.killPlayer)
					tfm.exec.setGameTime(5,false)
				end
			},
		})
		
		mode.sharpie.hardmode = math.random(10) == 6
		if mode.sharpie.hardmode then
			tfm.exec.chatMessage("<CH>" .. system.getTranslation().hardMode)
		end
	end,
