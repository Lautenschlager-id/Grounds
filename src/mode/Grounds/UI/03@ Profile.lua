	uiprofile = function(n,p)
		if mode.grounds.info[p].groundsDataLoaded then
			local nickSize = #p > 12 and 10 or 15
			ui.addTextArea(14,"<p align='center'><B><R><a href='event:profile.close'>X",n,513,115,20,20,1,1,1,true)
			ui.addTextArea(15,"<p align='center'><B><PS><a href='event:profile.open'>•",n,513,145,20,20,1,1,1,true)
			ui.addTextArea(16,"<p align='center'><font size='16'><B><V>"..p.."</V></B> "..(mode.grounds.info[p].isOnline and "<VP>" or "<R>").."•</font></p><p align='left'><font size='12'>\n<N>" .. string.format(system.getTranslation(n).profile,"<V>#"..mode.grounds.info[p].ranking,"<V>"..mode.grounds.info[p].stats.rounds,"<V>"..mode.grounds.info[p].stats.podiums,"<V>"..mode.grounds.info[p].stats.deaths,"<J>$"..mode.grounds.info[p].stats.groundsCoins),n,290,115,220,160,0x073247,1,1,true)
		end
	end,