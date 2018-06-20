	eventNewPlayer = function(n)
		tfm.exec.chatMessage("<CE>[•] " .. system.getTranslation().welcome,n)
	
		for k,v in next,{32,string.byte("BNM",1,3)} do
			system.bindKeyboard(n,v,true,true)
		end
		
		if mode.jokenpo.playing then
			mode.jokenpo.round = mode.jokenpo.round + 1
		else
			tfm.exec.respawnPlayer(n)
		end
		
		mode.jokenpo.buildSquares(mode.jokenpo.colors)
		mode.jokenpo.uiinfo()
	end,