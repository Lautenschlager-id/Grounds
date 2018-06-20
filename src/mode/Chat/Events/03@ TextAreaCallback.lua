	eventTextAreaCallback = function(i,n,c)
		local p = string.split(c,"[^%.]+")
		if p[1] == "close" then
			ui.addPopup(0,2,"",n,1e7,1e7)
			for i = 0,3 do
				ui.removeTextArea(i,n)
			end
			mode.chat.info[n].open = false
			mode.chat.updateToRead(n)
		elseif p[1] == "open" then
			mode.chat.info[n].open = true
			mode.chat.info[n].toRead = 0
			mode.chat.displayChat(n)
			ui.removeTextArea(4,n)
		elseif p[1] == "display" then
			local msg = mode.chat.data[tonumber(p[2])]		
			tfm.exec.chatMessage(string.format("<N>> <V>[%s] <N>%s",msg[2],msg[3]),n)
		end
	end,