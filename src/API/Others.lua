deactivateAccents=function(str)
	str = string.gsub(str, "[áàâäãå]", 'a')
	str = string.gsub(str, "[ÁÀÂÄÃÅ]", 'A')

	str = string.gsub(str, "[éèêë]", 'e')
	str = string.gsub(str, "[ÉÈÊË]", 'E')

	str = string.gsub(str, "[íìîï]", 'i')
	str = string.gsub(str, "[ÍÌÎÏ]", 'I')

	str = string.gsub(str, "[óòôöõ]", 'o')
	str = string.gsub(str, "[ÓÒÔÖÕ]", 'O')

	str = string.gsub(str, "[úùûü]", 'u')
	str = string.gsub(str, "[ÚÙÛÜ]", 'U')

	str = string.gsub(str, "[ç]", 'c')
	str = string.gsub(str, "[Ç]", 'C')

	str = string.gsub(str, "[ñ]", 'n')
	str = string.gsub(str, "[Ñ]", 'N')

	str = string.gsub(str, "[ýÿ]", 'y')
	str = string.gsub(str, "[ÝŸ]", 'Y')

	return str
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