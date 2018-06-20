	reset = function()
		-- Data
		mode.godmode.info = {}
	end,
	init = function()
		-- Titles
		mode.godmode.title = system.getTranslation().titles
		
		-- Init
		tfm.exec.disableAutoNewGame()
		tfm.exec.disableAllShamanSkills()
		tfm.exec.newGame("#4")
		
		-- Auto Admin
		system.roomAdmins.Mcqv = true
	end,