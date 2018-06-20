	eventPlayerWon = function(n)
		mode.sharpie.podium = mode.sharpie.podium + 1
		if mode.sharpie.podium == 1 then
			if mode.sharpie.firstRow[1] == n then
				mode.sharpie.firstRow[2] = mode.sharpie.firstRow[2] + 1
				
				if mode.sharpie.totalPlayers > 3 then
					local msg = system.getTranslation().first
					tfm.exec.chatMessage("<G># <ROSE>" .. (msg[mode.sharpie.firstRow[2] - 1] or table.random({msg[2],msg[3],msg[6],msg[13],msg[15]})),n)
				end
			else
				mode.sharpie.firstRow = {n,1}
			end

			tfm.exec.setPlayerScore(n,(mode.sharpie.firstRow[2]+1) * 5,true)

			tfm.exec.chatMessage(string.format("<J>%s %s! %s",n,system.getTranslation().won,mode.sharpie.firstRow[2] > 1 and "("..mode.sharpie.firstRow[2]..")" or ""))
		else
			tfm.exec.setPlayerScore(n,5,true)
		end
	end,
