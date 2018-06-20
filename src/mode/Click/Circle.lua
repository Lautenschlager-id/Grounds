	circle = {
		id = 0,
		status = false
	},
	spawnCircle = function(on)
		if mode.click.circle.id > 0 then
			tfm.exec.removeJoint(mode.click.circle)
		end
		
		mode.click.circle = {id = 1,status = on}
		
		local color = on and 0x53D08B or 0x555D77
		
		tfm.exec.addJoint(1,0,0,{
			type = 0,
			alpha = .9,
			color = color,
			foreground = false,
			line = 300,
			point1 = "400,200",
			point2 = "400,201"
		})
	end,