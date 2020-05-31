	insertion = function(n)
		local y = 0
		for i = 0,63 do
			if i > 0 and i % 8 == 0 then
				y = y + 1000
			end
			tfm.exec.addImage(mode.universe.images.background[i + 1] .. ".jpg","?" .. i,(i%8) * 1000,y,n)

			if i % 10 == 0 then
				coroutine.yield()
			end
		end
		tfm.exec.addImage("15db9e67479.png","?64",3970,3973,n)
	end,
	setBackground = function(n)
		local timerId
		local insert = coroutine.create(mode.universe.insertion)
		timerId = system.newTimer(function()
			coroutine.resume(insert,n)
			
			if coroutine.status(insert) == "dead" then
				system.removeTimer(timerId)
			end
		end,1000,true)
	end,
