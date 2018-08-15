deactivateAccents=function(str)
	local letters = {
		["a"] = {"á", "à", "â", "ä", "ã", "å"},
		["e"] = {"é", "è", "ê", "ë"},
		["i"] = {"í", "ì", "î", "ï"},
		["o"] = {"ó", "ò", "ô", "ö", "õ"},
		["u"] = {"ú", "ù", "û", "ü"},
		["c"] = {"ç"},
		["n"] = {"ñ"},
		["y"] = {"ý", "ÿ"},
	}
	for k,v in next, letters do
		for i = 1, #v do
			str = string.gsub(str, v[i], tostring(k))
		end
	end
	return str
end
disableChatCommand = function(...)
	for k, v in next, { ... } do
		system.disableChatCommandDisplay(v, true)
		system.disableChatCommandDisplay(string.lower(v), true)
		system.disableChatCommandDisplay(string.upper(v), true)
	end
end	
normalizeTranslation = function()
	if not mode[system.gameMode].translations.pt then
		mode[system.gameMode].translations.pt = mode[system.gameMode].translations.br
	end
	
	if not mode[system.gameMode].languageIsSet or mode[system.gameMode].langue == "" then
		if mode[system.gameMode].translations[system.roomLanguage] then
			mode[system.gameMode].langue = system.roomLanguage
		elseif mode[system.gameMode].translations[tfm.get.room.community] then
			mode[system.gameMode].langue = tfm.get.room.community
		else
			mode[system.gameMode].langue = "en"
		end
		
		mode[system.gameMode].languageIsSet = true
	end
	
	for k, v in next, mode[system.gameMode].translations do
		if k ~= "en" then
			table.merge(v, mode[system.gameMode].translations.en)
		end
	end
end
normalizeNumber = function(number,sep)
	sep = sep or " "
	number = tostring(math.floor(number))
	number = string.gsub(number, "E(%d+)", function(cn) -- e5 = 00000
		return string.rep("0", tonumber(cn))
	end)
	number = string.gsub(string.reverse(number), "(...)", function(c)
		return c .. sep
	end)
	return string.reverse(number)
end
pairsByIndexes = function(list,f)
	local out = {}
	for index in next, list do
		out[#out + 1] = index
	end
	table.sort(out, f)
	
	local i = 0
	return function()
		i = i + 1
		if out[i] == nil then
			return nil
		else
			return out[i], list[out[i]]
		end
    end
end