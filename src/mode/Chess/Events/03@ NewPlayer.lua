	eventNewPlayer = function(n)
		mode.chess.uiboard(n)
		tfm.exec.respawnPlayer(n)
		system.bindKeyboard(n, 32, true, true)
		tfm.exec.chatMessage("<S>[#Chess] " .. system.getTranslation().welcome, n)
	end,