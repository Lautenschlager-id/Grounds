	eventNewPlayer = function(n)
		system.bindKeyboard(n,string.byte("P"),true,true)
		system.bindKeyboard(n,46,true,true) -- Delete
		
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation().welcome,n)
		
		ui.banner("15db5b6ab36",210,120,n,10)
		
		if system.roomAdmins[n] and system.roomAttributes ~= 1 and system.roomNumber ~= 801 then
			mode.universe.newCreator(n)
		end
		
		tfm.exec.addImage("15db9e67479.png","&1",5,30,n)
		
		if mode.universe.canInsertBackground then
			tfm.exec.respawnPlayer(n)
			mode.universe.setBackground(n)
		end
	end,
