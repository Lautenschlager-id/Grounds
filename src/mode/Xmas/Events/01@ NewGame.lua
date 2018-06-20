	eventNewGame = function()
		mode.xmas.resetNoel()

		mode.xmas.start = true
		
		local _,aP = system.players()
		mode.xmas.amountPlayers = aP
		
		tfm.exec.setGameTime(150)
		tfm.exec.snow(150)
		mode.xmas.currentTime = 0
		mode.xmas.leftTime = 150
		
		tfm.exec.addImage("158c1feaf90.png","?0",0,0)
		
		ui.setMapName("<J>"..table.random({"Nöel","Christmas","Bolodefchoco","Lua event","#xmas","Bogkitty"}).." <G>- @"..table.random({666,404,801,os.date("%Y"),0,1}))
		ui.setShamanName("<R>S4NT4 M4U5")
		
		for k,v in next,tfm.get.room.playerList do
			mode.xmas.setPlayerTools(k)
		end
		tfm.exec.chatMessage(string.format("<V><B>[^_^]</B></V> <BV>%s</BV>\n<V><B>[S4NT4 M4U5]</B></V> <R>%s</R>",system.getTranslation()[2],string.upper(system.getTranslation()[1])))
	end,