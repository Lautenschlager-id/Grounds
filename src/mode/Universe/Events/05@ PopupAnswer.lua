	eventPopupAnswer = function(i,n,a)
		if i == 0 then
			if a ~= "" then
				mode.universe.systemName = string.sub(a,1,20)
				tfm.exec.chatMessage("<font color='#CF50DB'>" .. string.format(system.getTranslation().sysName.new,mode.universe.systemName))
			end
		else
			if a == "yes" then
				local destroyable,moonMessage = true,false
				if mode.universe.cosmos[i].id == mode.universe.cosmos[1].id then 
					for id = 2,mode.universe.orbit[4] do
						--[[if mode.universe.cosmos[id].class < 3 then
							mode.universe.cosmos[id]:destroy()
						end]]
						if mode.universe.cosmos[id].display then
							destroyable = false
							break
						end
					end
				else
					if mode.universe.cosmos[i].class == 2 then
						if #mode.universe.cosmos[i].moons > 0 then
							moonMessage = true
						end
					end
				end
				if destroyable then
					mode.universe.cosmos[i]:destroy()
					
					if moonMessage then
						tfm.exec.chatMessage("<R>" .. system.getTranslation().moonDestroyed,n)
					end
				else
					tfm.exec.chatMessage("<R>" .. system.getTranslation().cantDestroy,n)
				end
			end
			mode.universe.uicloseSplash(n,true)
		end
	end,
