do
	local newGame = tfm.exec.newGame
	tfm.exec.newGame = function(code)
		if os.time() > system.newGameTimer then
			system.newGameTimer = os.time() + 3100
			newGame(code or "#" .. table.random({0, 0, 0, 0, 1, 1, 1, 4, 5, 6, 7, 8, 9, 1, 4, 5, 6, 7, 8, 9, 0}))
			return true
		end
		return false
	end
	
	local addImage = tfm.exec.addImage
	local removeImage = tfm.exec.removeImage
	tfm.exec.addImage = function(...)
		local id = addImage(...)
		if id then
			system.objects.image[id] = true
		end
		return id or -1
	end
	tfm.exec.removeImage = function(id)
		removeImage(id)
		if system.objects.image[id] then
			system.objects.image[id] = nil
		end
	end
	
	local nicknamePrettifier = function(text)
		return (string.gsub(text, "([a-zA-Z0-9_%+]+)(#%d+)", function(name, discriminator)
			return name .. "<font size='8'><G>" .. discriminator .. "</G></font>"
		end))
	end
	
	local addTextArea = ui.addTextArea
	ui.addTextArea = function(id, text, ...)
		addTextArea(id, nicknamePrettifier(text), ...)
		if not system.objects.textarea[id] then
			system.objects.textarea[id] = true
		end
	end
	
	local chatMessage = tfm.exec.chatMessage
	tfm.exec.chatMessage = function(txt, n)
		txt = nicknamePrettifier(tostring(txt))
		if #txt > 1000 then
			local total = 0
			while #txt > total do
				local t = string.gsub(string.sub(txt, total, total + 1000), "<$", "&lt;")
				chatMessage(t, n)
				total = total + 1001
			end
		else
			chatMessage(txt, n)
		end
	end
	
	local savePlayerData = system.savePlayerData
	system.savePlayerData = function(n,data)
		if module._STATUS == "official" then
			savePlayerData(n, data)
			return true
		else
			return false
		end
	end
end
