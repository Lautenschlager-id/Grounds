	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+",string.lower)
		if p[1] == "p" then
			p[2] = p[2] and string.nick(p[2]) or n
			if mode.click.info[p[2]] then
				ui.addTextArea(2,"<p align='center'><font size='18'><a:active><a href='event:close'>"..p[2].."</a><p align='left'><font size='13'>\n<J>" .. string.format(system.getTranslation().profile,mode.click.info[p[2]].totalClick,mode.click.info[p[2]].highScore,mode.click.info[p[2]].victories),n,620,295,175,100,1,1,1,true)
			end
		end
	end,