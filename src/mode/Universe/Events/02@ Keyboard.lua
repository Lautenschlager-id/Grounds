	eventKeyboard = function(n,k)
		if k == string.byte("O") and system.roomAdmins[n] then
			if mode.universe.info[n].creatorOpen then
				mode.universe.eventTextAreaCallback(i,n,"main.exit")
			else
				mode.universe.uicreator(n)
			end
			return
		elseif k == string.byte("P") then
			local allowed = true
			if mode.universe.info[n] and mode.universe.info[n].creatorOpen then
				allowed = false
			end
			if allowed then
				mode.universe.profile.uiprofile(n)
			end
			return
		elseif k == 46 then
			tfm.exec.respawnPlayer(n)
			return
		end
	end,
