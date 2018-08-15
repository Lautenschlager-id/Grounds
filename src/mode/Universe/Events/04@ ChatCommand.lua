	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+")
		
		if p[1] == "profile" then
			if p[2] then
				p[2] = string.lower(p[2])
				for k,v in next,mode.universe.cosmos do
					if string.lower(v.name) == p[2] then
						mode.universe.eventTextAreaCallback(nil,n,"profile.open." .. v.className .. "." .. k)
						break
					end
				end
			else
				mode.universe.eventKeyboard(n,string.byte("P"))
			end
			return
		end
		
		if system.roomAdmins[n] then
			if p[1] == "name" then
				if p[2] then
					mode.universe.eventPopupAnswer(0,n,table.concat(p," ",2))
				else
					ui.addPopup(0,2,"<p align='center'><font color='#CF50DB'>" .. system.getTranslation().sysName.choose,n,200,150,400,true)
				end
				return
			end
		end
	end,
