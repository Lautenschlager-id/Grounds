	eventNewPlayer = function(n)
		system.bindMouse(n,true)
		if not mode.click.info[n] then
			mode.click.info[n] = {
				canPlay = false,
				totalClick = 0,
				roundClick = 0,
				highScore = 0,
				victories = 0,
			}
		end
		if not mode.click.circle.status then
			tfm.exec.respawnPlayer(n)
			mode.click.info[n].canPlay = true
		end
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
	end,