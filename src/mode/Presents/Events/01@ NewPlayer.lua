	eventNewPlayer = function(n)
		if not mode.presents.info[n] then
			mode.presents.info[n] = {
				rounds = 0,
				gifts = 0,
				victories = 0,
			}
		end
		
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
		
		if mode.presents.isRunning then
			ui.addTextArea(0,"<p align='center'><font size='20'><VP>" .. system.getTranslation().appear,n,216,65,365,35,1,1,1,true)
		else
			tfm.exec.respawnPlayer(n)
		end
		
		ui.banner("15d75ac29b7",200,150,n)
	end,