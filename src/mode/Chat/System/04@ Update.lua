	updateToRead = function(n)
		ui.addTextArea(4,"<p align='center'><V><a href='event:open'><B>" .. string.sub(string.lower(mode.chat.chatTitle),1,8) .. "</B> <J>" .. mode.chat.info[n].toRead,n,712,378,80,nil,0x324650,0x212E35,1,true)
	end,