	buildSquares = function(c)
		tfm.exec.removePhysicObject(1)
		for k,v in next,{{346,224},{454,224},{400,105}} do
			for i = 1,4 do
				local x = i == 1 and v[1] + 28 or i == 2 and v[1] - 28 or v[1]
				local y = i == 3 and v[2] + 28 or i == 4 and v[2] - 28 or v[2]
				
				local w = x == v[1] and 46 or 10
				local h = w == 10 and 66 or 10
				
				tfm.exec.addPhysicObject(i..k,x,y,{
					type = 12,
					color = c[k],
					width = w,
					height = h,
				})
			end
		end
	end,