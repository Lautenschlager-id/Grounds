	eventNewPlayer = function(n)
		tfm.exec.chatMessage("<CE>" .. system.getTranslation().welcome,n)

		system.bindKeyboard(n,32,true,true)
		
		ui.banner("15d60d8e5b8",130,100,n)
	end,
