	eventNewPlayer = function(n)
		mode.chat.info[n] = {
			open = true,
			toRead = 0,
		}
		mode.chat.displayChat(n)
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
	end,