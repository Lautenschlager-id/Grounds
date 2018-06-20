	eventNewPlayer = function(n)
		mode.dev.info[n] = {
			timer = 0,
			mouseImage = -1,
		}

		tfm.exec.chatMessage("<CE>" .. system.getTranslation().welcome,n)
	
		if mode.dev.throw[1] then
			if mode.dev.throw[2] == n or mode.dev.throw[2] == "*" then
				system.bindKeyboard(n,32,true,true)
			end
		end
		
		if mode.dev.mouseImages[1] then
			if mode.dev.throw[2] == n or mode.dev.throw[2] == "*" then
				for i = 0,2,2 do
					system.bindKeyboard(n,i,true,true)
				end
			end
		end
	end,