	reset = function()
		-- Data
		mode.click.info = {}
	end,
	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AfkDeath"} do
			tfm.exec["disable"..f]()
		end

		tfm.exec.newGame(5993911)
	end,