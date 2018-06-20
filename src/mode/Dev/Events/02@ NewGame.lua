	eventNewGame = function()
		mode.dev.objects = {}
		
		if mode.dev.runXml then
			system.newTimer(function()
				tfm.exec.newGame(tfm.get.room.xmlMapInfo.xml or "")
			end,7000,false)
			ui.addTextArea(0,"",nil,-1500,-1500,3000,3000,0x6A7495,0x6A7495,1,true)
		else
			ui.removeTextArea(0,nil)
			for k,v in next,mode.dev.mapImages do
				tfm.exec.removeImage(v)
			end
			
			mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
			
			if tfm.get.room.xmlMapInfo.xml then
				xml.attribFunc(tfm.get.room.xmlMapInfo.xml,{
				
					[1] = {
						attribute = "img",
						func = function(value)
							for k,v in next,string.split(value,"[^;]+") do
								local info = string.split(v,"[^,]+") -- "img.png,x or 0,y or 0,0/1 (foreground)"
								info[4] = math.setLim(tonumber(info[4]) or 0,0,1)
								
								mode.dev.mapImages[#mode.dev.mapImages + 1] = tfm.exec.addImage(info[1] .. ".png",(({"?","!"})[info[4] + 1]) .. k,tonumber(info[2]) or 5,tonumber(info[3]) or 30)	
							end
						end
					}
				})
			end
		end
		mode.dev.runXml = false
	end,