	reset = function()
		mode.dev.currentBackground = {}
		mode.dev.images = {}
		mode.dev.timers = {}
		mode.dev.objects = {}
	end,
	init = function()
		-- Init
		tfm.exec.disableAutoShaman()
		disableChatCommand("set","timer","object","img","throw","display","disable","execute","np","xml","help")
		
		-- Auto Admin
		system.roomAdmins["Mescouleur#0000"] = true
		
		-- Start
		tfm.exec.newGame()
	end,