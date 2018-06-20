do
	local concat = table.concat
	table.concat = function(list,sep,f,i,j)
		if type(f) == "boolean" and f then
			return concat(list, sep, i, j)
		end
	
		local txt = ""
		sep = sep or ""
		i,j = i or 1,j or #list
		for k,v in next,list do
			if type(k) ~= "number" and true or (k >= i and k <= j) then
				txt = txt .. (not f and v or f(k,v)) .. sep
			end
		end
		return string.sub(txt,1,-1-#sep)
	end

	local newGame = tfm.exec.newGame
	tfm.exec.newGame = function(code)
		if os.time() > system.newGameTimer then
			system.newGameTimer = os.time() + 6000
			newGame(code or "#" .. table.random({0,0,0,0,1,1,1,4,5,6,7,8,9,1,4,5,6,7,8,9,0}))
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
				local t = string.gsub(string.sub(txt,total,total + 1000), "<$", "&lt;")
				chatMessage(t,n)
				total = total + 1001
			end
		else
			chatMessage(txt,n)
		end
	end
	
	local loadPlayerData = system.loadPlayerData
	system.loadPlayerData = function(n)
		if module._STATUS == "official" then
			return loadPlayerData(n)
		else
			if _G["eventPlayerDataLoaded"] then
				eventPlayerDataLoaded(n,"")
			end
			return true
		end
	end
	
	local savePlayerData = system.savePlayerData
	system.savePlayerData = function(n,data)
		if module._STATUS == "official" then
			savePlayerData(n,data)
			return true
		else
			return false
		end
	end
end
