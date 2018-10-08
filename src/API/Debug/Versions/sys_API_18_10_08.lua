	--[[ Control ]]--
system.newGameTimer = 0
system.officialMode = {"", ""}
system.playerMessage = ""
system.getAdmins = function()
	local out = {}
	for k, v in next, module._FREEACCESS do
		if v > 2 then
			out[k] = true
		end
	end
	return out
end
	--[[ Improvements ]]--
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
	--[[ Room ]]--
system.isRoom = string.byte(tfm.get.room.name,2) ~= 3
system.roomAdmins = system.getAdmins()
system.miscAttrib = 0
system.roomNumber,system.roomAttributes = (function()
	if system.isRoom then
		local number, attribute = string.match(tfm.get.room.name, "%*?#"..module._NAME.."(%d+)(.*)")
		return tonumber(number) or 0, attribute or ""
	else
		return 0, ""
	end
end)()
system.roomLanguage = ""
	--[[ Player ]]--
system.isPlayer = function(n)
	--[[
		The player must not be a souris;
		The player must have played Transformice for at least 5 days
	]]
	return not not (string.sub(n, 1, 1) ~= "*" and tfm.get.room.playerList[n] and (os.time() - (tfm.get.room.playerList[n].registrationDate or os.time())) >= 432e6)
end
system.players = function(alivePlayers)
	local alive, total = 0, 0
	if alivePlayers then
		alive = {}
	end

	for k, v in next, tfm.get.room.playerList do
		if system.isPlayer(k) then
			total = total + 1
			if not (v.isDead or v.isVampire) then
				if alivePlayers then
					alive[#alive + 1] = k
				else
					alive = alive + 1
				end
			end
		end
	end

	return alive, total
end
	--[[ System ]]--
local events = {}
currentTime, leftTime = 0,0
system.loadTable = function(s)
	-- "a.b.c.1" returns a[b][c][1]
	local list
	for tbl in string.gmatch(s, "[^%.]+") do
		tbl = tonumber(tbl) or tbl
		list = (list and list[tbl] or _G[tbl])
	end
	return list
end
system.getTranslation = function(flag)
	if flag and #flag > 2 then
		if mode[system.gameMode].info[flag] then
			flag = mode[system.gameMode].info[flag].langue
		end
	end
	return mode[system.gameMode].translations[flag or mode[system.gameMode].langue or tfm.get.room.community] or mode[system.gameMode].translations['en']
end

system.looping = function(f, tick)
	local s = 1000 / tick
	local t = { }

	local bar = 0
	local fooTimer = function()
		bar = bar + 1
		t[bar] = system.newTimer(f, 1000, true)
	end

	for timer = 0, 1000 - s, s do
		system.newTimer(fooTimer, 1000 + timer, false)
	end
	return t
end
	--[[ Interface ]]--
ui.banner = function(image, aX, aY, n, time)
	time = time or 5
	aX = aX or 100
	aY = aY or 100
	
	local img = tfm.exec.addImage(image .. ".png", "&0", aX, aY, n)
	system.newTimer(function()
		tfm.exec.removeImage(img)
	end, time * 1000, false)
end
	--[[ Math ]]--
math.isNegative = function(x, iN, iP)
	if x < 0 then
		if iN then return iN end
	else
		if iP then return iP end
	end
	return x
end
math.percent = function(x, y, v)
	v = v or 100
	local m = x / y * v
	return math.min(m, v)
end
math.pythag = function(x1, y1, x2, y2, range)
	return (x1 - x2) ^ 2 + (y1 - y2) ^ 2 <= (range ^ 2)
end
math.setLim = function(value, min, max)
	return value < min and min or value > max and max or value -- math.max(min,math.min(max,value))
end
math.rotatePoint = function(x, y, angle)
	angle = angle % 360
	if angle < 0 then
		angle = angle + 360
	end

	angle = math.rad(angle)
	local cos, sin = math.cos(angle), math.sin(angle)
	return (x * cos - y * sin), (y * cos + x * sin)
end
math.round = function(x)
	return math.floor(x + .5)
end
	--[[ String ]]--
string.split = function(value, pattern, f)
	local out = {}
	for v in string.gmatch(value, pattern) do
		out[#out + 1] = (not f and v or f(v))
	end
	return out
end
string.nick = function(player, ignoreCheck)
	if not ignoreCheck and not player:find("#") then
		player = player .. "#0000"
	end
	
	return string.gsub(string.lower(player), "%a", string.upper, 1)
end
string.trim = function(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end
	--[[ Table ]]--
table.find = function(list, value, index, f)
	for k, v in next, list do
		local i = (type(v) == "table" and index) and v[index] or v
		if (not f and i or f(i)) == value then
			return true, k
		end
	end
	return false, 0
end
table.turnTable = function(x)
	return (type(x)=="table" and x or { x })
end
table.random = function(t)
	return (type(t) == "table" and t[math.random(#t)] or math.random())
end
table.shuffle = function(t)
	local len = #t
	for i = len, 1, -1 do
		local rand = math.random(len)
		t[i], t[rand] = t[rand], t[i]
	end
	return t
end
table.merge = function(this,src)
	for k, v in next, src do
		if this[k] then
			if type(v) == "table" then
				this[k] = table.turnTable(this[k])
				table.merge(this[k], v)
			else
				this[k] = this[k] or v
			end
		else
			this[k] = v
		end
	end
end
table.copy = function(list)
	local out = {}
	for k, v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end
table.list = function(tbl, sep, f, i, j)
	local out = {}

	sep = sep or ""

	i, j = (i or 1), (j or #tbl)

	local counter = 1
	for k, v in next, tbl do
		if type(k) ~= "number" or (k >= i and k <= j) then
			if f then
				out[counter] = f(k, v)
			else
				out[counter] = tostring(v)
			end
			counter = counter + 1
		end
	end

	return table.concat(out, sep)
end
	--[[ Others ]]--
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
	--[[ XML ]]--
local xml = {}
xml.parseParameters = function(currentXml)
	currentXml = string.match(currentXml, "<P (.-)/>") or ""
	local out = {}
	for tag, _, value in string.gmatch(currentXml, "([%-%w]+)=([\"'])(.-)%2") do
		out[tag] = value
	end
	return out, currentXml
end
xml.attribFunc = function(currentXml, funcs)
	local attributes, properties = xml.parseParameters(currentXml)
	for k,v in next, funcs do
		if attributes[v.attribute] then
			v.func(attributes[v.attribute])
		end
	end
	return properties
end
xml.addAttrib = function(currentXml, out, launch)
	local parameters = string.match(currentXml, "<P (.-)/>") or ""
	for k, v in next, out do
		if not string.find(parameters, v.tag) then
			currentXml = string.gsub(currentXml, "<P (.-)/>", function(attribs)
				return string.format("<P %s=\"%s\" %s/>", v.tag, v.value, attribs)
			end)
		end
	end
	if launch then
		tfm.exec.newGame(currentXml)
	else
		return currentXml
	end
end
xml.getCoordinates = function(s)
	if string.find(s, ";") then
		local x,y
		local axis, value = string.match(s, "(%a);(%-?%d+)")
		value = tonumber(value)
		if value then
			if axis == "x" then x = value else y = value end
		end
		return x or 0,y or 0
	else
		local pos = {}
		for x,y in string.gmatch(s, "(%-?%d+) ?, ?(%-?%d+)") do
			pos[#pos+1] = {x = x, y = y}
		end
		return pos
	end
end
	--[[ Color ]]--
color = { -- local glitches rgb_to_hsl
	hex_to_rgb = function(hex)
		hex = string.format("%06x", hex)
		return tonumber(string.sub(hex, 1, 2), 16), tonumber(string.sub(hex, 3, 4), 16), tonumber(string.sub(hex, 5, 6), 16)
	end,
	hsl_to_rgb = function(h, s, l)
		local r, g, b

		if s == 0 then
			r, g, b = l, l, l
		else
			local q = l < .5 and (l * (1 + s)) or (l + s - l * s)
			local p = 2 * l - q

			r = color.hue_to_rgb(p, q, h + 1 / 3)
			g = color.hue_to_rgb(p, q, h)
			b = color.hue_to_rgb(p, q, h - 1 / 3)
		end

		return r * 0xFF, g * 0xFF, b * 0xFF
	end,
	hue_to_rgb = function(p, q, t)
		if t < 0 then
			t = t + 1
		end

		if t > 1 then
			t = t - 1
		end

		if t < 1/6 then
			return p + (q - p) * 6 * t
		end

		if t < 1/2 then
			return q
		end

		if t < 2/3 then
			return p + (q - p) * (2 / 3 - t) * 6
		end

		return p
	end,
	rgb_to_hex = function(r,g,b)
		return tonumber(string.format('%02x%02x%02x', r, g, b), 16)
	end,
	rgb_to_hsl = function(r, g, b)
		local h, d, max, min = color.rgb_to_hue(r, g, b)

		local l = (max + min) * 0.5
		local s = d == 0 and 0 or d / (1 - math.abs(2 * l - 1))

		return h, s, l
	end,
	rgb_to_hue = function(r, g, b)
		r = r / 0xFF
		g = g / 0xFF
		b = b / 0xFF
		
		local min = math.min(r, g, b)
		local max = math.max(r, g, b)
		
		local d = max - min
		
		local h
		if d == 0 then
			h = 0
		elseif max == r then
			h = (g - b) / d % 6
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		
		h = math.floor(h * 60 + .5)
		return h, d, max, min
	end,

	-- Colors
	AntiqueWhite = 0xFAEBD7,
	Aqua = 0xFFFF,
	Aquamarine = 0x7FFFD4,
	Azure = 0xF0FFFF,
	Beige = 0xF5F5DC,
	Bisque = 0xFFE4C4,
	Black = 0x000000,
	BlanchedAlmond = 0xFFEBCD,
	Blue = 0xFF,
	BlueViolet = 0x8A2BE2,
	Brown = 0xA52A2A,
	BurlyWood = 0xDEB887,
	CadetBlue = 0x5F9EA0,
	Chartreuse = 0x7FFF00,
	Chocolate = 0xD2691E,
	Coral = 0xFF7F50,
	CornflowerBlue = 0x6495ED,
	Cornsilk = 0xFFF8DC,
	Crimson = 0xDC143C,
	Cyan = 0xFFFF,
	DarkBlue = 0x8B,
	DarkCyan = 0x8B8B,
	DarkGoldenrod = 0xB8860B,
	DarkGray = 0xA9A9A9,
	DarkGreen = 0x6400,
	DarkKhaki = 0xBDB76B,
	DarkMagenta = 0x8B008B,
	DarkOliveGreen = 0x556B2F,
	DarkOrange = 0xFF8C00,
	DarkOrchid = 0x9932CC,
	DarkRed = 0x8B0000,
	DarkSalmon = 0xE9967A,
	DarkSeaGreen = 0x8FBC8F,
	DarkSlateBlue = 0x483D8B,
	DarkSlateGray = 0x2F4F4F,
	DarkTurquoise = 0xCED1,
	DarkViolet = 0x9400D3,
	DeepPink = 0xFF1493,
	DeepSkyBlue = 0xBFFF,
	DimGray = 0x696969,
	DodgerBlue = 0x1E90FF,
	Firebrick = 0xB22222,
	FloralWhite = 0xFFFAF0,
	ForestGreen = 0x228B22,
	Fuchsia = 0xFF00FF,
	Gainsboro = 0xDCDCDC,
	GhostWhite = 0xF8F8FF,
	Gold = 0xFFD700,
	Goldenrod = 0xDAA520,
	Gray = 0x808080,
	Green = 0x8000,
	GreenYellow = 0xADFF2F,
	Honeydew = 0xF0FFF0,
	HotPink = 0xFF69B4,
	IndianRed = 0xCD5C5C,
	Indigo = 0x4B0082,
	Ivory = 0xFFFFF0,
	Khaki = 0xF0E68C,
	Lavender = 0xE6E6FA,
	LavenderBlush = 0xFFF0F5,
	LawnGreen = 0x7CFC00,
	LemonChiffon = 0xFFFACD,
	LightBlue = 0xADD8E6,
	LightCoral = 0xF08080,
	LightCyan = 0xE0FFFF,
	LightGoldenrodYellow = 0xFAFAD2,
	LightGray = 0xD3D3D3,
	LightGreen = 0x90EE90,
	LightPink = 0xFFB6C1,
	LightSalmon = 0xFFA07A,
	LightSeaGreen = 0x20B2AA,
	LightSkyBlue = 0x87CEFA,
	LightSlateGray = 0x778899,
	LightSteelBlue = 0xB0C4DE,
	LightYellow = 0xFFFFE0,
	Lime = 0xFF00,
	LimeGreen = 0x32CD32,
	Linen = 0xFAF0E6,
	Magenta = 0xFF00FF,
	Maroon = 0x800000,
	MediumAquamarine = 0x66CDAA,
	MediumBlue = 0xCD,
	MediumOrchid = 0xBA55D3,
	MediumPurple = 0x9370DB,
	MediumSeaGreen = 0x3CB371,
	MediumSlateBlue = 0x7B68EE,
	MediumSpringGreen = 0xFA9A,
	MediumTurquoise = 0x48D1CC,
	MediumVioletRed = 0xC71585,
	MidnightBlue = 0x191970,
	MintCream = 0xF5FFFA,
	MistyRose = 0xFFE4E1,
	Moccasin = 0xFFE4B5,
	NavajoWhite = 0xFFDEAD,
	Navy = 0x80,
	OldLace = 0xFDF5E6,
	Olive = 0x808000,
	OliveDrab = 0x6B8E23,
	Orange = 0xFFA500,
	OrangeRed = 0xFF4500,
	Orchid = 0xDA70D6,
	PaleGoldenrod = 0xEEE8AA,
	PaleGreen = 0x98FB98,
	PaleTurquoise = 0xAFEEEE,
	PaleVioletRed = 0xDB7093,
	PapayaWhip = 0xFFEFD5,
	PeachPuff = 0xFFDAB9,
	Peru = 0xCD853F,
	Pink = 0xFFC0CB,
	Plum = 0xDDA0DD,
	PowderBlue = 0xB0E0E6,
	Purple = 0x800080,
	Red = 0xFF0000,
	RosyBrown = 0xBC8F8F,
	RoyalBlue = 0x4169E1,
	SaddleBrown = 0x8B4513,
	Salmon = 0xFA8072,
	SandyBrown = 0xF4A460,
	SeaGreen = 0x2E8B57,
	SeaShell = 0xFFF5EE,
	Sienna = 0xA0522D,
	Silver = 0xC0C0C0,
	SkyBlue = 0x87CEEB,
	SlateBlue = 0x6A5ACD,
	SlateGray = 0x708090,
	Snow = 0xFFFAFA,
	SpringGreen = 0xFF7F,
	SteelBlue = 0x4682B4,
	Tan = 0xD2B48C,
	Teal = 0x8080,
	Thistle = 0xD8BFD8,
	Tomato = 0xFF6347,
	Turquoise = 0x40E0D0,
	Violet = 0xEE82EE,
	Wheat = 0xF5DEB3,
	White = 0xFFFFFF,
	WhiteSmoke = 0xF5F5F5,
	Yellow = 0xFFFF00,
	YellowGreen = 0x9ACD32
}
