	uiinfo = function()
		ui.addTextArea(0,"<p align='center'><font size='35'><J>"..math.floor(mode.jokenpo.timer),nil,380,85,40,40,1,1,0,true)
		ui.addTextArea(1,"<p align='center'><font size='25'><J><B>X</B><font size='13'>\n"..string.format("%02d",mode.jokenpo.tie),nil,380,207,40,nil,1,1,0,true)
		
		for k,v in next,mode.jokenpo.players do
			ui.addTextArea(v.id + 1,"<p align='center'>"..v.name.."\n"..string.format("%02d",v.score),nil,v.x,165,105,nil,1,1,0,true)
		end
		
		ui.setMapName("<PT>#Jokenpo   <G>|   <N>" .. system.getTranslation().round .. " : <V>" .. mode.jokenpo.round .. mode.jokenpo.displayNames() .. "<")
	end,