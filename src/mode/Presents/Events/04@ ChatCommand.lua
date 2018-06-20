	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+",string.lower)
		if p[1] == "p" then
			p[2] = p[2] and string.nick(p[2]) or n
			if mode.presents.info[p[2]] then
				ui.addTextArea(1,"<p align='center'><font size='18'><a:active><a href='event:close'>"..p[2].."</a><p align='left'><font size='13'>\n<J>" .. string.format(system.getTranslation().profile,mode.presents.info[p[2]].rounds,mode.presents.info[p[2]].gifts,mode.presents.info[p[2]].victories),n,5,30,790,100,1,1,.8,true)
			end
		end
	end,