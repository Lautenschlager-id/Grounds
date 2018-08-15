--Creator: Bolodefchoco
--Made in: 06/02/2017
--Last update: 15/08/2018

--[[ Module ]]--
local module = {
	_VERSION = "4.8",
	_NAME = "grounds",
	_STATUS = "semi-official",
	_AUTHOR = "Bolodefchoco",
	_LICENSE = [[
		MIT LICENSE
		
		Copyright (c) 2017 @Transformice + @Bolodefchoco
		
		Permission is hereby granted, free of charge, to any person obtaining
		a copy of this software and associated documentation files (the
		"Software"), to deal in the Software without restriction, including
		without limitation the rights to use, copy, modify, merge, and to
		permit persons to whom the Software is furnished to do so, subject to
		the following conditions:

		The above copyright notice and this permission notice shall be included
		in all copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
		OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF FITNESS FOR
		A PARTICULAR PURPOSE AND NONINFRINGEMENT.
		IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
		CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
		TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
		SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	]],
	_FREEACCESS = { -- Verified players
		-- 3 : Commands + Room admin + Debug
		["Bolodefchoco#0000"] = 3,
		["Trumpuke#0000"] = 3,
		["Acer#1412"] = 3,
		-- 2 : Commands
		["Bodykudo#0000"] = 2,
		["Brenower#0000"] = 2,
		["Jordy#0010"] = 2,
		["Laagaadoo#0000"] = 2,
		["Mescouleur#0000"] = 2,
		["Tat#0020"] = 2,
		["Sebafrancuz#0000"] = 2,
		["Tocutoeltuco#0000"] = 2,
		-- 1 : Some commands
		["Artinoe#0000"] = 1,
		["Auroraclears#0000"] = 1,
		["Barberserk#0000"] = 1,
		["Bibsho#0000"] = 1,
		["Billysmille#0000"] = 1,
		["Bishomilad#0000"] = 1,
		["Evil#9510"] = 1,
		["Byontr#0000"] = 1,
		["Caiolopelope#0000"] = 1,
		["Connow#0000"] = 1,
		["Daelea#0000"] = 1,
		["Drescen#0000"] = 1,
		["Ekull#0000"] = 1,
		["Envidiame#0000"] = 1,
		["Exsilium#0010"] = 1,
		["Foxisara#0000"] = 1,
		["Ghjxpain#0000"] = 1,
		["Kaldt#0000"] = 1,
		["Kimsterjay#0000"] = 1,
		["Ryuuzaki#1216"] = 1,
		["Mcqv#0000"] = 1,
		["Mquk#0000"] = 1,
		["Reshman#0020"] = 1,
		["Santalicious#0010"] = 1,
		["Sebaisseba#0000"] = 1,
		["Tempo#5571"] = 1,
		["Unlocker001#0000"] = 1,
		["Virtini#0000"] = 1,
		["Xorcist#0000"] = 1,
		["Jack_sparrow#8381"] = 1,
	},
}

--[[ Optimization ]]--
	--[[ String ]]--
local stringlen,stringfind,stringgmatch,stringbyte,stringdump,stringreverse,stringupper,stringformat,stringrep,stringlower,stringsub,stringgsub,stringmatch,stringchar = string.len,string.find,string.gmatch,string.byte,string.dump,string.reverse,string.upper,string.format,string.rep,string.lower,string.sub,string.gsub,string.match,string.char
	--[[ Math ]]--
local mathdeg,mathfmod,mathrandom,mathasin,mathmax,mathmodf,mathfloor,mathcosh,mathldexp,mathatan2,mathpow,mathrandomseed,mathfrexp,mathabs,mathtanh,mathacos,mathlog,mathtan,mathmin,mathceil,mathsinh,mathsqrt,mathhuge,mathrad,mathsin,mathexp,mathcos,mathatan,mathpi = math.deg,math.fmod,math.random,math.asin,math.max,math.modf,math.floor,math.cosh,math.ldexp,math.atan2,math.pow,math.randomseed,math.frexp,math.abs,math.tanh,math.acos,math.log,math.tan,math.min,math.ceil,math.sinh,math.sqrt,math.huge,math.rad,math.sin,math.exp,math.cos,math.atan,math.pi
	--[[ Table ]]--
local tablepack,tableforeachi,tableforeach,tableremove,tableinsert,tableunpack,tableconcat,tablesort = table.pack,table.foreachi,table.foreach,table.remove,table.insert,table.unpack,table.concat,table.sort
	--[[ Bit32 ]]--
local bit32lrotate, bit32rrotate, bit32band, bit32rshift, bit32lshift, bit32bnot, bit32bxor, bit32replace, bit32arshift, bit32btest, bit32bor, bit32extract = bit32.lrotate, bit32.rrotate, bit32.band, bit32.rshift, bit32.lshift, bit32.bnot, bit32.bxor, bit32.replace, bit32.arshift, bit32.btest, bit32.bor, bit32.extract

--[[ API ]]--
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
			newGame(code or "#" .. tablerandom({0, 0, 0, 0, 1, 1, 1, 4, 5, 6, 7, 8, 9, 1, 4, 5, 6, 7, 8, 9, 0}))
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
		return (stringgsub(text, "([a-zA-Z0-9_%+]+)(#%d+)", function(name, discriminator)
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
				local t = stringgsub(stringsub(txt, total, total + 1000), "<$", "&lt;")
				chatMessage(t, n)
				total = total + 1001
			end
		else
			chatMessage(txt, n)
		end
	end
	
	local loadPlayerData = system.loadPlayerData
	system.loadPlayerData = function(n)
		if module._STATUS == "official" then
			return loadPlayerData(n)
		else
			if _G["eventPlayerDataLoaded"] then
				eventPlayerDataLoaded(n, "")
			end
			return true
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
system.isRoom = stringbyte(tfm.get.room.name,2) ~= 3
system.roomAdmins = system.getAdmins()
system.miscAttrib = 0
system.roomNumber,system.roomAttributes = (function()
	if system.isRoom then
		local number, attribute = stringmatch(tfm.get.room.name, "%*?#"..module._NAME.."(%d+)(.*)")
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
	return not not (stringsub(n, 1, 1) ~= "*" and tfm.get.room.playerList[n] and (os.time() - (tfm.get.room.playerList[n].registrationDate or os.time())) >= 432e6)
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
	for tbl in stringgmatch(s, "[^%.]+") do
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
mathisNegative = function(x, iN, iP)
	if x < 0 then
		if iN then return iN end
	else
		if iP then return iP end
	end
	return x
end
mathpercent = function(x, y, v)
	v = v or 100
	local m = x / y * v
	return mathmin(m, v)
end
mathpythag = function(x1, y1, x2, y2, range)
	return (x1 - x2) ^ 2 + (y1 - y2) ^ 2 <= (range ^ 2)
end
mathsetLim = function(value, min, max)
	return value < min and min or value > max and max or value -- mathmax(min,mathmin(max,value))
end
mathrotatePoint = function(x, y, angle)
	angle = angle % 360
	if angle < 0 then
		angle = angle + 360
	end

	angle = mathrad(angle)
	local cos, sin = mathcos(angle), mathsin(angle)
	return (x * cos - y * sin), (y * cos + x * sin)
end
mathround = function(x)
	return mathfloor(x + .5)
end
	--[[ String ]]--
stringsplit = function(value, pattern, f)
	local out = {}
	for v in stringgmatch(value, pattern) do
		out[#out + 1] = (not f and v or f(v))
	end
	return out
end
stringnick = function(player, ignoreCheck)
	if not ignoreCheck and not player:find("#") then
		player = player .. "#0000"
	end
	
	return stringgsub(stringlower(player), "%a", stringupper, 1)
end
stringtrim = function(s)
	return (stringgsub(s, "^%s*(.-)%s*$", "%1"))
end
	--[[ Table ]]--
tablefind = function(list, value, index, f)
	for k, v in next, list do
		local i = (type(v) == "table" and index) and v[index] or v
		if (not f and i or f(i)) == value then
			return true, k
		end
	end
	return false, 0
end
tableturnTable = function(x)
	return (type(x)=="table" and x or { x })
end
tablerandom = function(t)
	return (type(t) == "table" and t[mathrandom(#t)] or mathrandom())
end
tableshuffle = function(t)
	local len = #t
	for i = 1, len, -1 do
		local rand = mathrandom(len)
		tbl[i], tbl[rand] = tbl[rand], tbl[i]
	end
	return t
end
tablemerge = function(this,src)
	for k, v in next, src do
		if this[k] then
			if type(v) == "table" then
				this[k] = tableturnTable(this[k])
				tablemerge(this[k], v)
			else
				this[k] = this[k] or v
			end
		else
			this[k] = v
		end
	end
end
tablecopy = function(list)
	local out = {}
	for k, v in next, list do
		out[k] = (type(v) == "table" and tablecopy(v) or v)
	end
	return out
end
tablelist = function(tbl, sep, f, i, j)
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

	return tableconcat(out, sep)
end
	--[[ Others ]]--
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
			str = stringgsub(str, v[i], tostring(k))
		end
	end
	return str
end
disableChatCommand = function(...)
	for k, v in next, { ... } do
		system.disableChatCommandDisplay(v, true)
		system.disableChatCommandDisplay(stringlower(v), true)
		system.disableChatCommandDisplay(stringupper(v), true)
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
			tablemerge(v, mode[system.gameMode].translations.en)
		end
	end
end
normalizeNumber = function(number,sep)
	sep = sep or " "
	number = tostring(mathfloor(number))
	number = stringgsub(number, "E(%d+)", function(cn) -- e5 = 00000
		return stringrep("0", tonumber(cn))
	end)
	number = stringgsub(stringreverse(number), "(...)", function(c)
		return c .. sep
	end)
	return stringreverse(number)
end
pairsByIndexes = function(list,f)
	local out = {}
	for index in next, list do
		out[#out + 1] = index
	end
	tablesort(out, f)
	
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
	currentXml = stringmatch(currentXml, "<P (.-)/>") or ""
	local out = {}
	for tag, _, value in stringgmatch(currentXml, "([%-%w]+)=([\"'])(.-)%2") do
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
	local parameters = stringmatch(currentXml, "<P (.-)/>") or ""
	for k, v in next, out do
		if not stringfind(parameters, v.tag) then
			currentXml = stringgsub(currentXml, "<P (.-)/>", function(attribs)
				return stringformat("<P %s=\"%s\" %s/>", v.tag, v.value, attribs)
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
	if stringfind(s, ";") then
		local x,y
		local axis, value = stringmatch(s, "(%a);(%-?%d+)")
		value = tonumber(value)
		if value then
			if axis == "x" then x = value else y = value end
		end
		return x or 0,y or 0
	else
		local pos = {}
		for x,y in stringgmatch(s, "(%-?%d+) ?, ?(%-?%d+)") do
			pos[#pos+1] = {x = x, y = y}
		end
		return pos
	end
end
	--[[ Color ]]--
color = { -- local glitches rgb_to_hsl
	hex_to_rgb = function(hex)
		hex = stringformat("%06x", hex)
		return tonumber(stringsub(hex, 1, 2), 16), tonumber(stringsub(hex, 3, 4), 16), tonumber(stringsub(hex, 5, 6), 16)
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
		return tonumber(stringformat('%02x%02x%02x', r, g, b), 16)
	end,
	rgb_to_hsl = function(r, g, b)
		local h, d, max, min = color.rgb_to_hue(r, g, b)

		local l = (max + min) * 0.5
		local s = d == 0 and 0 or d / (1 - mathabs(2 * l - 1))

		return h, s, l
	end,
	rgb_to_hue = function(r, g, b)
		r = r / 0xFF
		g = g / 0xFF
		b = b / 0xFF
		
		local min = mathmin(r, g, b)
		local max = mathmax(r, g, b)
		
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
		
		h = mathfloor(h * 60 + .5)
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

--[[ GameMode ]]--
system.gameMode = module._NAME
system.modeChanged = os.time() + 1000

system.getGameMode = function(moduleName, triggerEvent)
	local exists = not not mode[moduleName]
	
	if exists then	
		system.gameMode = moduleName
		
		if triggerEvent then
			eventOnModeChange()
		end
		
		system.modeChanged = os.time() + 1000
	end
	return exists
end

--[[ Modes ]]--
mode = {}

--[[ Grounds ]]--
mode.grounds = {
	-- Translations
	translations = {
		en = {
			-- Data
			grounds = {
				-- Ground, Description
				[0] = {"Wood","?","?"},
				[1] = {"Ice","Increases your speed by pressing spacebar","Increases the speed in <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lava","Teleports you to the last Z indexed ground","?"},
				[4] = {"Chocolate","?","?"},
				[5] = {"Earth","?","?"},
				[6] = {"Grass","?","?"},
				[7] = {"Sand","Creates a sand storm","Decreases the storm in <BL>%s%%</BL>"},
				[8] = {"Cloud","Enables you to fly by pressing spacebar","Increases the fly in <BL>%s%%</BL>"},
				[9] = {"Water","Drowns you","Drowns you <BL>%s%%</BL> slower"},
				[10] = {"Stone","Creates a block of stone by pressing spacebar","Increases the block size in <BL>%s%%</BL>"},
				[11] = {"Snow","Shoots snowballs by pressing spacebar","Increases the snowball speed in <BL>%s%%</BL>"},
				[12] = {"Rectangle","Each color has its own function","?",{
					["C90909"] = "Kills you",
					["18C92B"] = "Revives all the enemies",
					["555D77"] = "Respawning Checkpoint",
				}},
				[13] = {"Circle","Each color has its own function","?"},
				[14] = {"Invisible","?","?"},
				[15] = {"Spiderweb","Teleports you to the spawn point","?"},
			},
			categories = {
				[1] = "Often long maps that, in most of the cases, the players must pass the same obstacles more than once.",
				[2] = "Usually long maps with dodgeable spiderwebs or lavas, sometimes using invisible waters to simulate a fly.",
				[3] = "Harder maps that requires multiple skills to be completed.",
				[4] = "Maps that has as main obstacle the water drowning.",
				[5] = "Maps based mainly on lava teleports.",
				[6] = "Maps that requires a new skill, with mechanisms or something that makes you think before act.",
				[7] = "Maps based on speed and agility, built mostly with ice grounds.",
				[8] = "Maps based on snowball mechanisms/techniques.",
				[9] = "Maps with different gameplays that doesn't fit any other category, also locates the <i>vanilla maps</i>.",
				[10] = "Soloable (mostly) maps, but with faster paths when the players work together.",
				[11] = "Maps with vampires.",
				[12] = "Houses without gameplay, only a place for noobs.",
			},

			-- Init
			welcome = "Welcome to #%s! Can you be the fastest mouse using the ground effects? Try it!\n<PS>Press H for more info!",
			developer = "Developed by %s",
			
			-- Shop
			shop = {
				coin = "Coins",
				power = "Ground power",
				upgrade = "Upgrade",
				price = "Upgrade price",
				close = "Close",
			},
			bought = "You just spent %s coins for the ground %s!",
			cantbuy = "You haven't coins enough in order to buy this upgrade! :(",
			
			-- Profile
			profile = "Leaderboard : %s\n\n<N>Rounds : %s\n<N>Podiums : %s\n\n<N>Deaths : %s\n\n<N>Shop Coins : %s",
			
			-- Gameplay
			gotcoin = "You just got %s coins! :D",
			zombie = "Now you are a zombie!",
			countstats = {
				mice = "At least 5 mice are needed to stats count",
				tribe = "Stats do not count in tribe houses"
			},
			
			-- New map
			powersenabled = "The ground powers were enabled! Good luck!",
			tribehouse = "This is a House place. No stats, no gameplay. Enjoy with your friends",
			
			-- Language
			language = "Current language : <J>%s",
			
			-- Settings
			password = {
				on = "New password : %s",
				off = "Password disabled!"
			},
			
			-- Commands
			commands = {
				shop = "shop",
				profile = "profile",
				help = "help",
				langue = "langue",
				leaderboard = "leaderboard",
				info = "info",
				pw = "password",
				mapinfo = "mapinfo",
			},
			
			-- Menu
			menu = {
				[1] = {"%s","\tYour aim in this minigame is to collect the cheese as fast as you can using the effects each gound has to offer."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Ground effects","Click in the ground's name to read more.\n\n%s"},
				[4] = {"Commands",{
					[1] = {"\t<J>» User</J>\n",{
						[1] = "<VP>!%s</VP> <PS>playerName</PS> <R>or</R> <VP>Key P</VP> - Opens the profile!",
						[2] = "<VP>!%s</VP> <R>or</R> <VP>Key O</VP> - Opens the shop!",
						[3] = "<VP>!%s</VP> - Changes the language!",
					}},
					[2] = {"\n\t<J>» Others</J>\n",{
						[1] = "<VP>!%s</VP> <R>or</R> <VP>Key H</VP> - Opens the help menu!",
						[2] = "<VP>!%s</VP> - Opens the leaderboard!",
						[3] = "<VP>!%s</VP> - Opens the help according to the ground you are on!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!",
					}},
					[3] = {"\n\t<J>» Room admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>password</PS> - Adds or removes a password in the room!",
					}},
				}},
				[5] = {"Maps","<J>Maps : %s\n\n\tAccess %s and send your map. Do not forget to read all the rules before!"},
				[6] = {"Thanks for","<R>%s <G>- <N>Developer\n%s <G>- <N>Translators\n%s <G>- <N>Map evaluators"},
			},
			max = "15a2df47d2e",
			
			-- Rooms
			rooms = {
				bootcamp = "Are you a bootcamper? If so, play at room #grounds0bootcamp with bootcamp maps ONLY!",
				racing = "Do you love running? You can play all the racing maps at room #grounds0racing!"
			},
		},
		ar = {
			grounds = {
				[0] = {"خشب","?","?"},
				[1] = {"جليد","تزيد من سرعتك عند الضغط على زر المسطرة","يزيد من السرعة ب <BL>%s%%</BL>"},
				[2] = {"الترامبولين","?","?"},
				[3] = {"الحمم","تنقلك إلى الأرضية التي لديها اَخر رقم في الـ Z","?"},
				[4] = {"الشوكولاته","?","?"},
				[5] = {"الأرض","?","?"},
				[6] = {"العشب","?","?"},
				[7] = {"الرمل","تصنع عاصفة رملية","يقلل من العاصفة ب <BL>%s%%</BL>"},
				[8] = {"غيمة","تجعلك تطير عن طريق الضغط على زر المسطرة","يزيد من الطيران ب <BL>%s%%</BL>"},
				[9] = {"المياه","تغرقك","يغرقك <BL>%s%%</BL> ببطئ"},
				[10] = {"الحجارة","تصنع حاجو من الحجارة عن طريق الضغط على زر المسطرة","يزيد من حجم الارضية ب <BL>%s%%</BL>"},
				[11] = {"الثلج","تطلق كرات ثلجية عن طريق الضغط على زر المسطرة","يزيد من سرعة كرة الثلج ب <BL>%s%%</BL>"},
				[12] = {"مستطيل","كل لون له قوته الخاصة","?",{
					["C90909"] = "يقتلك",
					["18C92B"] = "إعادة الحياة إلى جميع أعدائك",
					["555D77"] = "نقطة العودة للحياة",
				}},
				[13] = {"الدائرة","كل لون له قوته الخاصة","?"},
				[14] = {"الإختفاء","?","?"},
				[15] = {"شبكة العنكبوت","تنقلك إلى نقطة البداية","?"},
			},
			categories = {
				[1] = ".في كثير من الأحيان هناك خرائط طويلة في معظم الحالات، يجب على اللاعبين اجتياز نفس العقبات أكثر من مرة",
				[2] = ".عادةً يكون هناك خرائط طويلة مع شِباك العنكوب القابلة للمراوغة أو الحمم البركانية، وأحيانا باستخدام المياه غير مرئية لمحاكاة الطيران",
				[3] = ".خرائط أصعب تتطلب مهارات متعددة لإكمالها",
				[4] = ".الخرائط التي لديها عقبة رئيسية وهي الغرق في المياة",
				[5] = ".خرائط إعتمادها الاساسي على التنقل بين الحمم البركانية",
				[6] = ".الخرائط التي تتطلب مهارة جديدة، مع آليات أو شيء آخر تتطلب التفكير قبل العمل",
				[7] = ".خرائط تستند إلى السرعة وخفة الحركة، التي بنيت في الغالب مع الجليد",
				[8] = ".خرائط تستند إلى آليات كرة الثلج / التقنيات",
				[9] = ".<i> خرائط الفانيلا </i> خرائط مع طريقة لعب مختلفة التي لا تناسب أي فئة أخرى، كما في",
				[10] = ".سولوابل (ومعظمها) خرائط، ولكن مع مسارات أسرع عندما يعمل اللاعبين مع بعضهم البعض",
				[11] = ".خرائط مع الخفافيش",
				[12] = ".منازل دون لعب، مكان مخصص فقط للمبتدئين",
			},
			
			welcome = "مرحبا إلى #%s! هل يمكنك أن تكون أسرع فأر يستعمل قوى الأرض؟ قم بتجربتها!\n<PS>اضغط على الزر H لمعرفة المزيد!",
			developer = "مبرمجة من قبل %s",
			
			shop = {
				coin = "النقود",
				power = "طاقة الارضية",
				upgrade = "ترقية",
				price = "ترقبة السعر",
				close = "اغلاق",
			},
			bought = "لقد قمت بإستعمال %s من النقود من أجل الأرضية %s!",
			cantbuy = "لا تملك النقود الكافية لشراء هذا! :(",
			
			profile = "لائحة المتقدمين : %s\n\n<N>الجولات : %s\n<N>المناصب : %s\n\n<N>الموت : %s\n\n<N>نقود المتجر : %s",
			
			gotcoin = "لقد حصلت على %s نقود! :D",
			zombie = "أصبحت الأن ميت حي!",
			countstats = {
				mice = "تحتاج الاقل ل 5 فئران لاحصائيات الاعتماد",
				tribe = "الاحصائيات لا تحسب بمنزل القبيلة"
			},
			
			powersenabled = "تم تفعيل قوى الأرض! حظا موفقا!",
			tribehouse = "هذا هو مكان البيت، لا احصائيات، ,ولا لعب. استمتع مع أصدقائك",
			
			language = "اللغة الحالية : <J>%s",
			
			password = {
				on = "جديدة سر كلمة : %s",
				off = "السر كلمة تعطيل!"
			},
			
			commands = {
				shop = "المتجر",
				profile = "لاعب",
				help = "المساعدة",
				langue = "اللغة",
				leaderboard = "مراكز",
				info = "معلومة",
			},
			
			menu = {
				[1] = {"%s","\tما عليك فعله في هذه اللعبة هو جمع الجبن بأسرع ما يمكن يمكنك إستخدام القوى التي  توفرها لك الأرضيات."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"تأثيرات الأراضي","أنقر على إسم الأرضية لمعرفة المزيد عنها\n\n%s"},
				[4] = {"الأوامر",{
					[1] = {"\t<J>» اللاعب</J>\n",{
						[1] = "<VP>!%s</VP> <PS>إسم اللاعب</PS> <R>أو</R> <VP>زر P</VP> - لفتح الملف الشخصي!",
						[2] = "<VP>!%s</VP> <R>أو</R> <VP>الزر O</VP> - لفتح المتجر!",
						[3] = "<VP>!%s</VP> - لتغيير اللغة!\n",
					}},
					[2] = {"\t<J>» البقية</J>\n",{
						[1] = "<VP>!%s</VP> <R>أو</R> <VP>الزر H</VP> - لقتح لائحة المساعدة!",
						[2] = "<VP>!%s</VP> - فتح قائمة المراكز!",
						[3] = "<VP>!%s</VP> - فتح المساعدة وفقا للمكان الذي انت عليه!",
						[4] = "<VP>!%s</VP> - يعرض معلومات الخريطة إذا كانت في دوران",
					}},
					[3] = {"\n\t<J>» مشرف غرفة</J>\n",{
						[1] = "<VP>!%s</VP> <PS>سر كلمة</PS> - إضافة أو إزالة كلمة مرور في الغرفة!",
					}},
				}},
				[5] = {"الخرائط","<J>الخرائط : %s\n\n\tتفعيل %s وأرسل الخارطة. لا تنسى قراءة القوانين!"},
				[6] = {"شكرا لـ","<R>%s <G>- <N>المبرمج\n%s <G>- <N>مترجمون\n%s <G>- <N>مقيموا الخرائط"},
			},
			
			
			rooms = {
				bootcamp = "هل أنت مِن مُحبي نمط المُعسكر؟ إذا كنت كذلك، العب في غرفة ground0bootcamp# مع خرائط المعسكر فقط!",
				racing = "هل تحب من مُحبي الجري؟ يمكنك أن تلعب جميع خرائط السباق في الغرفة ground0racing# !"
			},
		},
		br = {
			grounds = {
				[0] = {"Madeira","?","?"},
				[1] = {"Gelo","Aumenta sua velocidade ao pressionar a barra de espaço","Aumenta a velocidade em <BL>%s%%</BL>"},
				[2] = {"Trampolim","?","?"},
				[3] = {"Lava","Teletransporta-o para o piso de Z anterior","?"},
				[4] = {"Chocolate","?","?"},
				[5] = {"Terra","?","?"},
				[6] = {"Grama","?","?"},
				[7] = {"Areia","Cria uma tempestade de areia","Diminui a tempestade em <BL>%s%%</BL>"},
				[8] = {"Nuvem","Permite o voo ao pressionar a barra de espaço","Aumenta o voo em <BL>%s%%</BL>"},
				[9] = {"Água","Afoga-o","Afoga-o <BL>%s%%</BL> mais devagar"},
				[10] = {"Pedra","Cria um bloco de pedra ao pressionar a barra de espaço","Aumenta o tamanho do bloco em <BL>%s%%</BL>"},
				[11] = {"Neve","Atira bolas de neve ao pressionar a barra de espaço","Aumenta a velocidade da bola de neve em <BL>%s%%</BL>"},
				[12] = {"Retângulo","Cada cor tem sua própria função","?",{
					["C90909"] = "Mata-o",
					["18C92B"] = "Revive todos os inimigos",
					["555D77"] = "Checkpoint para reviver",
				}},
				[13] = {"Círculo","Cada cor tem sua própria função","?","?"},
				[14] = {"Invisível","?","?"},
				[15] = {"Teia de aranha","Teletransporta-o para o ponto de spawn","?"},
			},
			categories = {
				[1] = "Geralmente mapas longos que, na maioria dos casos, os jogadores devem passar pelo mesmo obstáculo mais de uma vez.",
				[2] = "Geralmente mapas grandes com teias de aranha ou lavas desviáveis, às vezes usando águas invisíveis para simular voo.",
				[3] = "Mapas mais difíceis que requem múltiplas habilidades para serem completados.",
				[4] = "Mapas que tem como obstáculo principal o afogamento na água.",
				[5] = "Mapas baseados principalmente em teleportes de lava.",
				[6] = "Mapas que requerem novas habilidades, com mecanismos ou algo que o faça pensar antes de agir.",
				[7] = "Mapas baseados em velocidade e agilidade, construídos em sua maioria por pisos de gelo.",
				[8] = "Mapas baseados em mecanismos/técnicas com bolas de neve.",
				[9] = "Mapas com gameplays diferentes que não se encaixam em nenhuma outra categoria, também dá espaço aos <i>mapas vanilla</i>.",
				[10] = "Mapas em que você pode completar sozinho (em maioria), mas com caminhos mais rápidos quando há trabalho em equipe entre os jogadores.",
				[11] = "Mapas com vampiros.",
				[12] = "Casas sem jogabilidade, apenas um lugar para noobs.",
			},
			
			welcome = "Bem-vindo ao #%s! Você pode ser o rato mais rápido usando os efeitos dos pisos? Prove!\n<PS>Pressione H para mais informações!",
			developer = "Desenvolvido por %s",
			
			shop = {
				coin = "Moedas",
				power = "Poder do piso",
				upgrade = "Melhorar",
				price = "Preço de aprimoramento",
				close = "Fechar",
			},
			bought = "Você acaba de gastar %s moedas pelo piso %s!",
			cantbuy = "Você não tem moedas suficientes para comprar esta atualização! :(",
			
			profile = "Rank : %s\n\n<N>Partidas : %s\n<N>Pódios : %s\n\n<N>Mortes : %s\n\n<N>Moedas na loja : %s",
			
			gotcoin = "Você acaba de conseguir %s moedas! :D",
			zombie = "Agora você é um zumbi!",
			countstats = {
				mice = "Ao menos 5 ratos são necessários para as estatísticas serem contabilizadas",
				tribe = "Estatísticas não são contabilizadas em cafofos de tribo"
			},
			
			powersenabled = "Os poderes dos pisos foram ativados! Boa sorte!",
			tribehouse = "Este lugar é uma casa. Sem estatísticas, sem gameplay. Divirta-se com seus amigos",
			
			language = "Idioma atual : <J>%s",
			
			password = {
				on = "Nova senha : %s",
				off = "Senha desativada!"
			},

			commands = {
				shop = "loja",
				profile = "perfil",
				help = "ajuda",
				langue = "idioma",
				leaderboard = "rank",
				info = "info",
				pw = "senha",
			},
			
			menu = {
				[1] = {"%s","\tSeu objetivo neste mini-game é coletar o queijo o mais rápido possível, utilizando os efeitos que cada piso oferecer."},
				[2] = {"Submodos","%s\nVocê também pode gostar de jogar\n%s"},
				[3] = {"Efeitos dos pisos","Clique no nome do piso para ler mais.\n\n%s"},
				[4] = {"Comandos",{
					[1] = {"\t<J>» Usuário</J>\n",{
						[1] = "<VP>!%s</VP> <PS>nomeDoJogador</PS> <R>ou</R> <VP>Tecla P</VP> - Abre o perfil!",
						[2] = "<VP>!%s</VP> <R>ou</R> <VP>Tecla O</VP> - Abre a loja!",
						[3] = "<VP>!%s</VP> - Altera o idioma!",
					}},
					[2] = {"\n\t<J>» Outros</J>\n",{
						[1] = "<VP>!%s</VP> <R>ou</R> <VP>Tecla H</VP> - Abre o menu de ajuda!",
						[2] = "<VP>!%s</VP> - Abre o ranking!",
						[3] = "<VP>!%s</VP> - Abre a ajuda de acordo com o piso que você está pisando!",
						[4] = "<VP>!%s</VP> - Mostra as informações do mapa se estiver na rotação!",
					}},
					[3] = {"\n\t<J>» Administrador da sala</J>\n",{
						[1] = "<VP>!%s</VP> <PS>senha</PS> - Adiciona ou remove uma senha na sala!",
					}},
				}},
				[5] = {"Mapas","<J>Mapas : %s\n\n\tAcesse %s e envie seu mapa. Não se esqueça de ler todas as regras antes!"},
				[6] = {"Agradecimentos","<R>%s <G>- <N>Desenvolvedor\n%s <G>- <N>Tradutores\n%s <G>- <N>Avaliadores de mapa"},
			},
			max = "15a2df3e699",
		
			rooms = {
				bootcamp = "Você é um bootcamper? Se sim, jogue na sala #grounds0bootcamp APENAS com mapas bootcamp!",
				racing = "Você ama correr? Você pode jogar todos os mapas racing na sala #grounds0racing!"
			},
		},
		de = {
			grounds = {
				[0] = {"Holz","?","?"},
				[1] = {"Eis","Beschleunigt dich indem du die Leertaste drückst","Erhoht die geschwindigkeit in <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lava","Teleportiert dich zum letzen Z Index Boden","?"},
				[4] = {"Schokolade","?","?"},
				[5] = {"Erde","?","?"},
				[6] = {"Gras","?","?"},
				[7] = {"Sand","Kreiert einen Sandsturm","Verringert die sturm in <BL>%s%%</BL>"},
				[8] = {"Wolke","Du kannst fliegen indem du die Leertaste drückst","Erhoht die fliege in <BL>%s%%</BL>"},
				[9] = {"Wasser","Ertränkt dich","Ertrinkt dich <BL>%s%%</BL> langsamer"},
				[10] = {"Stein","Erschaffe einen Stein indem du die Leertaste drückst","Erhoht die blockgrosse in <BL>%s%%</BL>"},
				[11] = {"Schnee","Wirf Schneebälle indem du die Leertaste drückst","Erhoht die schneeball geschwindigkeit in <BL>%s%%</BL>"},
				[12] = {"Rechteck","Jede Farbe hat seine eigene Funktion","?",{
					["C90909"] = "Tötet du",
					["18C92B"] = "Aufleben alle Feinde",
					["555D77"] = "Respawning Checkpoint", -- *
				}},
				[13] = {"Kreis","Jede Farbe hat seine eigene Funktion","?"},
				[14] = {"Unsichtbar","?","?"},
				[15] = {"Spinnweben","Teleportiert dich zum Startpunkt","?"},
			},
			
			welcome = "Willkommen zu #%s! Kannst du die schnellste Maus mit den Bodeneffekten sein? Versuch es!\n<PS>Drück H für mehr informationen!",
			developer = "Entwickelt von %s",
			
			shop = {
				coin = "Munzen",
				power = "Bodenleistung",
				upgrade = "Aktualisierung",
				price = "Upgrade Preis",
				close = "Schliessen",
			},
			bought = "Du hast %s Münzen für den Boden %s ausgegeben!",
			cantbuy = "Du hast nicht genügend Münzen um dieses Upgrade zu kaufen! :(",
			
			profile = "Bestenliste : %s\n\n<N>Runden: %s\n<N>Podiums: %s\n\n<N>Tode : %s\n\n<N>Shop Münzen: %s",
			
			gotcoin = "Du hast soeben %s Münzen erhalten! :D",
			zombie = "Du bist nun ein Zombie!",
			countstats = {
				mice = "Es müssen mindestens 5 Mäuse im Raum sein damit die Stats zählen",
				tribe = "Stats zählen in Stammeshäusern nicht"
			},
			
			powersenabled = "Der Effekt des Bodens wurde aktiviert! Viel Glück!",
			
			language = "Aktuelle Sprache : <J>%s",
			
			password = {
				on = "Neu passwort: : %s",
				off = "Passwort deaktiviert!"
			},
			
			commands = {
				shop = "shop",
				profile = "profil",
				help = "hilfe",
				langue = "sprache",
				leaderboard = "bestenliste",
				info = "info",
				pw = "passwort",
			},
			
			menu = {
				[1] = {"%s","\tDein Ziel in diesem Minigame ist es den Käse so schnell wie möglich zu sammeln, indem du die verschiedenen Effekte der Böden ausnutzt."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Bodeneffekte","Klicken in den bodens namen um mehr zu lesen.\n\n%s"},
				[4] = {"Kommandos",{
					[1] = {"\t<J>» Benutzer</J>\n",{
						[1] = "<VP>!%s</VP> <PS>Spielername</PS> <R>oder</R> <VP>Taste P</VP> - Öffnet das Profil!",
						[2] = "<VP>!%s</VP> <R>oder</R> <VP>Taste O</VP> - Öffnet den Shop!",
						[3] = "<VP>!%s</VP> - Ändert die Sprache!\n",
					}},
					[2] = {"\t<J>» Anderes</J>\n",{
						[1] = "<VP>!%s</VP> <R>oder</R> <VP>Taste H</VP> - Öffnet das Hilfsmenu!",
						[2] = "<VP>!%s</VP> - Öffnet die Bestenliste!",
						[3] = "<VP>!%s</VP> - Öffnet die hilfe nach dem boden auf dem du bist auf!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!", -- *
					}},
					[3] = {"\n\t<J>» Zimmer admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>passwort</PS> - Hinzufugen oder entfernen eines passwortes im raum!",
					}},
				}},
				[5] = {"Maps","<J>Maps : %s\n\n\tBesuche das Thema %s und reiche deine Map ein. Vergiss nicht zuvor alle Regeln zu lesen!"},
				[6] = {"Danke an ","<R>%s <G>- <N>Entwickler\n%s <G>- <N>Übersetzer\n%s <G>- <N>Landkarte bewerter"},
			},
		},
		es = {
			grounds = {
				[0] = {"Madera","?","?"},
				[1] = {"Hielo","Incrementa tu velocidad apretando espacio","Aumenta la velocidad en <BL>%s%%</BL>"},
				[2] = {"Trampolín","?","?"},
				[3] = {"Lava","Te teletransporta al suelo que tenga el último Z index","?"},
				[4] = {"Chocolate","?","?"},
				[5] = {"Tierra","?","?"},
				[6] = {"Hierba","?","?"},
				[7] = {"Arena","Crea una tormenta de arena","Disminuye la tormenta en <BL>%s%%</BL>"},
				[8] = {"Nube","Te permite volar presionando espacio","Aumenta el vuelo en <BL>%s%%</BL>"},
				[9] = {"Agua","Te ahogas","Te ahogas <BL>%s%%</BL> más lento"},
				[10] = {"Piedra","Crea un bloque de piedra presionando espacio","Aumenta el tamaño del bloque en <BL>%s%%</BL>"},
				[11] = {"Nieve","Dispara bolas de nieve presionando espacio","Aumenta la velocidad de la bola de nieve en <BL>%s%%</BL>"},
				[12] = {"Rectángulo","Cada color tiene su propia función","?",{
					["C90909"] = "Te mata",
					["18C92B"] = "Revive todos los enemigos",
					["555D77"] = "Respawning Checkpoint",
				}},
				[13] = {"Círculo","Cada color tiene su propia función","?"},
				[14] = {"Invisible","?","?"},
				[15] = {"Tela de araña","Te teletransporta al punto de aparición","?"},
			},
			categories = {
				[1] = "Mapas que, en la mayoría de los casos, los jugadores deben pasar obstaculos más de una vez.",
				[2] = "Usualmente mapas largos con telas de araña y lavas esquivables, algunas veces usando agua invisible para simular un vuelo.",
				[3] = "Mapas difíciles que necesitan una gran habilidad para completarlos.",
				[4] = "Mapas que tienen un obstáculo principal: el agua. ¡Te puedes ahogar!.",
				[5] = "Mapas basados principalmente en teletransportes de lava.",
				[6] = "Mapas que necesitan una nueva habilidad, con mecanismos o algo que te haga pensar antes de actuar.",
				[7] = "Mapas basados en la velocidad del jugador, construidos mayoritariamente con suelos de hielo.",
				[8] = "Mapas basados en mecanismos/técnicas con nieve.",
				[9] = "Mapas con un gameplay diferente que no entran en otra categoría, también localizados en los <i>mapas vanilla</i>.",
				[10] = "Mapas que (mayoritariamente) pueden ser completados solo, pero con patrones rápidos donde los jugadores necesitan trabajar juntos.",
				[11] = "Mapas con vampiros.",
				[12] = "Houses without gameplay, only a place for noobs",
			},
			
			welcome = "Bienvenido a #%s! Podrás ser el más rápido usando los efectos de los suelos? Inténtalo!\n<PS>Presiona H para más información!",
			developer = "Programado por %s",
			
			shop = {
				coin = "Monedas",
				power = "Potencia del suelo",
				upgrade = "Mejorar",
				price = "Precio de la mejora",
				close = "Cerrar",
			},
			bought = "Has gastado %s monedas para el suelo %s!",
			cantbuy = "No tienes las suficientes monedas para comprar esta mejora! :(",

			profile = "Tabla de líderes : %s\n\n<N>Rondas : %s\n<N>Podios : %s\n\n<N>Muertes : %s\n\n<N>Monedas : %s",

			gotcoin = "Has obtenido %s monedas! :D",
			zombie = "Ahora eres un Zombi!",
			countstats = {
				mice = "Por lo menos 5 ratones son necesarios para contar estadísticas",
				tribe = "Las estadísticas no cuentan en casas de tribu"
			},
			
			powersenabled = "Los poderes de los suelos han sido activados! Buena suerte!",
			
			language = "Idioma actual : <J>%s",
			
			password = {
				on = "Nueva contraseña : %s",
				off = "Contraseña desactivada!"
			},
			
			commands = {
				shop = "tienda",
				profile = "perfil",
				help = "ayuda",
				langue = "idioma",
				leaderboard = "ranking",
				info = "info",
				pw = "contraseña",
			},
			
			menu = {
				[1] = {"%s","\tTu objetivo en este juego es agarrar el queso lo más rápido que puedas, usando los efectos que cada suelo ofrece."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Efectos de suelo","Clickea en el nombre del suelo para leer más.\n\n%s"},
				[4] = {"Comandos",{
					[1] = {"\t<J>» Usuario</J>\n",{
						[1] = "<VP>!%s</VP> <PS>nombreDeUsuario</PS> <R>o</R> <VP>Tecla P</VP> - Abre el perfil!",
						[2] = "<VP>!%s</VP> <R>o</R> <VP>Tecla O</VP> - Abre la tienda!",
						[3] = "<VP>!%s</VP> - Cambia el idioma!\n",
					}},
					[2] = {"\t<J>» Otros</J>\n",{
						[1] = "<VP>!%s</VP> <R>o</R> <VP>Tecla H</VP> - Abre el menu de ayuda!",
						[2] = "<VP>!%s</VP> - Abre el ranking!",
						[3] = "<VP>!%s</VP> - Abre la guía del suelo en el que estás!",
						[4] = "<VP>!%s</VP> - Muestra la información del mapa si está en la rotación!",
					}},
					[3] = {"\n\t<J>» Admin de la sala</J>\n",{
						[1] = "<VP>!%s</VP> <PS>contraseña</PS> - Activa o desactiva la contraseña en la sala.",
					}},
				}},
				[5] = {"Mapas","<J>Mapas : %s\n\n\tEntra a %s y envía tu mapa. No olvides leer las reglas antes!"},
				[6] = {"Agradecimientos","<R>%s <G>- <N>Programador\n%s <G>- <N>Traductores\n%s <G>- <N>Evaluadores de mapas"},
			},
			max = "15a2df3e699",
		},
		fr = {
			grounds = {
				[0] = {"Bois","?","?"},
				[1] = {"Glace","Augmente votre vitesse en appuyant sur Espace","Augmente la vitesse de <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lave","Vous téléporte au sol avec le dernier indice Z","?"},
				[4] = {"Chocolat","?","?"},
				[5] = {"Terre","?","?"},
				[6] = {"Herbe","?","?"},
				[7] = {"Sable","Crée une tempête de sable","Diminue la tempête de <BL>%s%%</BL>"},
				[8] = {"Nuage","Vous donne la possibilité de voler en appuyant sur Espace","Augmente le vol de <BL>%s%%</BL>"},
				[9] = {"Eau","Vous noie","Vous noie <BL>%s%%</BL> plus lentement"},
				[10] = {"Pierre","Crée un bloc de pierre en appuyant sur Espace","Augmente la taille du bloc de <BL>%s%%</BL>"},
				[11] = {"Neige","Tire des boules de neige en appuyant sur Espace","Augmente la vitesse de la boule de neige de <BL>%s%%</BL>"},
				[12] = {"Rectangle","Chaque couleur a sa propre fonction","?",{
					["C90909"] = "Te tue",
					["18C92B"] = "Ressuscite tous les ennemis",
				}},
				[13] = {"Cercle","Chaque couleur a sa propre fonction","?"},
				[14] = {"Invisible","?","?"},
				[15] = {"Toile d'araignée","Vous téléporte au point de spawn","?"},
			},
			
			welcome = "Bienvenue à #%s! Pouvez vous être la souris la plus rapide grâce aux effets des sols? Essayez!\n<PS>Appuyez sur H pour plus d'informations!",
			developer = "Développé par %s",

			shop = {
				coin = "Pièces",
				power = "Force du sol",
				upgrade = "Améliorer",
				price = "Coût d'amélioration",
				close = "Fermer",
			},
			bought = "Vous venez de dépenser %s pièces pour le sol %s!",
			cantbuy = "Vous n'avez pas assez de pièces pour acheter cette amélioration! :(",
			
			profile = "Leaderboard : %s\n\n<N>Parties : %s\n<N>Podiums : %s\n\n<N>Morts : %s\n\n<N>Shop Pièces : %s",
			
			gotcoin = "Vous venez de recevoir %s pièces! :D",
			countstats = {
				mice = "Au moins 5 souris sont nécessaires pour que les statistiques comptent",
				tribe = "Les statistiques ne comptent pas en maison de tribu"
			},
			zombie = "Vous êtes maintenant un zombie!",
			
			powersenabled = "Les pouvoirs des sols ont été activés! Bonne chance!",
	
			language = "Langage actuel : <J>%s",
			
			password = {
				on = "Nouveau mot de passe : %s",
				off = "Mot de passe désactivé!"
			},
			
			commands = {
				shop = "magasin",
				profile = "profil",
				help = "aide",
				langue = "langue",
				leaderboard = "leaderboard",
				info = "info",
				pw = "password",
			},
			
			menu = {
				[1] = {"%s","\tVotre but dans ce minijeu est de collecter le fromage aussi vite que possible, en utilisant les effets des différents sols."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Effets du sol","Clique sur le nom du salon pour en lire plus.\n\n%s"},
				[4] = {"Commandes",{
					[1] = {"\t<J>» Joueur</J>\n",{
						[1] = "<VP>!%s</VP> <PS>playerName</PS> <R>ou</R> <VP>Touche P</VP> - Ouvre le profil !",
						[2] = "<VP>!%s</VP> <R>ou</R> <VP>Touche O</VP> - Ouvre le magasin !",
						[3] = "<VP>!%s</VP> - Change la langue !\n",
					}},
					[2] = {"\t<J>» Autres</J>\n",{
						[1] = "<VP>!%s</VP> <R>ou</R> <VP>Touche H</VP> - Ouvre le menu d'aide !",
						[2] = "<VP>!%s</VP> - Ouvre le leaderboard!",
						[3] = "<VP>!%s</VP> - Ouvre l'aide en fonction du sol sur lequel vous vous trouvez!",
						[4] = "<VP>!%s</VP> - Affiche les informations de la carte si elle est dans la rotation!"
					}},
					[3] = {"\n\t<J>» Place admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>mot de passe</PS> - Ajoute ou supprime un mot de passe dans la chambre.",
					}},
				}},
				[5] = {"Cartes","<J>Cartes : %s\n\n\tAccédez à %s et envoyez votre carte. N'oubliez pas de lire toutes les règles avant!"},
				[6] = {"Merci à","<R>%s <G>- <N>Développeur\n%s <G>- <N>Traducteurs\n%s <G>- <N>Evaluateurs de maps"},
			},
		},
		hu = {
			grounds = {
				[0] = {"Fa","?","?"},
				[1] = {"Jég","Növeli a sebességedet, ha megnyomod a Szóközt","Növeli a sebességet <BL>%s%%</BL>-kal"},
				[2] = {"Trambulin","?","?"},
				[3] = {"Láva","Elteleportál téged a legutóbbi Z index talajhoz","?"},
				[4] = {"Csoki","?","?"},
				[5] = {"Föld","?","?"},
				[6] = {"Füves talaj","?","?"},
				[7] = {"Homok","Homokvihart hoz létre","Csökkenti a sebességet <BL>%s%%</BL>-kal"},
				[8] = {"Felhő","Lehetővé teszi számodra a repülést, ha megnyomod a Szóközt","Növeli a repülést <BL>%s%%</BL>-kal"},
				[9] = {"Víz","Megfullaszt téged","Megfullaszt <BL>%s%%</BL>-kal lassabban"},
				[10] = {"Kő","Egy kőtömböt hoz létre, ha megnyomod a Szóközt","Növeli a blokk méretét <BL>%s%%</BL>-kal"},
				[11] = {"Hó","Hógolyót lő, ha megnyomod a Szóközt","Növeli a hógolyó sebességét <BL>%s%%</BL>-kal"},
				[12] = {"Téglalap","Mindegyik színnek megvan a saját szerepe","?",{
					["C90909"] = "Megöl téged",
					["18C92B"] = "Újraéleszti az összes ellenséget",
					["555D77"] = "Újraéledő Ellenőrzőpont",
				}},
				[13] = {"Kör","Mindegyik színnek megvan a saját szerepe","?"},
				[14] = {"Láthatatlan","?","?"},
				[15] = {"Pókháló","Elteleportál téged a kezdőpontra","?"},
			},
			
			welcome = "Üdvözöllek a #%s! Sikerül neked a leggyorsabb egérré válni a talajhatások használatával? Próbáld ki!\n<PS>Nyomd meg a H betűt több információért!",
			developer = "Fejlesztve %s által",
			
			shop = {
				coin = "Pénzérmék",
				power = "Talaj ereje",
				upgrade = "Frissítés",
				price = "Ár frissítése",
				close = "Bezárás",
			},
			bought = "Te most költöttél el %s pénzt a talajra %s!",
			cantbuy = "Nincs elég pénzed ahhoz, hogy megvedd ezt a frissítést! :(",
			
			profile = "Ranglista : %s\n\n<N>Körök : %s\n<N>Dobogók : %s\n\n<N>Halálozások : %s\n\n<N>Bolti pénz : %s",
			
			gotcoin = "Te most szereztél %s pénzt! :D",
			zombie = "Most egy zombi vagy!",
			countstats = {
				mice = "Legalább 5 egérnek kell lennie, hogy statisztikát lehessen számolni",
				tribe = "A statisztika nem számít a törzsházakban"
			},
			
			powersenabled = "A talajhatások engedélyezve lettek! Sok szerencsét!",
			
			language = "Jelenlegi nyelv : <J>%s",
			
			password = {
				on = "Új jelszó : %s",
				off = "Jelszó letiltva!"
			},
			
			commands = {
				shop = "bolt",
				profile = "profil",
				help = "súgó",
				langue = "nyelv",
				leaderboard = "ranglistát",
				info = "infó",
				pw = "jelszó",
			},
			
			menu = {
				[1] = {"%s","\tA te feladatod ebben a minijátékban az, hogy a lehető leggyorsabban összegyűjtsd a sajtot a talajhatások használatával."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Talajhatások","Kattints a talaj nevére, hogy több mindent megtudhass.\n\n%s"},
				[4] = {"Parancsok",{
					[1] = {"\t<J>» Felhasználó</J>\n",{
						[1] = "<VP>!%s</VP> <PS>játékosNeve</PS> <R>vagy</R> <VP>P billenytű</VP> - Megnyitja a profilt!",
						[2] = "<VP>!%s</VP> <R>vagy</R> <VP>O billentyű</VP> - Megnyitja a boltot!",
						[3] = "<VP>!%s</VP> - Megváltoztatja a nyelvet!\n",
					}},
					[2] = {"\t<J>» Egyebek</J>\n",{
						[1] = "<VP>!%s</VP> <R>vagy</R> <VP>H billentyű</VP> - Megnyitja a Súgó menüpontot!",
						[2] = "<VP>!%s</VP> - Megnyitja a ranglistát!",
						[3] = "<VP>!%s</VP> - Megnyitja a Súgót aszerint, amelyik talajon állsz!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!",
					}},
					[3] = {"\n\t<J>» Szoba admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>jelszó</PS> - Bekapcsolja vagy kikapcsolja a jelszót a szobában!",
					}},
				}},
				[5] = {"Pályák","<J>Pályák : %s\n\n\tEngedélyezd a %s és küldd be a pályádat. Előtte ne felejtsd el elolvasni az összes szabály!"},
				[6] = {"Köszönet","<R>%s - Nak <G>- <N>Fejlesztő\n%s <G>- <N>Fordítók\n%s <G>- <N>Pálya értékelők"},
			},
		},
		nl = {
			grounds = {
				[0] = {"Hout","?","?"},
				[1] = {"Ijs","Verhoogt je snelheid door op de spatiebalk te drukken","Verhoogd de snelheid met <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lava","Teleport jou naar de laatst Z index grond","?"},
				[4] = {"Chocolade","?","?"},
				[5] = {"Aarde","?","?"},
				[6] = {"Gras","?","?"},
				[7] = {"Zand","Maakt een zandstorm","Vemindert de storm met <BL>%s%%</BL>"},
				[8] = {"Wolk","Hiermee kun je vliegen door op de spatiebalk te drukken","Verhoogd de vlucht met <BL>%s%%</BL>"},
				[9] = {"Water","Laat je verdrinken","Maakt je <BL>%s%%</BL> langzamer"},
				[10] = {"Steen","Hiermee maak je een blok steen door op de spatiebalk te drukken","Vergroot de grootte van het blok met <BL>%s%%</BL>"},
				[11] = {"Sneeuw","Schiet sneeuwballen door op de spatiebalk te drukken","Verhoogd de snelheid van de sneeuwbal met <BL>%s%%</BL>"},
				[12] = {"Rechthoek","Elke kleur heeft zijn eigen functie","?",{
					["C90909"] = "Vermoordt jou",
					["18C92B"] = "Brengt alle tegenstanders weer tot leven",
				}},
				[13] = {"Cirkel","Elke kleur heeft zijn eigen functie","?"},
				[14] = {"Onzichtbaar","?","?"},
				[15] = {"Spinnenweb","Teleport je naar het beginpunt","?"},
			},
			
			welcome = "Welkom bij #%s! Ben jij de snelste muis door grond effecten te gebruiken? Probeer het!",
			developer = "Gemaakt door %s",
			
			shop = {
				coin = "Munten",
				power = "Grondkracht",
				upgrade = "Upgraden",
				price = "Upgrade kosten",
				close = "Sluit",
			},
			bought = "Je gaf net %s munten uit voor de grond %s!",
			cantbuy = "Je hebt niet genoeg munten om deze upgrade uit te voeren! :(",

			profile = "Ranglijst : %s\n\n<N>Rondes : %s\n<N>Podiums : %s\n\n<N>Sterfgevallen : %s\n\n<N>Winkel Munten : %s",

			gotcoin = "Je kreeg zojuist %s munten! :D",
			zombie = "Nu ben je een zombie!",
			countstats = {
				mice = "Er zijn minstens 5 muizen nodig voordat de stats tellen",
				tribe = "Stats tellen niet in stamhuizen"
			},

			powersenabled = "De grondkrachten zijn ingeschakeld! Succes!",

			language = "Huidige taal : <J>%s",

			password = {
				on = "Nieuwe wachtwoord : %s",
				off = "Wachtwoord uitgezet!"
			},

			commands = {
				shop = "winkel",
				profile = "profiel",
				help = "help",
				langue = "taal",
				leaderboard = "leaderboard",
				info = "info",
				pw = "wachtwoord",
			},
			
			menu = {
				[1] = {"%s","\tJouw doel is om zoveel mogelijk kaas te verzamelen, met gebruik van verschillende grond-effecten."},
				[3] = {"Submodes","%s"},
				[4] = {"Grond effecten","Klik op de grond om meer info te lezen.\n\n%s"},
				[5] = {"Commands",{
					[1] = {"\t<J>» User</J>\n",{
						[1] = "<VP>!%s</VP> <PS>playerName</PS> <R>or</R> <VP>Key P</VP> - Opent het profiel!",
						[2] = "<VP>!%s</VP> <R>or</R> <VP>Key O</VP> - Opent de winkel!",
						[3] = "<VP>!%s</VP> - Wijzigt de taal!\n",
					}},
					[2] = {"\t<J>» Others</J>\n",{
						[1] = "<VP>!%s</VP> <R>or</R> <VP>Key H</VP> - Opent de Help menu!",
						[2] = "<VP>!%s</VP> - Opent de leaderboard!",
						[3] = "<VP>!%s</VP> - Opent help op basis van de grond waarop je staat!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!", -- *
					}},
					[3] = {"\n\t<J>» Kamer admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>wachtwoord</PS> - Voegt of haalt een wachtwoord weg van een kamer!",
					}},
				}},
				[6] = {"Maps","<J>Maps : %s\n\n\tBereik %s en verzend jouw map. Vergeet niet om alle regels te lezen voordat je begint!"},
				[7] = {"Dank aan","<R>%s <G>- <N>Developer\n%s <G>- <N>Translators\n%s <G>- <N>Mapbeoordelaars"},
			},
		},
		pl = {
			grounds = {
				[0] = {"Drewno","?","?"},
				[1] = {"Lód","Zwiększa twoją szybkość, gdy klikasz spację","Zwiększa prędkość w <BL>%s%%</BL>"},
				[2] = {"Trampolina","?","?"},
				[3] = {"Lawa","Przenosi ciebie do ostatniego indexu Z","?"},
				[4] = {"Czekolada","?","?"},
				[5] = {"Ziemia","?","?"},
				[6] = {"Trawa","?","?"},
				[7] = {"Piasek","Tworzy burzę piaskową","Zmniejsza storm w <BL>%s%%</BL>"},
				[8] = {"Chmura","Pozwala tobie latać, gdy klikasz spację","Zwiększa latanie w <BL>%s%%</BL>"},
				[9] = {"Woda","Topi ciebie","Topi <BL>%s%%</BL> wolniej"},
				[10] = {"Kamień","Powoduje, że możesz stworzyć blok kamienia, wciskając spację","Zwiększa wielkość bloku w <BL>%s%%</BL>"},
				[11] = {"Śnieg","Powoduje, że możesz strzelić śnieżką, wciskając spację","Zwiększa prędkość śnieżki w <BL>%s%%</BL>"},
				[12] = {"Trójkąt","Każdy kolor ma swoją funkcję","?",{
					["C90909"] = "Zabija ciebie",
					["18C92B"] = "Ożywia wszystkich przeciwników",
					["555D77"] = "Ponowne spawnowanie Checkpointów",
				}},
				[13] = {"Koło","Każdy kolor ma swoją funkcję","?"},
				[14] = {"Niewidzialność","?","?"},
				[15] = {"Pajęcza sieć","Przenosi ciebie do miejsca spawnu","?"},
			},
			categories = {
				[1] = "Często długie mapy, w większości przypadków, gracze muszą przejść takie same przeszkody.",
				[2] = "Zwyczajnie długie mapy z lawami i pajęczynami, czasami używana woda aby zasymulować latanie.",
				[3] = "Trudniejsze mapy, które wymagają większej ilości zdolności, aby zostały ukończone.",
				[4] = "Mapy, które jako główną mapę mają wodę, w której myszki się topią.",
				[5] = "Mapy bazowane głównie na teleportacji z lawy.",
				[6] = "Mapy, które wymagają nowej zdolności, z mechanizmem albo czymś co powoduje, że musisz myśleć zanim coś zrobisz.",
				[7] = "Mapy bazowane na szybkości i zwinności, budowane najczęsciej z gruntów lodu.",
				[8] = "Mapy bazowane na technikach/mechanikach śnieżnych kulek.",
				[9] = "Mapy z zupełnie inną rozgrywką niż inne kategorie, również znaduje się w <I>mapach vanilliowych</I>.",
				[10] = "Mapy (w większości) zdolne do przejścia samemu, ale szybciej się ją przechodzi gdy gracze pracują wspólnie.",
				[11] = "Mapy z wampirami.",
				[12] = "Chatki plemienne bez rozgrywki, są miejscem tylko dla noobków.",
			},
			
			welcome = "Witaj w #%s! Możesz zostać najszybszą myszką, używając moce gruntów? Spróbuj!\n<PS>Wciśnij H, aby otrzymać więcej informacji!",
			developer = "Stworzone przez %s",
			
			shop = {
				coin = "Kredyty",
				power = "Moc gruntu",
				upgrade = "Ulepsz",
				price = "Cena ulepszenia",
				close = "Zamknij",
			},
			bought = "Wydałeś %s monet na %s!",
			cantbuy = "Nie masz wystarczającej ilości monet, żeby zakupić to ulepszenie! :(",
			
			profile = "Ranking : %s\n\n<N>Rund : %s\n<N>Podia : %s\n\n<N>Zgony : %s\n\n<N>Monety : %s",

			gotcoin = "Masz %s monet! :D",
			zombie = "Zostałeś/-aś zombie!",
			countstats = {
				mice = "Przynajmniej 5 myszek jest potrzebnych aby statystyki były naliczane",
				tribe = "Statystyki nie są naliczane w chatkach plemiennych"
			},

			powersenabled = "Moce gruntów są włączone! Powodzenia!",
			tribehouse = "To jest miejsce chatki plemiennej. Bez statystyk, bez rozgrywki. Ciesz się ze swoimi znajomymi.",

			language = "Bieżący język : <J>%s",
			
			password = {
				on = "Nowe hasło : %s",
				off = "Hasło wyłączone!"
			},
			
			commands = {
				shop = "sklep",
				profile = "profil",
				help = "pomoc",
				langue = "język",
				leaderboard = "ranking",
				info = "informacje",
				pw = "hasło",
			},
			
			menu = {
				[1] = {"%s","\tTwoim zadaniem w tej minigrze jest zbieranie serka najszybciej jak potrafisz, wykorzystując moce gruntów."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Moce gruntu","Kliknij w nazwę gruntu, żeby uzyskać więcej informacji.\n\n%s"},
				[4] = {"Komendy",{
					[1] = {"\t<J>» Użytkowe</J>\n",{
						[1] = "<VP>!%s</VP> <PS>nazwaGracza</PS> <R>albo</R> <VP>Klawisz P</VP> - Otwiera profil!",
						[2] = "<VP>!%s</VP> <R>albo</R> <VP>Klawisz O</VP> - Otwiera Sklep!",
						[3] = "<VP>!%s</VP> - Zmienia język!",
					}},
					[2] = {"\t<J>» Inne</J>\n",{
						[1] = "<VP>!%s</VP> <R>albo</R> <VP>Klawisz H</VP> - Otwiera pomoc!",
						[2] = "<VP>!%s</VP> - Otwiera ranking!",
						[3] = "<VP>!%s</VP> - Otwiera pomoc zależnie, na którym gruncie jesteś!",
						[4] = "<VP>!%s</VP> - Pokazuje informacje o mapie jeżeli jest w rotacji!",
					}},
					[3] = {"\n\t<J>» Pokój z adminem</J>\n",{
						[1] = "<VP>!%s</VP> <PS>hasło</PS> - Dodaje lub usuwa hasło w pokoju.",
					}},
				}},
				[5] = {"Mapy","<J>Mapy : %s\n\n\tStwórz %s i prześlij swoją mapę. Nie zapomnij, aby najpierw przeczytać zasady!"},
				[6] = {"Podziękowania","<R>%s <G>- <N>Twórca\n%s <G>- <N>Tłumacze\n%s <G>- <N>Testerzy map"},
			},
			max = "15a2df4de75",
			
			rooms = {
				bootcamp = "Jesteś bootcamperem? Jeżeli tak, wejdź do pokoju #grounds0bootcamp gdzie są TYLKO mapki z bootcampu!",
				racing = "Kochasz biegać? Możesz zagrać we wszystkie wyścigowe mapki na #ground0racing!"
			},
		},
	},
	langue = "",
	--[[ Info ]]--
	staff = {
		translators = {
			-- Name, Languages
			{"Bolodefchoco#0000",{"EN","BR"},true},
			{"Distances#0095","NL",true},
			{"Tocutoeltuco#0000","ES",false},
			{"Sebafrancuz#0000","PL",true},
			{"Doriiarvai#0000","HU",false},
			{"Error_404#0000","AR",true},
			{"Santa#0010","NL",true},
			{"Archaeron#0010","DE",false},
			{"Aewing#0095","FR",false},
			{"Fashionkid#0000","DE",false},
			{"Yui#0000","ES",false},
			{"Mquk#0000","FR",true},
			{"Jack_sparrow#0000","AR",true}
		},
		mapEvaluators = {
			-- Name, Joined
			{"Bolodefchoco#0000","14/02/2017"},
			{"Error_404#0000","11/03/2017"}
		},
	},
	--[[ Data ]]--
	bindKeys = {0,1,2,3,stringbyte("OPHK",1,4)},
	info = {},
	stormIntensities = {
		--[[ Opaque images
			[1] = "15a6d6fcd18",
			[2] = "15a6d6ff82f",
			[4] = "15a6d7015bc",
			[8] = "15a6d703149"
		]]
		[1] = .75,
		[2] = .65,
		[4] = .5,
		[8] = .25
	},
	--[[ Maps ]]--
	maps = {},
	G = {
		--[[
			name = catName,
			queue{maps},
			id = 1,
			icon = {iconImage,x axis (from 360),y axis (from 123)}
			color = catColor,
			before = function executed before the map,
			after = function executed after the map
		]]--
		[1] = {
			name = "Circuit",
			queue = {3099763,4612510,7078090,4493715,7102175,7127261,7102187,7252160,7241132,7333343,6578479},
			id = 1,
			icon = {"15c60371706",0,-1},
			color = "9A9ACE",
		},
		[2] = {
			name = "Flap Bird",
			queue = {7069835,2265250,6300148,5921754,2874090,2310427,7260642},
			id = 1,
			icon = {"15c603730a6",0,0},
			color = "E084D4",
		},
		[3] = {
			name = "Bootcamp",
			queue = {4592612,7079708,5921867,7087840,6391815,7090909,7011800,7069314,6333026,6000012,6990787,7100040,7068403,7259064,7316276,7460134,7460158},
			id = 1,
			icon = {"15c60382627",-5,-5},
			color = "A4CF9E",
			before = function()
				if system.officialMode[1] == "" and mathrandom(10) > 6 then
					tfm.exec.chatMessage("<PT>" .. system.getTranslation().rooms.bootcamp)
				end
			end,
			after = function()
				if system.officialMode[1] == "bootcamp" then
					tfm.exec.setGameTime(180)
				end
			end,
		},
		[4] = {
			name = "Aquatic",
			queue = {6133469,3324284,7095393,5772226,2310447,7252986,7316290},
			id = 1,
			icon = {"15c603788c1",0,0},
			color = "2194D9",
		},
		[5] = {
			name = "Teleport",
			queue = {5168440,6987992,7069343,6945850,7090907,3326655,7069816,5921744,7071075,7071400,4509060,7118888,7219651,7246114,7251246,7271551},
			id = 1,
			icon = {"15c60376d57",2,-1},
			color = "E29E71",
		},
		[6] = {
			name = "Puzzle",
			queue = {5993927,7057010,5507021,6994066,6332986,7074686,3448597,2887357,6576282,4514386,7079827,7079880,7192030,7204077,7259062,7275725},
			id = 1,
			icon = {"15c6037edb7",0,-1},
			color = "75EABB",
		},
		[7] = {
			name = "Racing",
			queue = {4140491,3324180,6564380,6600268,6987993,6726599,2283901,6568120,4055924,4361785,3851416,7079644,6347093,6620004,7086768,6797243,2030030,5198518,6230212,6340023,7069304,4362362,5981054,7086737,6623930,7245986,7251932,7246303,7251897},
			id = 1,
			icon = {"15c6037ccd7",-5,-5},
			color = "9DBCF2",
			before = function()
				if system.officialMode[1] == "" and mathrandom(30) > 20 then
					tfm.exec.chatMessage("<PT>" .. system.getTranslation().rooms.racing)
				end
			end,
			after = function()
				tfm.exec.setGameTime(120) -- 2 minutes
			end,
		},
		[8] = {
			name = "Snow",
			queue = {4396371,5632126,7079092,4531989,4509584},
			id = 1,
			icon = {"15c6037b089",5,1},
			color = "CCDFEA",
			after = function()
				if os.date("%m") == "12" then
					tfm.exec.chatMessage("<PS>Merry christmas :)")
					tfm.exec.snow(60)
				end
			end,
		},
		[9] = {
			name = "Miscellaneous",
			queue = {6226386,5425815,7047955,6558179,6961916,6968299,6935117,4802574,7087798,6335452,7093647,7145064,6197872,4869830,7296331,7333260,7460173},
			id = 1,
			icon = {"15c6036fb66",-10,-2},
			color = "FFE83A",
		},
		[10] = {
			name = "Cooperation",
			queue = {3326675,4184558,5198607,6988672,7271861},
			id = 1,
			icon = {"15c60374f1f",-3,-1},
			color = "CB6BF4",
		},
		[11] = {
			name = "Vampire",
			queue = {5043429,4361619,4633670},
			id = 1,
			icon = {"15c60380b12",-10,-5},
			color = "CB546B",
			after = function()
				if os.date("%m") == "10" then
					tfm.exec.chatMessage("<R>Happy Halloween :>")
				end
			end,
		},
		[12] = {
			name = "House",
			queue = {510966,7240001,7316967},
			id = 1,
			icon = {"15cb6dbea83",-8,-4},
			color = "D1AB83",
			after = function()
				tfm.exec.setGameTime(1800) -- 30 minutes
				tfm.exec.chatMessage("<ROSE>" .. system.getTranslation().tribehouse)
			end,
		},
	},
	rotation = {1,{9,7,4,1,5,7,10,8,6,11,2,1,3,5}},
	newMap = coroutine.wrap(function(this)
		while true do
			local map
			if os.time() > system.newGameTimer then
				this = this or {}
				
				if #this<1 and (mode.grounds.rotation[1] > #mode.grounds.rotation[2]) then
					mode.grounds.rotation[1] = 1
				end
				
				local category = this.category or mode.grounds.rotation[2][mode.grounds.rotation[1]]
				mode.grounds.mapInfo[2] = category
				category = mode.grounds.G[category]
				mode.grounds.mapInfo[5] = category.color
				map = this.map or category.queue[category.id]
				mode.grounds.mapInfo[1] = map
				
				if #this<1 then
					category.id = category.id + 1
				end
				
				mode.grounds.afterFunction = category.after or (function() end)
				if category.before then
					category.before()
				end
				
				if #this<1 then
					if category.id > #category.queue then
						category.queue = tableshuffle(category.queue)
						category.id = 1
					end
					
					mode.grounds.rotation[1] = mode.grounds.rotation[1] + 1
				end
			end
			this = coroutine.yield(map)
		end
	end),
	--[[ Settings ]]--
	-- New Game
	review = false,
	afterFunction = (function() end),
	mapInfo = {0,0,0,0,"CAA4CF"}, -- Code, Category, Width, Height, Color
	respawn = 0,
	hasWater = false,
	podium = 0,
	availableRoom = false,
	alivePlayers = 0,
	totalPlayers = 0,
	spawnPoint = {0,0},
	mapCategoryIcon = -1,
	isOfficialMap = false,
	startsWith = { meep = false, cheese = false },
	-- Loop
	despawnGrounds = {},
	announceTimer = 0,
	-- Misc
	welcomeMessage = (function()
		if system.roomNumber == 666 then
			return {"<R>","<R>","<R>","<R>"}
		else
			return {"<BV>","<PT>","<BV>","<VP>"}	
		end
	end)(),
	isHouse = system.roomNumber == 801 or system.officialMode[1] == "village",
	-- Leaderboard
	leaderboard = {update = 0,data = {}},
	--[[ Shop ]]--
	shop = {
		images = {
			[1] = {'15a2a340dd5','15a2a342b88','15a2a3449a9','15a2a3459e1','15a2a346953','15a2a3479a3','15a2a348ad3','15a2a349a89','15a2a34aa0d'},
			[3] = {'15a2a35fef7','15a2a36114b','15a2a36240d','15a2a36332f','15a2a3645f3'},
			[7] = {'15a2a3721bc','15a2a3731bb','15a2a3742b6','15a2a375439','15a2a376339'},
			[8] = {'15a2a31b8dc','15a2a31d292','15a2a323150','15a2a32815c','15a2a32af10','15a2a32ce03','15a2a32dc09','15a2a32ecde','15a2a32fc20'},
			[9] = {'15a2a3b475f','15a2a3b5996','15a2a3b6ab9','15a2a3b8250','15a2a3b924f'},
			[10] = {'15a2a3a0156','15a2a3a1229','15a2a3a2460','15a2a3a3702','15a2a3a4c70'},
			[11] = {'15a2a381307','15a2a3824c8','15a2a383682','15a2a384dc1','15a2a3865c5','15a2a38820d','15a2a38a3a8','15a2a38bbd6','15a2a38d0ec'},
			[15] = {'15a2a3c4442','15a2a3c54f3','15a2a3c69b7','15a2a3c78e7','15a2a3c873b'},	
		},
		unpackImages = function(id,e)
			local t = {}
			for k,v in next,mode.grounds.shop.images[id] do
				if #t < e then
					t[#t+1] = v
				end
			end
			return t
		end,
	},
	--[[ System ]]--
	concat = function(k,v)
		if type(v) == "table" then
			return tablelist(v,"\n",function(i,j) return mode.grounds.concat(i,j) end)
		else
			return v
		end
	end,
	listener = function(t,st,from)
		from = (from and from.."." or "")
		for k,v in next,t do
			if type(v) == "table" then
				mode.grounds.listener(v,st,from .. tostring(k))
			else
				st[#st + 1] = from .. k
			end
		end
		return st
	end,
	--[[ UI ]]--
	-- Bar
	uibar = function(id,player,value,color,size,height,y)
		size = size or 100
		height = height or 20
		y = y or 25
		
		local x = mode.grounds.isOfficialMap and 50 or 5

		if value > size then
			value = size
		elseif value < 0 then
			value = 0
		end

		ui.addTextArea(id,"",player,x,y,size + 4,height,0xC7CED2,1,1,true)
		if value ~= 0 then
			ui.addTextArea(id+1,"",player,x + 1,y + 2,value + 2,height - 4,color,color,1,true)
		end
		ui.addTextArea(id+2,"<p align='center'><B><font color='#0'>"..value.."%",player,x,y-4,size + 4,20,1,1,0,true)
	end,
	-- Shop
	uishop = function(n)
		if mode.grounds.info[n].groundsDataLoaded then
			for k,v in next,mode.grounds.info[n].shop.image do
				tfm.exec.removeImage(v)
			end
			if not mode.grounds.info[n].shop.accessing then
				local get,index = tablefind(mode.grounds.shop.grounds,mode.grounds.info[n].powersOP.GTYPE,1)
				if get then
					mode.grounds.info[n].shop.page = index
				else
					mode.grounds.info[n].shop.page = 1
				end
				mode.grounds.info[n].shop.accessing = true
			end
			if mode.grounds.info[n].shop.page < 1 then
				mode.grounds.info[n].shop.page = #mode.grounds.shop.grounds
			elseif mode.grounds.info[n].shop.page > #mode.grounds.shop.grounds then
				mode.grounds.info[n].shop.page = 1
			end
			
			local shopTxt = system.getTranslation(n).shop
			local debuggedGround = mode.grounds.shop.grounds[mode.grounds.info[n].shop.page]
			local ground = system.getTranslation(n).grounds[debuggedGround[1]]
			local G = stringlower(system.getTranslation("en").grounds[debuggedGround[1]][1])
			local groundLevel = mode.grounds.info[n].stats.powers[G]
			groundLevel = groundLevel[#groundLevel]
			
			ui.addTextArea(4,"",n,160,50,480,320,0x1a2433,1,1,true)

			ui.addTextArea(5,"",n,171,56,240,15,0x1d5a78,0x1d5a78,1,true)
			ui.addTextArea(6,"<p align='center'><font size='13'>"..stringnick(mode.grounds.cmds.shop, true),n,170,53,240,25,1,1,0,true)

			ui.addTextArea(7,"<p align='center'><font size='12'><B><a href='event:shop.left'><BV>«</BV></a>  <font size='14'><a href='event:info.grounds."..stringgsub(ground[1],"'","#").."."..ground[2].."'>"..ground[1].."</a></font>  <a href='event:shop.right'><BV>»</BV></a>",n,170,87,240,25,0x073247,0x073247,1,true)
			
			mode.grounds.info[n].shop.image[1] = tfm.exec.addImage(debuggedGround[2][1]..".png","&0",435,70,n)

			local playerData = stringformat("<font size='12'><N>%s <G>: <J>$%s\n<N>%s\n<N>%s <G>: <BL>%s",shopTxt.coin,mode.grounds.info[n].stats.groundsCoins,"%s",shopTxt.power,mathfloor(mathpercent(groundLevel,#debuggedGround[2])).."%%")
			local groundData = ""
			local upgradeData = "<p align='center'><font size='15'><B>%s" .. shopTxt.upgrade

			if (groundLevel + 1) <= #debuggedGround[2] then
				local price = (groundLevel + 1) * (120 * debuggedGround[3])
				playerData = stringformat(playerData,shopTxt.price .. " <G>: <R>$" .. price)
				local iniPerc = mathfloor(mathpercent(1,#mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][2]))
				groundData = stringformat(ground[3],iniPerc)
				upgradeData = stringformat(upgradeData,"<a href='event:shop.buy."..price.."."..G.."'><PT>")
				
				local gId = mode.grounds.info[n].stats.powers[G][#mode.grounds.info[n].stats.powers[G]]
				mode.grounds.info[n].shop.image[2] = tfm.exec.addImage(debuggedGround[2][gId]..".png","&1",540,70,n)
				mode.grounds.info[n].shop.image[3] = tfm.exec.addImage("15a2df6ab69.png","&2",440,205,n)
				mode.grounds.info[n].shop.image[4] = tfm.exec.addImage(debuggedGround[2][gId+1]..".png","&3",540,210,n)
			else
				playerData = stringformat(playerData,"<R>-")
				upgradeData = stringformat(upgradeData,"<V>")
				
				mode.grounds.info[n].shop.image[2] = tfm.exec.addImage(system.getTranslation(n).max .. ".png","&2",175,215,n)
			end
			
			ui.addTextArea(8,playerData,n,170,130,240,52,0x073247,0x073247,1,true)
			ui.addTextArea(9,groundData,n,170,200,240,80,0x073247,0x073247,1,true)

			ui.addTextArea(10,upgradeData,n,170,298,240,24,0x073247,0x073247,1,true)
			ui.addTextArea(11,"<p align='center'><font size='15'><R><B><a href='event:shop.close'>"..shopTxt.close.."</a></B>",n,170,339,240,24,0x073247,0x073247,1,true)

			ui.addTextArea(12,"",n,430,62,200,300,0x073247,0x073247,1,true)
			ui.addTextArea(13,"",n,426,58,90,90,0x1a2433,0x1a2433,1,true)
		end
	end,
	-- Profile
	uiprofile = function(n,p)
		if mode.grounds.info[p].groundsDataLoaded then
			local nickSize = #p > 12 and 10 or 15
			ui.addTextArea(14,"<p align='center'><B><R><a href='event:profile.close'>X",n,513,115,20,20,1,1,1,true)
			ui.addTextArea(15,"<p align='center'><B><PS><a href='event:profile.open'>•",n,513,145,20,20,1,1,1,true)
			ui.addTextArea(16,"<p align='center'><font size='16'><B><V>"..p.."</V></B> "..(mode.grounds.info[p].isOnline and "<VP>" or "<R>").."•</font></p><p align='left'><font size='12'>\n<N>" .. stringformat(system.getTranslation(n).profile,"<V>#"..mode.grounds.info[p].ranking,"<V>"..mode.grounds.info[p].stats.rounds,"<V>"..mode.grounds.info[p].stats.podiums,"<V>"..mode.grounds.info[p].stats.deaths,"<J>$"..mode.grounds.info[p].stats.groundsCoins),n,290,115,220,160,0x073247,1,1,true)
		end
	end,
	-- Menu
	uimenu = function(n)
		if not mode.grounds.info[n].menu.accessing then
			mode.grounds.info[n].menu.page = 1
			mode.grounds.info[n].menu.accessing = true
		end

		local langue = system.getTranslation(n).menu

		if mode.grounds.info[n].menu.page < 1 then
			mode.grounds.info[n].menu.page = #langue
		elseif mode.grounds.info[n].menu.page > #langue then
			mode.grounds.info[n].menu.page = 1
		end

		local popupFormat = "<%s><a href='event:menu.page.%d'>#%s</a>"
		local popups = {}
		for k,v in next,langue do
			popups[#popups+1] = stringformat(popupFormat,(k == mode.grounds.info[n].menu.page and "VP" or "J"),k,stringformat(v[1],stringnick(module._NAME, true)))
		end

		local popup = {
			x = {663,546},
			d = "«",
			txt = "<font size='11'><J>"..tableconcat(popups,"\n\n")
		}
		if not mode.grounds.info[n].menu.showPopup then
			popup = {
				x = {552,435},
				d = "»",
				txt = "",
			}
		end

		local displayText = {tableunpack(langue[mode.grounds.info[n].menu.page])}

		if mode.grounds.info[n].menu.page == 1 then
			displayText[1] = stringformat(displayText[1],stringnick(module._NAME, true))
		else
			local textFormat = nil
			if mode.grounds.info[n].menu.page == 2 then
				local gameModes = "<PT>"
				
				local _modes = {}
				for k, v in next, mode do
					if k ~= module._NAME then
						_modes[#_modes + 1] = k
					end
				end
				
				for k,v in next, _modes do
					local room = stringformat("/room #%s0@YourName#%s",module._NAME,v)
					gameModes = gameModes .. stringformat("<a href='event:print.&lt;ROSE>%s'>%s</a>\n",room,room)
				end
				
				local otherModules = "<CE>"
				for k,v in next,{"powers", "cannonup", "hardcamp", "signal"} do
					local room = stringformat("/room #%s0@YourName",v)
					otherModules = otherModules .. stringformat("<a href='event:print.&lt;ROSE>%s'>%s</a>\n",room,room)
				end

				displayText[2] = stringformat(displayText[2],gameModes,otherModules)
			elseif mode.grounds.info[n].menu.page == 3 then
				textFormat = {{},system.getTranslation(n).grounds}
				for k,v in next,textFormat[2] do
					if v[2] ~= "?" then
						tableinsert(textFormat[1],stringformat("<a href='event:info.grounds.%s.%s'><B>%s</B></a>",stringgsub(v[1],"'","#"),stringgsub(v[2],"%.","@"),stringupper(v[1])))
					end
				end
				displayText[2] = stringformat(displayText[2],"• "..tableconcat(textFormat[1],"\n• "))
			elseif mode.grounds.info[n].menu.page == 4 then
				displayText[2] = tablelist(displayText[2],"\n",function(k,v)
					return mode.grounds.concat(k,v)
				end)
				displayText[2] = "<font size='10'>" .. stringformat(displayText[2],mode.grounds.cmds.profile,mode.grounds.cmds.shop,mode.grounds.cmds.langue,mode.grounds.cmds.help,mode.grounds.cmds.leaderboard,mode.grounds.cmds.info,mode.grounds.cmds.mapinfo,mode.grounds.cmds.pw)
			elseif mode.grounds.info[n].menu.page == 5 then
				displayText[2] = stringformat(displayText[2] .. "\n\n%s",#mode.grounds.maps.."<N>","<BV><a href='event:print.atelier801¬com/topic?f=6&t=845005'>#"..stringupper(module._NAME).." MAP SUBMISSIONS</a></BV>",tablelist(mode.grounds.G,"\n",function(k,v)
					return stringformat("<font color='#%s'><a href='event:info.mapCategory.%s'>G%2d</a> : %3d</font>",v.color,k,k,#v.queue)
				end))
			elseif mode.grounds.info[n].menu.page == 6 then
				local concat = {}
				for i,j in next,{{"translators","<CEP>"},{"mapEvaluators","<BV>"}} do
					concat[#concat+1] = j[2] .. tablelist(mode.grounds.staff[j[1]],"<G>, " .. j[2],function(k,v)
						return stringformat("<a href='event:info.%s.%s'>%s</a>",j[1],k,v[1])
					end)
				end
				displayText[2] = stringformat(displayText[2],"Bolodefchoco#0000",concat[1],concat[2])
			end
		end

		ui.addTextArea(17,"<font size='1'>\n</font><p align='center'><J><B><a href='event:menu.right'>»</a>",n,543,352,40,20,1,1,1,true)
		ui.addTextArea(18,"<font size='1'>\n</font><p align='center'><J><B><a href='event:menu.left'>«</a>",n,217,352,40,20,1,1,1,true)

		ui.addTextArea(19,"<font size='1'>\n</font><p align='center'><PT><B><a href='event:menu.popup'>"..popup.d.."</a>",n,popup.x[1],107,20,20,1,1,1,true)
		ui.addTextArea(20,popup.txt,n,popup.x[2],107,115,155,0x123e54,1,1,true)

		ui.addTextArea(21,"<p align='center'><B><R><a href='event:menu.close'>X",n,543,42,20,20,1,1,1,true)
		ui.addTextArea(22,"<p align='center'><font size='20'><V><B>"..stringupper(displayText[1]).."</B></V><font size='15'>\n<R>_____________\n\n<font size='11'><N><p align='left'>"..displayText[2],n,260,42,280,330,0x073247,1,1,true)
	end,
	-- Info
	uidisplayInfo = function(n,data)
		local what = data[2]
		local title,text,color = "","",""
		if what == "grounds" then
			color = "<N>"
			title = stringgsub(data[3],"#","'")
			local info = stringgsub(data[4],"@",".")
			local groundTxt = system.getTranslation(n).grounds[12]
			if info == groundTxt[2] then
				local colors = {}
				for k,v in next,groundTxt[4] do
					colors[#colors+1] = stringformat("<PT>[•] <N2><font color='#%s'>(#%s)</a> <BL>- <PS>%s",k,k,v)
				end
				text = tableconcat(colors,"\n")
			else
				text = stringformat("<PT>[•] <PS>%s",info)
			end
		elseif what == "mapCategory" then
			data[3] = tonumber(data[3])
			color = "<S>"
			title = "G"..data[3]
			text = stringformat("%s\n# %s\n@ %s",mode.grounds.G[data[3]].name,#mode.grounds.G[data[3]].queue,system.getTranslation(n).categories[data[3]])
			if mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage] then
				tfm.exec.removeImage(mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage])
			end
			mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage + 1] = tfm.exec.addImage(mode.grounds.G[data[3]].icon[1] .. ".png","&4",360 + mode.grounds.G[data[3]].icon[2],125 + mode.grounds.G[data[3]].icon[3],n)
		elseif mode.grounds.staff[what] then
			local comp = data[3]
			local info = mode.grounds.staff[what][tonumber(comp)]
			title = info[1]
			if what == "translators" then
				color = "<CEP>"
				text = stringformat("[<%s>•<CEP>] !%s %s",info[3] and "PT" or "R",mode.grounds.cmds.langue,tableconcat(tableturnTable(info[2]),", "))
			elseif what == "mapEvaluators" then
				color = "<BV>"
				text = stringformat("[•] %s",info[2])
			end
		end
		ui.addTextArea(37,"<p align='center'><B><R><a href='event:info.close'>X",n,528,115,20,20,1,1,1,true)
		ui.addTextArea(38,"<p align='center'><font size='20'><V><B>" .. title .. "</B>" .. color .. (mode.grounds.staff[what] and " •" or "") .. "\n\n<p align='left'><font size='13'>" .. text,n,275,115,250,160,0x073247,1,1,true)
	end,
	-- Leaderboard
	uileaderboard = function(n)
		if os.time() > mode.grounds.leaderboard.update or not n then
			mode.grounds.leaderboard = {update = os.time() + 180e3,data = {}}
			
			local players = {}
			for k,v in next,mode.grounds.info do
				if stringsub(k,1,1) ~= "*" then
					players[#players + 1] = {k,mathfloor((v.stats.rounds - v.stats.deaths)/10) * (v.stats.podiums + 1)}
				end
			end
			tablesort(players,function(p1,p2) return p1[2] > p2[2] end)

			for k,v in next,players do
				mode.grounds.info[v[1]].ranking = k
				if k < 11 then
					tableinsert(mode.grounds.leaderboard.data,"<J>"..k..". " .. (({"<BV>","<PS>","<CE>"})[k] or "<V>") .. "<a href='event:profile.open."..v[1]:gsub("#", "~").."'>".. v[1] .. "</a> <BL>- <VP>" .. v[2] .. "G")
				end
			end
			if #mode.grounds.leaderboard.data == 0 then
				mode.grounds.leaderboard.update = 0
			end
		end

		if n then
			mode.grounds.info[n].leaderboardAccessing = true
			local id,y = 25,100
			ui.addTextArea(23,"<p align='center'><B><R><a href='event:ranking.close'>X",n,603,35,20,20,1,1,1,true)
			ui.addTextArea(24,"<p align='center'><font size='45'>" .. stringnick(mode.grounds.cmds.leaderboard, true),n,200,35,400,350,0x073247,1,1,true)

			local foo = function(name)
				return "'><a:active>"..name.."</a:active></a>"
			end
			for i = 1,10 do
				local v = mode.grounds.leaderboard.data[i] or ""
				local color = id % 2 == 0 and 0x123e54 or 0x042636
				if stringfind(v,n) then
					v = stringgsub(v,"'>(.-)</a>",foo)
				end
				ui.addTextArea(id,v,n,245,y,315,20,color,color,1,true)
				id = id + 1
				y = y + 28
			end

			ui.addTextArea(id,"",n,230,90,10,285,0x073247,0x073247,1,true)
			ui.addTextArea(id + 1,"",n,565,90,10,285,0x073247,0x073247,1,true)
		end
	end,
	--[[ WaterBar ]]--
	displayWaterBar = function(n)
		mode.grounds.uibar(1,n,mode.grounds.info[n].drown,(mode.grounds.info[n].drown > 99 and 0xDA516D or 0x519DDA),100,10,37)
	end,
	--[[ Grounds ]]--
	gsys = {
		-- Ground system
		grounds = {},
		disabledGrounds = {},
		collisionArea = {34,40,50,50,40,34,34,35,0,0,40,35,35,23,0,0},
		getTpPos = function(g,center)
			if center then
				return {g.X, g.Y}
			else			
				local hTP = {g.X, g.Y}
				if g.P[5] == 90 or g.P[5] == -270 then
					hTP[1] = hTP[1] + g.L/2
				elseif g.P[5] == -90 or g.P[5] == 270 then
					hTP[1] = hTP[1] - g.L/2
				elseif mathabs(g.P[5]) == 180 then
					hTP[2] = hTP[2] + g.H/2
				else
					hTP[2] = hTP[2] - g.H/2
				end
				
				return hTP
			end
		end,
		onGround = function(t,px,py)
			px,py = px or 0,py or 0
			
			local groundType = mathsetLim(t.T, 0, 15)
			local collisionArea = mode.grounds.gsys.collisionArea[groundType + 1]
			
			if groundType == 13 then
				return mathpythag(px, py, t.X, t.Y, t.L + collisionArea)
			else
				local radiusX = (t.L + collisionArea) / 2
				local radiusY = (t.H + collisionArea) / 2

				local x, y = mathrotatePoint(px - t.X, py - t.Y, -tonumber(t.P[5]))
				return x >= -radiusX and x <= radiusX and y >= -radiusY and y <= radiusY
			end
		end,
		getGroundProperties = function(xml)
			mode.grounds.gsys.grounds = {}
			
			local properties = {}
			local setValue = function(tag, _, value)
				properties[tag] = (value:find(",") and stringsplit(value, "[^,]+") or tonumber(value) or value)
			end

			stringgsub(xml, "<S (.-)/>", function(attributes)
				properties = {}

				stringgsub(attributes, "([%-%w]+)=([\"'])(.-)%2", setValue)
				mode.grounds.gsys.grounds[#mode.grounds.gsys.grounds + 1] = properties
			end)
		end,
		groundEffects = function()
			for n,p in next,tfm.get.room.playerList do
				if not p.isDead then
					local affected = false
					for id = 1,#mode.grounds.gsys.grounds do
						local ground = mode.grounds.gsys.grounds[id]
						local newId = id - 1
						if not mode.grounds.gsys.disabledGrounds[newId] and (ground.disablepower or ground.P[1] == '1' or (ground.v and (_G.currentTime - 3) >= (tonumber(ground.v)/1000))) then
							-- If the ground has the disablepower attribute, or is dynamic, or the v despawner attribute exists (after it disappear)
							mode.grounds.gsys.disabledGrounds[newId] = true
						end
						if not mode.grounds.gsys.disabledGrounds[newId] and _G.currentTime >= 3 then
							if mode.grounds.gsys.onGround(ground,p.x,p.y) then
								affected = true
								local gtype = ground.T
								local color = stringupper(tostring(ground.o or ""))
								mode.grounds.info[n].powersOP.GTYPE = gtype
								if gtype == 1 or color == "89A7F5" then -- ice
									system.bindKeyboard(n,32,true,true)
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 1
									end
								elseif gtype == 2 or color == "6D4E94" then -- trampoline
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 2
									end
								elseif gtype == 3 or color == "D84801" then -- lava
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 3
									end

									local place = tonumber(ground.move)
									place = place and place + 1 or (id > 1 and id - 1 or #mode.grounds.gsys.grounds)
									place = mode.grounds.gsys.grounds[place]
									
									local hTP = mode.grounds.gsys.getTpPos(place)
									
									tfm.exec.displayParticle(36,p.x,p.y,0,0,0,0,n)
									tfm.get.room.playerList[n].x = 0
									tfm.get.room.playerList[n].y = 0
									tfm.exec.movePlayer(n,hTP[1],hTP[2])
									tfm.exec.displayParticle(36,hTP[1],hTP[2],0,0,0,0,n)
								elseif gtype == 8 or color == "9BAABC" then -- cloud
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 7 then -- sand
									ui.addTextArea(-1,"",n,-1500,-1500,3e3,3e3,0xE5CC5D,0xE5CC5D,mode.grounds.stormIntensities[mode.grounds.info[n].stats.powers.sand[1]],false)
									for i = 1,2 do
										tfm.exec.displayParticle(26,mathrandom(800),mathrandom(350),0,0,0,0,n)
										tfm.exec.displayParticle(27,mathrandom(800),mathrandom(350),0,0,0,0,n)
									end
								elseif gtype == 9 then -- water
									if mode.grounds.hasWater then
										mode.grounds.info[n].drown = mode.grounds.info[n].drown + mathrandom(1,mathfloor(mode.grounds.info[n].stats.powers.water[1]))
										mode.grounds.displayWaterBar(n)
										if mode.grounds.info[n].drown > 99 then
											tfm.exec.killPlayer(n)
											mode.grounds.info[n].drown = 0
											for i = 1,8 do
												tfm.exec.displayParticle(14,p.x+mathrandom(-50,50),p.y+mathrandom(-20,20),0,-1,0,0,n)
											end
										end
										for i = 1,mathrandom(2,4) do
											tfm.exec.displayParticle(14,p.x+mathrandom(-50,50),p.y+mathrandom(-20,20),0,-1,0,0,n)
										end
									end
								elseif gtype == 10 then -- stone
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 11 or color == "E7F0F2" then -- snow
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 12 or gtype == 13 then -- retangle or circle
									if color == "C90909" then
										tfm.exec.killPlayer(n)
									elseif color == "18C92B" then
										if os.time() > mode.grounds.respawn then
											mode.grounds.respawn = os.time() + 7e3
											for k,v in next,tfm.get.room.playerList do
												if v.isVampire then
													tfm.exec.killPlayer(k)
												elseif v.isDead and mode.grounds.info[k].canRev then
													tfm.exec.respawnPlayer(k)
												end
											end
										end
									elseif color == "555D77" then
										mode.grounds.info[n].checkpoint = id
									end
								elseif gtype == 15 then -- web
									tfm.exec.movePlayer(n,mode.grounds.spawnPoint[1],mode.grounds.spawnPoint[2])
									tfm.get.room.playerList[n].x = 0
									tfm.get.room.playerList[n].y = 0
								end
							end
						end
					end
					if not affected then
						mode.grounds.info[n].powersOP.GTYPE = -1
					end
				end
			end
		end,
	},
	--[[ Init ]]--
	reset = function()
		-- Settings and modes
		mode.grounds.welcomeMessage = (function()
			if system.roomNumber == 666 then
				return {"<R>","<R>","<R>","<R>"}
			else
				return {"<BV>","<PT>","<BV>","<VP>"}	
			end
		end)()
		
		mode.grounds.isHouse = system.roomNumber == 801 or system.officialMode[1] == "village"
		mode.grounds.review = false
		
		-- Data
		mode.grounds.info = {}
		
		-- Maps
		mode.grounds.rotation = {1,{9,7,4,1,5,7,10,8,6,11,2,1,3,5}}
	end,
	init = function()
		-- Shuffle the map rotation and adds to the Map list
		for k,v in next,mode.grounds.G do
			v.queue = tableshuffle(v.queue) -- May need a loop before this one
			for i,j in next,v.queue do
				mode.grounds.maps[#mode.grounds.maps + 1] = {j,k}
			end
		end
	
		-- Organizates the staff table
		for k,v in next,mode.grounds.staff do
			tablesort(v,function(t1,t2) return t2[1] > t1[1] end)
		end
		
		-- Organizes the languages
		mode.grounds.langues = (function()
			local l = {}
			for id in next,mode.grounds.translations do
				l[#l + 1] = stringupper(id)
			end
			tablesort(l)
			return l
		end)()
		
		-- Translation indexes
		mode.grounds.translationIndexes = mode.grounds.listener(mode.grounds.translations.en,{})
		
		-- Sets the shop prices, upgrades, etc
		mode.grounds.shop.grounds = {
			-- Ground ID, #Possible upgrades (Imgs), Price average, Upgrade average
			[1] = {1,mode.grounds.shop.unpackImages(1,3),1.05,1.5},
			[2] = {7,mode.grounds.shop.unpackImages(7,4),.4,2},
			[3] = {8,mode.grounds.shop.unpackImages(8,3),1.15,1.47},
			[4] = {9,mode.grounds.shop.unpackImages(9,3),1.6,.6},
			[5] = {10,mode.grounds.shop.unpackImages(10,3),1.1,1.65},
			[6] = {11,mode.grounds.shop.unpackImages(11,5),.5,1.42},
		}
		
		-- Sets the commands
		mode.grounds.cmds = system.getTranslation().commands
		
		-- Disable commands
		for k,v in next,mode.grounds.cmds do
			disableChatCommand(v)
		end
		for k,v in next,{"o","p","h","k","?","pw","time","np","is","check","review","next","again"} do
			disableChatCommand(v)
		end
		
		-- Official modes running together
		if system.officialMode[1] == "racing" then
			mode.grounds.rotation = {1,{7}}
		elseif system.officialMode[1] == "bootcamp" then
			mode.grounds.rotation = {1,{3}}
		end
		
		-- House system
		if mode.grounds.isHouse then
			system.isRoom = false
			mode.grounds.rotation = {1,{12}}
			tfm.exec.disableAfkDeath()
		end
		
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","MinimalistMode","PhysicalConsumables"} do
			tfm.exec["disable"..f]()
		end
		tfm.exec.setAutoMapFlipMode(false)
		tfm.exec.setRoomMaxPlayers(16)
		
		mode.grounds.alivePlayers,mode.grounds.totalPlayers = system.players()
		
		mode.grounds.uileaderboard()
		system.newTimer(function()
			tfm.exec.newGame(mode.grounds.newMap())
		end,1000,false)
	end,
	--[[ Events ]]--
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		local p = stringsplit(c,"[^%.]+")
		if p[1] == "shop" and os.time() > mode.grounds.info[n].shop.timer then
			mode.grounds.info[n].shop.timer = os.time() + 900
			if p[2] == "left" then
				mode.grounds.info[n].shop.page = mode.grounds.info[n].shop.page - 1
				mode.grounds.uishop(n)
			elseif p[2] == "right" then
				mode.grounds.info[n].shop.page = mode.grounds.info[n].shop.page + 1
				mode.grounds.uishop(n)
			elseif p[2] == "buy" and mode.grounds.info[n].groundsDataLoaded then
				p[3] = tonumber(p[3]) or 0
				if mode.grounds.info[n].stats.groundsCoins >= p[3] then
					mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins - p[3]
					local loc = mode.grounds.info[n].stats.powers[p[4]]
					mode.grounds.info[n].stats.powers[p[4]][#loc] = mode.grounds.info[n].stats.powers[p[4]][#loc] + 1
					mode.grounds.info[n].stats.powers[p[4]][1] = mode.grounds.info[n].stats.powers[p[4]][1] * mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][4]
					tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",stringformat(system.getTranslation(n).bought,"<J>$"..p[3].."</J>","<ROSE>"..system.getTranslation(n).grounds[mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][1]][1].."</ROSE>",n)),n)
					mode.grounds.uishop(n)
				else
					tfm.exec.chatMessage(stringformat("<PT>[•] <R>%s",system.getTranslation(n).cantbuy),n)
				end
			elseif p[2] == "close" then
				for i = 4,13 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].shop.accessing = false
				for k,v in next,mode.grounds.info[n].shop.image do
					tfm.exec.removeImage(v)
				end
			end
		elseif p[1] == "profile" then
			if p[2] == "close" then
				for i = 14,16 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].profileAccessing = false
			elseif p[2] == "open" then
				if p[3] then
					mode.grounds.uiprofile(n,p[3]:gsub("~", "#"))
				else
					mode.grounds.uiprofile(n,n)
				end
			end
		elseif p[1] == "menu" and os.time() > mode.grounds.info[n].menu.timer then
			mode.grounds.info[n].menu.timer = os.time() + 750
			if p[2] == "page" and p[3] then
				mode.grounds.info[n].menu.page = tonumber(p[3])
				mode.grounds.uimenu(n)
			elseif p[2] == "right" then
				mode.grounds.info[n].menu.page = mode.grounds.info[n].menu.page + 1
				mode.grounds.uimenu(n)
			elseif p[2] == "left" then
				mode.grounds.info[n].menu.page = mode.grounds.info[n].menu.page - 1
				mode.grounds.uimenu(n)
			elseif p[2] == "popup" then
				mode.grounds.info[n].menu.showPopup = not mode.grounds.info[n].menu.showPopup
				mode.grounds.uimenu(n)
			elseif p[2] == "close" then
				for i = 22,17,-1 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].menu.accessing = false
				if mode.grounds.info[n].showHelp then
					mode.grounds.info[n].showHelp = false
					ui.removeTextArea(0,n)
				end
			end
		elseif p[1] == "print" then
			p[2] = stringgsub(p[2],"¬",".")
			tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",p[2]),n)
		elseif p[1] == "ranking" then
			if p[2] == "close" then
				mode.grounds.info[n].leaderboardAccessing = false
				for i = 23,36 do
					ui.removeTextArea(i,n)
				end
			end
		elseif p[1] == "info" then
			if p[2] == "close" then
				for i = 37,38 do
					ui.removeTextArea(i,n)
				end
				for k,v in next,mode.grounds.info[n].infoImage do
					tfm.exec.removeImage(v)
				end
				mode.grounds.info[n].infoImage = {}
			else
				mode.grounds.uidisplayInfo(n,p)
			end
		end
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		tfm.exec.chatMessage(stringformat("%s[•] %s%s\n\n<G>[^_^] %s%s",mode.grounds.welcomeMessage[2],mode.grounds.welcomeMessage[3],stringformat(system.getTranslation().welcome,"<ROSE>" .. module._NAME .. mode.grounds.welcomeMessage[1]),mode.grounds.welcomeMessage[4],stringformat(system.getTranslation().developer,"Bolodefchoco")),n)
		if mathrandom(10) < 3 then
			tfm.exec.chatMessage("<ROSE>[•] Play #powers at /room #powers",n)
		end
		
		if system.isPlayer(n) then
			for _,key in next,mode.grounds.bindKeys do
				if key < 4 then
					system.bindKeyboard(n,key,false,true)
				end
				system.bindKeyboard(n,key,true,true)
			end
			
			if mode.grounds.review then
				tfm.exec.respawnPlayer(n)
			end
		else
			tfm.exec.chatMessage("<R>Souris! :(",n)
		end
		if not mode.grounds.info[n] then
			mode.grounds.info[n] = {
				groundsDataLoaded = true,
				showHelp = true,
				right = true,
				langue = mode.grounds.langue,
				isWalking = false,
				holdingShift = false,
				drown = 0,
				ranking = -1,
				canRev = false,
				checkpoint = -1,
				shop = {
					accessing = false,
					page = 0,
					timer = 0,
					image = {},
				},
				menu = {
					accessing = false,
					page = 0,
					timer = 0,
					showPopup = true,
				},
				profileAccessing = false,
				leaderboardAccessing = false,
				profileTimer = 0,
				leaderboardTimer = 0,
				isOnline = true,
				stats = {
					groundsCoins = 1000,
					rounds = 0,
					podiums = 0,
					deaths = 0,
					powers = {
						ice = {25,100,1}, -- power, timer, level
						lava = {0,1}, -- power, level
						sand = {1,1}, -- Txtarea opacity, level
						cloud = {35,100,1}, -- power, timer, level
						water = {5,1}, -- power, level
						stone = {15,2500,700,1}, -- size, despawn timer, timer, level
						snow = {5,100,1}, -- power, timer, level
						spiderweb = {0,1}, -- power, level
					},
				},
				powersOP = {
					TIMER = 0,
					GTYPE = -1,
				},
				infoImage = {},
			}
			if not mode.grounds.isHouse then
				ui.addTextArea(0,"",n,-1500,-1500,3e3,3e3,1,1,.8,true)
				mode.grounds.uimenu(n)
			end
		end
	
		mode.grounds.info[n].isOnline = true
		mode.grounds.info[n].canRev = false
	end,
	-- NewGame
	eventNewGame = function()
		local mapName = {}
		
		mode.grounds.isOfficialMap = tablefind(mode.grounds.maps,tfm.get.room.xmlMapInfo.mapCode,1)
		
		if mode.grounds.isOfficialMap then
			mapName[#mapName + 1] = "<font color='#".. mode.grounds.mapInfo[5] .."'>G" .. mode.grounds.mapInfo[2] .. "</font>"
		else
			mode.grounds.mapInfo = {0,0,0,0,"CAA4CF"}
			mode.grounds.afterFunction = (function() end)
		end

		tfm.exec.setGameTime(3 * 60)

		mode.grounds.podium = 0
		mode.grounds.availableRoom = system.isRoom and mode.grounds.totalPlayers > 2
		if not mode.grounds.availableRoom then
			if mathrandom(30) < 16 then
				if not system.isRoom then
					tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",system.getTranslation().countstats.tribe))
				else
					tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",system.getTranslation().countstats.mice))
				end
			end
		end

		for k,v in next,mode.grounds.info do
			if not system.isPlayer(k) then
				tfm.exec.killPlayer(k)
			end
			if v.groundsDataLoaded and mode.grounds.availableRoom then
				v.stats.rounds = v.stats.rounds + 1
			end
			v.canRev = true
			v.right = true
			v.checkpoint = -1
		end

		mode.grounds.afterFunction()
		
		mode.grounds.hasWater = false
		local deactivateWater = mode.grounds.isHouse
		
		mode.grounds.startsWith = { meep = false, cheese = false }

		mode.grounds.despawnGrounds = {}
		mode.grounds.gsys.disabledGrounds = {}
		local currentXml = tfm.get.room.xmlMapInfo

		local xmlPowers = {}
			-- Info
		xmlPowers[1] = { -- Soulmate system
			attribute = "A", -- Soulmate not allowed for rooms with odd amount of players
			func = function()
				if mode.grounds.totalPlayers % 2 ~= 0 then
					tableforeach(mode.grounds.info,tfm.exec.killPlayer)
				end
			end
		}
		xmlPowers[2] = { -- Map Width
			attribute = "L",
			func = function(size)
				if size then
					mode.grounds.mapInfo[3] = tonumber(size)
				end
			end
		}
		xmlPowers[3] = { -- Map Height
			attribute = "H",
			func = function(size)
				if size then
					mode.grounds.mapInfo[4] = tonumber(size)
				end
			end
		}
		
		mode.grounds.mapInfo[3] = mathmax(800,mode.grounds.mapInfo[3])
		mode.grounds.mapInfo[4] = mathmax(400,mode.grounds.mapInfo[4])
			-- Powers
		xmlPowers[4] = { -- mapname
			attribute = "mapname",
			func = function(t)
				if t ~= "" then
					mapName[#mapName + 1] = t
				end
			end
		}
		xmlPowers[5] = { -- disablepower
			attribute = "disablepower",
			func = function(g)
				for ground in stringgmatch(g,"[^,]+") do
					ground = tonumber(ground)
					if ground and not mode.grounds.gsys.disabledGrounds[ground] then
						mode.grounds.gsys.disabledGrounds[ground] = true
					end
				end
			end
		}
		xmlPowers[6] = { -- cheese
			attribute = "cheese",
			func = function()
				mode.grounds.startsWith.cheese = true
				tableforeach(mode.grounds.info,tfm.exec.giveCheese)
			end
		}
		xmlPowers[7] = { -- meep
			attribute = "meep",
			func = function()
				mode.grounds.startsWith.meep = true
				tableforeach(mode.grounds.info,tfm.exec.giveMeep)
			end
		}
		xmlPowers[8] = { -- addtime
			attribute = "addtime",
			func = function(minutes)
				tfm.exec.setGameTime((3 + (tonumber(minutes) or 0)) * 60)
			end
		}
		xmlPowers[9] = { -- notwater
			attribute = "notwater",
			func = function()
				deactivateWater = true
			end
		}
		xmlPowers[10] = { -- setvampire
			attribute = "setvampire",
			func = function(coordinates)
				if mode.grounds.totalPlayers > 2 then
					local coord,axY = xml.getCoordinates(coordinates)

					local vampires,p = {},{}
					for k,v in next,mode.grounds.info do
						if v.isOnline then
							p[#p + 1] = k
						end
					end
					local randomVamp = ""
					for i = 1,mathfloor(mode.grounds.totalPlayers/3) do
						repeat
							randomVamp = tablerandom(p)
						until not tablefind(vampires,randomVamp)
						vampires[#vampires + 1] = randomVamp
					end
					for k,v in next,vampires do
						if type(coord) == "table" then
							local c = tablerandom(coord)
							tfm.exec.movePlayer(v,c.x,c.y)
						else
							if axY == 0 then
								tfm.exec.movePlayer(v,coord,mathrandom(10,mode.grounds.mapInfo[4] - 10))
							else
								tfm.exec.movePlayer(v,mathrandom(10,mode.grounds.mapInfo[4] - 10),axY)
							end
						end
						tfm.exec.setVampirePlayer(v)
					end
				else
					tableforeach(mode.grounds.info,tfm.exec.setVampirePlayer)
				end
			end
		}
		xmlPowers[11] = { -- shaman
			attribute = "shaman",
			func = function(t)
				if t ~= "" then
					ui.setShamanName(t)
				end
			end
		}	

		local parameters = xml.attribFunc(currentXml.xml or "",xmlPowers)
		if mode.grounds.review then
			for k,v in next,mode.grounds.staff.mapEvaluators do
				tfm.exec.chatMessage("<BV>&lt;P> : <N>" .. tostring(parameters), v[1])
			end
		end

		mode.grounds.gsys.getGroundProperties(currentXml.xml)

		if not deactivateWater then
			for k,v in next,mode.grounds.gsys.grounds do
				if v.T == 9 then
					mode.grounds.hasWater = true
					for k,v in next,mode.grounds.info do
						v.drown = 0
						mode.grounds.displayWaterBar(k)
					end
					break
				end
			end
		end
		if not mode.grounds.hasWater then
			for i = 1,3 do
				ui.removeTextArea(i)
			end
		end
		
		local ini = ""
		local D = stringmatch(tfm.get.room.xmlMapInfo.xml,"<D>(.-)</D>") or ""
		for k,v in next,{"DS","T"} do
			ini = stringmatch(D,"<"..v.." (.-)/>")
			if ini then
				break
			end
		end
		ini = ini or ""
		local sX = stringmatch(ini,"X=\"(.-)\"")
		local sY = stringmatch(ini,"Y=\"(.-)\"")
		mode.grounds.spawnPoint = {tonumber(sX) or 0,tonumber(sY) or 0}
		
		-- Icon Image
		if mode.grounds.mapCategoryIcon ~= -1 then
			tfm.exec.removeImage(mode.grounds.mapCategoryIcon)
		end
		if mode.grounds.isOfficialMap then
			mode.grounds.mapCategoryIcon = tfm.exec.addImage(mode.grounds.G[mode.grounds.mapInfo[2]].icon[1] .. ".png","&4",10 + mode.grounds.G[mode.grounds.mapInfo[2]].icon[2],30 + mode.grounds.G[mode.grounds.mapInfo[2]].icon[3])
		else
			mode.grounds.mapCategoryIcon = -1
		end
		
		ui.setMapName(tableconcat(mapName,"   <G>|<J>   ") .. (#mapName > 0 and "   <G>|<J>   " or "") .. currentXml.author .. " <BL>- " .. tfm.get.room.currentMap)
	end,
	-- Loop
	eventLoop = function()
		mode.grounds.gsys.groundEffects()
		
		if _G.currentTime % 5 == 0 then
			mode.grounds.alivePlayers,mode.grounds.totalPlayers = system.players()
		end
		
		if not mode.grounds.isHouse and _G.currentTime == 3 and mathrandom(50) < 16 and os.time() > mode.grounds.announceTimer then
			mode.grounds.announceTimer = os.time() + 5000
			tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",system.getTranslation().powersenabled))
		end

		if mode.grounds.isHouse then
			if _G.currentTime%5 == 0 then
				if _G.leftTime <= 2 then
					tfm.exec.newGame(mode.grounds.newMap())
				end
			end
		else
			if _G.currentTime%2 == 0 and not mode.grounds.review then
				if mode.grounds.alivePlayers < 1 or _G.leftTime <= 2 then
					tfm.exec.newGame(mode.grounds.newMap())
				elseif mode.grounds.alivePlayers == 1 and _G.leftTime > 50 and mode.grounds.totalPlayers > 1 then
					tfm.exec.setGameTime(30)
				elseif mode.grounds.podium > 5 and mode.grounds.alivePlayers > 3 then
					tfm.exec.setGameTime(20,false)
				end
			end
		end
		
		for n,v in next,mode.grounds.info do
			v.isWalking = (tfm.get.room.playerList[n] and (tfm.get.room.playerList[n].movingRight or tfm.get.room.playerList[n].movingLeft) or false)
			v.right = (tfm.get.room.playerList[n] and (tfm.get.room.playerList[n].isFacingRight) or false)
			if v.powersOP.GTYPE ~= 7 then -- Sand
				ui.removeTextArea(-1,n)
			end
			if mode.grounds.hasWater then
				if _G.currentTime%2 == 0 then
					if tfm.get.room.playerList[n] then
						if not tfm.get.room.playerList[n].isDead and v.powersOP.GTYPE ~= 9 then -- Water
							if v.drown > 0 then
								v.drown = v.drown - mathrandom(1,mathfloor(v.stats.powers.water[1]))
								mode.grounds.displayWaterBar(n)
							end
						end
					end
				end
			end
		end
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		tfm.get.room.playerList[n].x = x
		tfm.get.room.playerList[n].x = y
		if tablefind(mode.grounds.bindKeys,k) then
			if k < 4 then
				if k == 0 then
					mode.grounds.info[n].right = false
				elseif k == 2 then
					mode.grounds.info[n].right = true
				end
			elseif k == stringbyte("O") then
				mode.grounds.eventChatCommand(n,"o")
			elseif k == stringbyte("P") then
				if mode.grounds.info[n].profileAccessing then
					mode.grounds.eventTextAreaCallback(nil,n,"profile.close")
				else
					if os.time() > mode.grounds.info[n].profileTimer then
						mode.grounds.info[n].profileTimer = os.time() + 1e3
						mode.grounds.eventChatCommand(n,"p")
					end
				end
			elseif k == stringbyte("H") then
				mode.grounds.eventChatCommand(n,"h")
			elseif k == stringbyte("K") then
				mode.grounds.eventChatCommand(n,"k")
			end
		else
			if k == 32 and os.time() > mode.grounds.info[n].powersOP.TIMER then
				local ms = 0
				local power = {0,0}
				if mode.grounds.info[n].powersOP.GTYPE == 8 then -- Cloud
					power = mode.grounds.info[n].stats.powers.cloud
					ms = power[2]
					tfm.exec.movePlayer(n,0,0,true,0,-power[1],true)
				elseif mode.grounds.info[n].powersOP.GTYPE == 1 and mode.grounds.info[n].isWalking then -- Ice
					power = mode.grounds.info[n].stats.powers.ice
					ms = power[2]
					tfm.exec.movePlayer(n,0,0,false,(mode.grounds.info[n].right and power[1] or -power[1]),0,true)
				elseif mode.grounds.info[n].powersOP.GTYPE == 11 and not mode.grounds.info[n].isWalking then -- Snow
					power = mode.grounds.info[n].stats.powers.snow
					ms = power[2]
					tfm.exec.addShamanObject(34,x + (mode.grounds.info[n].right and 20 or -20),y - 5,0,(mode.grounds.info[n].right and power[1] or -power[1]))
					tfm.exec.playEmote(n,26)
				elseif mode.grounds.info[n].powersOP.GTYPE == 10 and not mode.grounds.info[n].isWalking then -- Stone
					power = mode.grounds.info[n].stats.powers.stone
					local id = tfm.get.room.playerList[n].id
					if not mode.grounds.despawnGrounds[id] then--if not tablefind(mode.grounds.despawnGrounds,id,1) then
						ms = power[3]
						local halfSize = (power[1]/2) + 15
						tfm.exec.addPhysicObject(id,x + (mode.grounds.info[n].right and halfSize or -halfSize),y + 32 - halfSize,{
							type = 10,
							miceCollision = true,
							groundCollision = false,
							width = power[1],
							height = power[1],
							friction = .3,
							restitution = 0
						})
						mode.grounds.despawnGrounds[id] = true

						system.newTimer(function()
							tfm.exec.removePhysicObject(id)
							mode.grounds.despawnGrounds[id] = nil
						end,power[2],false)
						--tableinsert(mode.grounds.despawnGrounds,{id,os.time() + power[2]})
					end
				end
				mode.grounds.info[n].powersOP.TIMER = os.time() + ms
				system.bindKeyboard(n,32,true,false)
				
				mode.grounds.info[n].powersOP.GTYPE = -1
			elseif k == 16 then
				mode.grounds.info[n].holdingShift = d
			end
		end
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		if system.isPlayer(n) then
			-- Normalize and hide commands
			c = deactivateAccents(c)
			system.disableChatCommandDisplay(c,true)
			local p = stringsplit(c,"[^%s]+",stringlower)
			disableChatCommand(p[1])
	
			if not mode.grounds.isHouse then -- Not house mode
				if p[1] == mode.grounds.cmds.shop or p[1] == "o" then
					if mode.grounds.info[n].shop.accessing then
						mode.grounds.eventTextAreaCallback(nil,n,"shop.close")
					else
						if os.time() > mode.grounds.info[n].shop.timer then
							mode.grounds.info[n].shop.timer = os.time() + 1200
							mode.grounds.uishop(n)
						end
					end				
					return
				elseif p[1] == mode.grounds.cmds.profile or p[1] == "p" then
					if p[2] then
						p[2] = stringnick(p[2])
						if mode.grounds.info[p[2]] then
							mode.grounds.uiprofile(n,p[2])
						end
					else
						mode.grounds.uiprofile(n,n)
					end
					mode.grounds.info[n].profileAccessing = true
					return
				elseif p[1] == mode.grounds.cmds.leaderboard or p[1] == "k" then
					if mode.grounds.info[n].leaderboardAccessing then
						mode.grounds.eventTextAreaCallback(nil,n,"ranking.close")
					else
						if os.time() > mode.grounds.info[n].leaderboardTimer then
							mode.grounds.info[n].leaderboardTimer = os.time() + 1e3
							mode.grounds.uileaderboard(n)
						end
					end
					return
				end
			end
			
			if p[1] == mode.grounds.cmds.help or p[1] == "h" then
				if mode.grounds.info[n].menu.accessing then
					mode.grounds.eventTextAreaCallback(nil,n,"menu.close")
				else
					if os.time() > mode.grounds.info[n].menu.timer then
						mode.grounds.info[n].menu.timer = os.time() + 1e3
						mode.grounds.uimenu(n)
					end
				end
				return
			elseif p[1] == mode.grounds.cmds.langue then
				p[2] = p[2] and stringlower(p[2]) or nil
				if p[2] and (p[2] == "default" or mode.grounds.translations[p[2]]) then
					if p[2] == "default" then
						mode.grounds.info[n].langue = (mode.grounds.translations[tfm.get.room.playerList[n].community] and tfm.get.room.playerList[n].community or mode.grounds.langue)
					else
						mode.grounds.info[n].langue = stringlower(p[2])
					end
					tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",stringformat(system.getTranslation(n).language,stringupper(mode.grounds.info[n].langue))),n)
				else
					tfm.exec.chatMessage(stringformat("<PT>[•] <J>!%s <PS>%s",p[1],tableconcat(mode.grounds.langues," <G>-</G> ")),n)
				end			
				return
			elseif p[1] == mode.grounds.cmds.info or p[1] == "?" then
				local grounds = system.getTranslation(n).grounds
				local ground = grounds[mode.grounds.info[n].powersOP.GTYPE]
				if ground then
					mode.grounds.uidisplayInfo(n,{"info","grounds",stringgsub(ground[1],"'","#"),ground[2]})
				end
				return
			elseif p[1] == "mapinfo" and mode.grounds.mapInfo[2] > 0 then
				tfm.exec.chatMessage(stringformat("<PT>[•] <BV>G%s (%s) - %s - @%s",mode.grounds.mapInfo[2],mode.grounds.G[mode.grounds.mapInfo[2]].name,tfm.get.room.xmlMapInfo.author,mode.grounds.mapInfo[1]),n)
				return
			elseif p[1] == "is" then
				p[2] = p[2] or tfm.get.room.currentMap
				p[2] = tonumber(stringmatch(p[2],"@?(%d+)")) or 0
				
				local exist,index = tablefind(mode.grounds.maps,p[2],1)
				local cat = exist and mode.grounds.maps[index][2] or 0
				tfm.exec.chatMessage(stringformat("<BV>[•] @%s : %s",p[2],stringupper(tostring(exist)) .. (exist and " (G"..cat..")" or "")),n)
				return
			end
			
			if system.isRoom then
				if p[1] == mode.grounds.cmds.pw or p[1] == "pw" then
					if system.roomAdmins[n] or module._FREEACCESS[n] > 1 then
						local newPassword = p[2] and tableconcat(p," ",2) or ""
						local pwMsg = system.getTranslation().password
						if newPassword == "" then
							tfm.exec.chatMessage(stringformat("<R>[•] %s",pwMsg.off))
						else
							local xxx = stringrep("*",#newPassword)
							for k in next,mode.grounds.info do
								if system.roomAdmins[k] and system.isPlayer(k) then
									tfm.exec.chatMessage(stringformat("<R>[•] %s",stringformat(pwMsg.on,newPassword)),k)
								else
									tfm.exec.chatMessage(stringformat("<R>[•] %s",stringformat(pwMsg.on,xxx)),k)
								end
							end
						end
						tfm.exec.setRoomPassword(newPassword)
					else
						tfm.exec.chatMessage("<ROSE>[•] /room #" .. module._NAME .. mathrandom(0,999) .. "@" .. n,n)
					end
					return
				end
			end
			
			local freeaccess = system.isRoom and (module._FREEACCESS[n] and module._FREEACCESS[n] > 2) or module._FREEACCESS[n]

			local mapEvaluator = tablefind(mode.grounds.staff.mapEvaluators,n,1)
			if (mapEvaluator and (not system.isRoom or system.roomAdmins[n])) or freeaccess then
				if p[1] == "time" then
					tfm.exec.setGameTime(p[2] or 1e7)
					return
				elseif p[1] == "np" and p[2] then
					local official,where = tablefind(mode.grounds.maps,(tonumber((stringgsub(p[2],"@",""))) or 0),1)
					if official then
						tfm.exec.newGame(mode.grounds.newMap({
							map = mode.grounds.maps[where][1],
							category = mode.grounds.maps[where][2]
						}))
					elseif stringsub(p[2],1,1) == "g" then
						local cat = tonumber((stringsub(p[2],2))) or 1
						if mode.grounds.G[cat] then
							tfm.exec.newGame(mode.grounds.newMap({
								map = tablerandom(mode.grounds.G[cat].queue),
								category = cat
							}))
						end
					else
						mode.grounds.mapInfo = {0,0,0,0,"CAA4CF"}
						tfm.exec.newGame(p[2])
					end
					return
				elseif p[1] == "review" and (module._FREEACCESS[n] and module._FREEACCESS[n] > 2 or mapEvaluator) then
					mode.grounds.review = not mode.grounds.review
					tfm.exec.chatMessage("<BV>[•] REVIEW MODE : " .. stringupper(tostring(mode.grounds.review)))
					tfm.exec.disableAfkDeath(mode.grounds.review)
					
					if mode.grounds.review then
						tableforeach(mode.grounds.info,tfm.exec.respawnPlayer)
					end
					
					for k,v in next,mode.grounds.staff.mapEvaluators do
						system.bindMouse(v[1],mode.grounds.review)
						for i = 1,2 do
							system.bindKeyboard(v[1],16,i == 1,true) -- Shift (Hold shift to teleport)
						end
					end
					return
				elseif _G.currentTime > 10 then
					if p[1] == "next" then
						tfm.exec.newGame(mode.grounds.newMap())
						return
					elseif p[1] == "again" then
						if tfm.get.room.currentMap then
							tfm.exec.newGame(tfm.get.room.currentMap)
						end
						return
					end
				end
			end
			
			local translator = tablefind(mode.grounds.staff.translators,n,1)
			if translator or freeaccess then
				if p[1] == "check" then
					p[2] = p[2] and stringlower(p[2]) or nil
					if p[2] and mode.grounds.translations[p[2]] then
						local newP3 = p[3] and system.loadTable("mode.grounds.translations."..p[2].."."..p[3]) or {}
						if newP3 and type(newP3) == "string" then
							tfm.exec.chatMessage("<CEP>[•] [" .. p[3] .. "] : <N><VI>\"</VI>" .. newP3 .. "<VI>\"</VI>",n)
						else
							tfm.exec.chatMessage("<CEP>[•] " .. (p[3] and "Invalid! Try one of these indexes:" or "!" .. p[1] .. " " .. p[2] .. " <VI>id"),n)
							for k,v in next,mode.grounds.translationIndexes do
								tfm.exec.chatMessage("<N>\t\t" .. v,n)
							end
						end
					else
						tfm.exec.chatMessage("<CEP>[•] !" .. p[1] .. " " .. tableconcat(mode.grounds.langues," <G>-</G> "),n)
					end
					return
				end
			end
		end
	end,
	-- PlayerWon
	eventPlayerWon = function(n)
		if mode.grounds.availableRoom and not mode.grounds.review and mode.grounds.info[n].groundsDataLoaded and system.isPlayer(n) then
			mode.grounds.podium = mode.grounds.podium + 1
			
			if mode.grounds.podium < 4 then
				mode.grounds.info[n].stats.podiums = mode.grounds.info[n].stats.podiums + 1
				
				local addedCoins = 20 - mode.grounds.podium * 5
				mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins + addedCoins
				tfm.exec.setPlayerScore(n,4-mode.grounds.podium,true)
				tfm.exec.chatMessage(stringformat("<PT>[•] <BV>%s",stringformat(system.getTranslation(n).gotcoin,"<J>+$"..addedCoins.."</J>")),n)
				
				if mode.grounds.podium == 1 then
					tfm.exec.setGameTime(60,false)
				end
			else
				if mode.grounds.podium == 4 then
					tfm.exec.setGameTime(30,false)
				end
				
				mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins + 1
				tfm.exec.setPlayerScore(n,1,true)
			end
			
			if mode.grounds.hasWater then
				mode.grounds.displayWaterBar(n)
			end
			
			if system.miscAttrib ~= 0 then
				if mode.grounds.podium == system.miscAttrib then
					tfm.exec.setGameTime(0)
				end
			end
		end
		
		if mode.grounds.review or mode.grounds.isHouse then
			tfm.exec.respawnPlayer(n)
		else
			mode.grounds.info[n].canRev = false
		end
	end,
	-- PlayerDied
	eventPlayerDied = function(n)
		if mode.grounds.info[n].groundsDataLoaded and mode.grounds.availableRoom then
			mode.grounds.info[n].stats.deaths = mode.grounds.info[n].stats.deaths + 1
		end
		if mode.grounds.hasWater then
			if mode.grounds.info[n].drown > 0 then
				mode.grounds.displayWaterBar(n)
			end
		end
		
		system.bindKeyboard(n,32,true,false)
		ui.removeTextArea(-1,n)
		
		if mode.grounds.review or mode.grounds.isHouse then
			tfm.exec.respawnPlayer(n)
		end
	end,
	-- PlayerLeft
	eventPlayerLeft = function(n)
		if mode.grounds.info[n] then
			mode.grounds.info[n].isOnline = false
		end
	end,
	-- PlayerRespawn
	eventPlayerRespawn = function(n)
		if mode.grounds.info[n].checkpoint ~= -1 then
			local g = mode.grounds.gsys.grounds[mode.grounds.info[n].checkpoint]
			local hTP = mode.grounds.gsys.getTpPos(g,true)
			tfm.exec.movePlayer(n,hTP[1],hTP[2])
		end
		if mode.grounds.info[n].groundsDataLoaded and mode.grounds.availableRoom then
			mode.grounds.info[n].stats.rounds = mode.grounds.info[n].stats.rounds + 1
		end
		if mode.grounds.hasWater then
			mode.grounds.displayWaterBar(n)
		end
		if mode.grounds.startsWith.cheese then
			tfm.exec.giveCheese(n)
		end
		if mode.grounds.startsWith.meep then
			tfm.exec.giveMeep(n)
		end		
		
		if not mode.grounds.isHouse and not mode.grounds.review and system.officialMode[1] ~= "bootcamp" then
			tfm.exec.chatMessage(stringformat("<R>[•] %s",system.getTranslation(n).zombie),n)
		end
	end,
	-- Mouse
	eventMouse = function(n,x,y)
		if mode.grounds.review then
			if mode.grounds.info[n].holdingShift then
				tfm.exec.movePlayer(n,x,y)
			else
				tfm.exec.addShamanObject(0,x,y)
			end
		end
	end,
}

--[[ Jokenpo ]]--
mode.jokenpo = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to <ROSE>#Jokenpo<CE>! Choose a chair, press space and start playing!\n\tReport any issue to Bolodefchoco",
			
			-- Simple words
			round = "Round",
			players = "Players",
			won = "won the round!",
			tie = "Tie!",
			victory = "won the game!",
			
			-- Info
			guide = "Press\n\t<PS>»</PS> %s<PT> - Rock</PT>\n\t<PS>»</PS> %s<PT> - Paper</PT>\n\t<PS>»</PS> %s<PT> - Scissor (Pufferfish)</PT>",
			
			-- Game
			items = {"Rock","Paper","Scissor"},
			selected = "You've selected the item %s!",
		},
		br = {
			welcome = "Bem-vindo ao <ROSE>#Jokenpo<CE>! Escolha uma cadeira, aperte espaço e comece a jogar!\n\tReporte qualquer problema para Bolodefchoco",
		
			round = "Partida",
			players = "Jogadores",
			won = "venceu a partida!",
			tie = "Empate!",
			victory = "ganhou!",
			
			guide = "Pressione\n\t<PS>»</PS> %s<PT> - Pedra</PT>\n\t<PS>»</PS> %s<PT> - Papel</PT>\n\t<PS>»</PS> %s<PT> - Tesoura (Baiacu)</PT>",
			
			items = {"Pedra","Papel","Tesoura"},
			selected = "Você selecionou o item %s!",
		},
	},
	langue = "",
	--[[ Maps ]]--
	maps = {5198315,4093087},
	--[[ System ]]--
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
	--[[ Settings ]]--
	-- New Game
	playing = false,
	players = {},
	colors = {0xE3454D,0x4577E3,0x45E374},
	timer = 9.5,
	partialTimer = 0,
	tie = 0,
	round = 0,
	roundsPerGame = 5,
	-- Game
	objects = {
		85,
		95,
		65,
	},
	-- Emote
	emote = {
		sit = 8,
		victory = 24,
		fail = 5,
		tie = 4,
		no = 2
	},
	--[[ Win ]]--
	decision = function()
		for i = 1,2 do
			mode.jokenpo.players[i].obj = mode.jokenpo.players[i].obj ~= 0 and mode.jokenpo.players[i].obj or false
			if mode.jokenpo.players[i].obj then
				mode.jokenpo.players[i].remId = tfm.exec.addShamanObject(mode.jokenpo.objects[mode.jokenpo.players[i].obj],({350,455})[i],200)
			end
		end

		local winner = ((mode.jokenpo.players[1].obj and mode.jokenpo.players[2].obj) and ((3 + mode.jokenpo.players[1].obj - mode.jokenpo.players[2].obj) % 3) or mode.jokenpo.players[1].obj and 1 or mode.jokenpo.players[2].obj and 2 or 0)
		
		if winner == 0 then
			mode.jokenpo.tie = mode.jokenpo.tie + 1
			tfm.exec.chatMessage("<CE>[•] <J>" .. system.getTranslation().tie)
			
			for k,v in next,mode.jokenpo.players do
				tfm.exec.playEmote(v.name,mode.jokenpo.emote.tie)
			end
		else
			mode.jokenpo.players[winner].score = mode.jokenpo.players[winner].score + 1
			tfm.exec.playEmote(mode.jokenpo.players[winner].name,mode.jokenpo.emote.victory)
			
			local looser = (winner == 1 and 2 or 1)
			local looserEmote = mode.jokenpo.emote.fail
			if not mode.jokenpo.players[looser].obj then
				looserEmote = mode.jokenpo.emote.no
			end
			tfm.exec.playEmote(mode.jokenpo.players[looser].name,looserEmote)

			tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[winner].color .. mode.jokenpo.players[winner].name .. " " .. system.getTranslation().won)
		end
		
		ui.addTextArea(5,stringformat("<font size='50'><p align='center'>%s%d <PT>| <J>%d <PT>| %s%s",mode.jokenpo.players[1].color,mode.jokenpo.players[1].score,mode.jokenpo.tie,mode.jokenpo.players[2].color,mode.jokenpo.players[2].score),nil,5,270,795,nil,1,1,0,true)
	end,
	--[[ Round ]]--
	-- Partial Next Round
	pNextRound = function()
		mode.jokenpo.playing = false
		mode.jokenpo.timer = 9.5
		mode.jokenpo.partialTimer = 3.5
		mode.jokenpo.decision()
		if mode.jokenpo.round == mode.jokenpo.roundsPerGame then
			tablesort(mode.jokenpo.players,function(p1,p2) return p1.score > p2.score end)
			if (mode.jokenpo.players[1].score == mode.jokenpo.players[2].score) or (mode.jokenpo.tie > mode.jokenpo.players[1].score) then
				tfm.exec.chatMessage("<CE>[•] " .. system.getTranslation().tie)
			else
				tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[1].color .. mode.jokenpo.players[1].name .. " " .. system.getTranslation().victory)
			end
		end
	end,
	-- Next Round
	nextRound = function()
		for i = 1,2 do
			if mode.jokenpo.players[i].remId then
				tfm.exec.removeObject(mode.jokenpo.players[i].remId)
			end
			mode.jokenpo.players[i].remId = nil
			mode.jokenpo.players[i].obj = 0
		end
		ui.removeTextArea(5,nil)
		mode.jokenpo.partialTimer = 0
		if mode.jokenpo.roundsPerGame > mode.jokenpo.round then
			mode.jokenpo.playing = true
			mode.jokenpo.round = mode.jokenpo.round + 1
		else
			mode.jokenpo.playing = false
			mode.jokenpo.round = 0
			mode.jokenpo.tie = 0
			mode.jokenpo.timer = 9.5
			mode.jokenpo.partialTimer = 0
			mode.jokenpo.players = {}
			tfm.exec.newGame(tablerandom(mode.jokenpo.maps))
			for i = 2,3 do
				ui.removeTextArea(i,nil)
			end
		end
		mode.jokenpo.uiinfo()
	end,
	--[[ Display ]]--
	-- Names
	displayNames = function()
		if #mode.jokenpo.players == 0 then
			return ""
		else
			return "   <G>|   <N>" .. system.getTranslation().players .. " : " .. tablelist(mode.jokenpo.players," <V>- ",function(k,v)
				tfm.exec.setNameColor(v.name,mode.jokenpo.colors[v.id])
				return v.color .. v.name
			end)
		end
	end,
	-- UI
	uiinfo = function()
		ui.addTextArea(0,"<p align='center'><font size='35'><J>"..mathfloor(mode.jokenpo.timer),nil,380,85,40,40,1,1,0,true)
		ui.addTextArea(1,"<p align='center'><font size='25'><J><B>X</B><font size='13'>\n"..stringformat("%02d",mode.jokenpo.tie),nil,380,207,40,nil,1,1,0,true)
		
		for k,v in next,mode.jokenpo.players do
			ui.addTextArea(v.id + 1,"<p align='center'>"..v.name.."\n"..stringformat("%02d",v.score),nil,v.x,165,105,nil,1,1,0,true)
		end
		
		ui.setMapName("<PT>#Jokenpo   <G>|   <N>" .. system.getTranslation().round .. " : <V>" .. mode.jokenpo.round .. mode.jokenpo.displayNames() .. "<")
	end,
	--[[ Init ]]--
	reset = function()
		-- Scores
		mode.jokenpo.tie = 0
		mode.jokenpo.round = 0
		mode.jokenpo.roundsPerGame = 5
		
		-- Data
		mode.jokenpo.players = {}
		mode.jokenpo.playing = false
		
		-- Timers
		mode.jokenpo.timer = 9.5
		mode.jokenpo.partialTimer = 0
	end,
	init = function()
		-- Sets the rounds per game
		mode.jokenpo.roundsPerGame = mathmax(5,system.miscAttrib)
		
		-- Init
		for _,f in next,{"AutoShaman","AutoNewGame","PhysicalConsumables","AfkDeath"} do
			tfm.exec["disable"..f]()
		end
		tfm.exec.setAutoMapFlipMode(false)
		tfm.exec.setRoomMaxPlayers(20)

		tfm.exec.newGame(tablerandom(mode.jokenpo.maps))
	end,
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		tfm.exec.chatMessage("<CE>[•] " .. system.getTranslation().welcome,n)
	
		for k,v in next,{32,stringbyte("BNM",1,3)} do
			system.bindKeyboard(n,v,true,true)
		end
		
		if mode.jokenpo.playing then
			mode.jokenpo.round = mode.jokenpo.round + 1
		else
			tfm.exec.respawnPlayer(n)
		end
		
		mode.jokenpo.buildSquares(mode.jokenpo.colors)
		mode.jokenpo.uiinfo()
	end,
	-- NewGame
	eventNewGame = function()
		if mode.jokenpo.playing then
			for k,v in next,tfm.get.room.playerList do
				if not tablefind(mode.jokenpo.players,k,"name") then
					tfm.exec.killPlayer(k)
				end
			end
		end
	
		mode.jokenpo.colors = {0xE3454D,0x4577E3,0x45E374}	
		xml.attribFunc(tfm.get.room.xmlMapInfo.xml or "",{
			[1] = {
				attribute = "o",
				func = function(color)
					local c = stringsplit(color,"[^,]+",function(o)
						return stringmatch(o,"#?(.+)")
					end)
					
					for i = 1,#c do
						mode.jokenpo.colors[i] = tonumber(c[i],16)
					end
				end
			}
		})
		
		mode.jokenpo.buildSquares(mode.jokenpo.colors)
		mode.jokenpo.uiinfo()
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if k == 32 and #mode.jokenpo.players < 2 then
			for k,v in next,{{285,330,270},{515,330,425}} do
				if mathpythag(v[1],v[2],x,y,30) then
					if not tablefind(mode.jokenpo.players,n,"name") then
						if not tablefind(mode.jokenpo.players,k,"id") then
							mode.jokenpo.players[#mode.jokenpo.players + 1] = {
								name = n,
								x = v[3],
								score = 0,
								color = stringformat("<font color='#%s'>",stringformat("%x",mode.jokenpo.colors[k])),
								id = k,
								obj = 0,
								remId = nil,
							}
							
							tfm.exec.chatMessage("<CE>[•] " .. mode.jokenpo.players[#mode.jokenpo.players].color .. stringformat(system.getTranslation().guide,"B","N","M"),n)
							
							mode.jokenpo.uiinfo()
							tfm.exec.playEmote(n,mode.jokenpo.emote.sit)
						end
					end
				end
			end
			
			if #mode.jokenpo.players == 2 then
				tablesort(mode.jokenpo.players,function(p1,p2) return p1.id < p2.id end)
				mode.jokenpo.playing = true

				mode.jokenpo.round = mode.jokenpo.round + 1
				mode.jokenpo.uiinfo()
			end
		else
			if mode.jokenpo.playing then
				local foundObject,objectIndex = tablefind({stringbyte("BNM",1,3)},k)
				if foundObject then	
					local found,i = tablefind(mode.jokenpo.players,n,"name")
					if found then
						i = mode.jokenpo.players[i]
						if i.obj == 0 then
							i.obj = objectIndex

							tfm.exec.chatMessage("<CE>[•] " .. i.color .. stringformat(system.getTranslation().selected,system.getTranslation().items[objectIndex]),n)
						end
					end
				end
			end
		end
	end,
	-- Loop
	eventLoop = function()
		if mode.jokenpo.playing then
			if mode.jokenpo.timer > 0 then
				mode.jokenpo.timer = mode.jokenpo.timer - .5
				ui.addTextArea(0,"<p align='center'><font size='35'><J>"..mathfloor(mode.jokenpo.timer),nil,380,85,40,40,1,1,0,true)
				for i = 1,2 do
					tfm.exec.movePlayer(mode.jokenpo.players[i].name,({285,515})[i],330)
					tfm.exec.playEmote(mode.jokenpo.players[i].name,26)
				end
			else
				mode.jokenpo.pNextRound()
			end
		else
			if mode.jokenpo.partialTimer > 0 then
				mode.jokenpo.partialTimer = mode.jokenpo.partialTimer - .5
				ui.addTextArea(0,"<p align='center'><font size='35'><PT>"..mathfloor(mode.jokenpo.partialTimer),nil,380,85,40,40,1,1,0,true)
				
				if mode.jokenpo.partialTimer <= 0 then
					mode.jokenpo.nextRound()
				end
			end
		end
	end,
	-- PlayerLeft
	eventPlayerLeft = function(n)
		if tablefind(mode.jokenpo.players,n,"name") then
			mode.jokenpo.round = mode.jokenpo.roundsPerGame
			mode.jokenpo.nextRound()
		end
	end,
}

--[[ Click ]]--
mode.click = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "<BV>Welcome to <CH><B>#click</B><BV>!\n\t» Type <B>!p Playername</B> to open the profile of the player\n\t» Report any issue to <B>Bolodefchoco</B>",
		
			-- Info
			newGame = "New game in %s seconds!",
			clickfast = "Click constantly in the circle until %s seconds!",
			
			-- Simple words
			click = "CLICK!",
			won = "won!",
			
			-- Profile
			profile = "Total clicks <BL>: <V>%s\n<J>High Score <BL>: <V>%s\n\n<J>Victories <BL>: <V>%s",
		},
		br = {
			welcome = "<BV>Bem-vindo ao <CH><B>#click</B><BV>!\n\t\n\t» Digite <B>!p Jogador</B> para abrir o perfil do jogador\n\t» Reporte qualquer problema para <B>Bolodefchoco</B>",
			
			newGame = "Novo jogo em %s segundos!",
			clickfast = "Clique constantemente no círculo até %s segundos!",
			
			click = "CLIQUE!",
			won = "venceu!",
			
			profile = "Cliques totais <BL>: <V>%s\n<J>Maior pontuação <BL>: <V>%s\n\n<J>Vitórias <BL>: <V>%s",
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	--[[ Circle ]]--
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
	--[[ Timers ]]--
	partialTimer = 1,
	counter = 0,
	--[[ UI ]]--
	uileaderboard = function()
		local data = {}
		for k,v in next,mode.click.info do
			if v.canPlay and v.roundClick > 0 then
				data[#data + 1] = {k,v.roundClick}
			end
			
			if v.highScore < v.roundClick then
				v.highScore = v.roundClick
			end
			v.totalClick = v.totalClick + v.roundClick
			v.roundClick = 0
		end
		
		tablesort(data,function(p1,p2) return p1[2] > p2[2] end)
		
		local str = ""
		for k,v in next,data do
			if k < 51 then
				if k == 1 then
					mode.click.info[v[1]].victories = mode.click.info[v[1]].victories + 1
					tfm.exec.chatMessage("<J>" .. v[1] .. " <G>" .. system.getTranslation().won)
					tfm.exec.setPlayerScore(v[1],1,true)
				end
				
				str = str .. stringformat("<J>%s. <V>%s <BL>- <PT>%sP\n",k,v[1],v[2])
			end
		end
		
		ui.addTextArea(1,str,nil,5,30,250,330,1,1,.9,true)
	end,
	--[[ Init ]]--
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
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		system.bindMouse(n,true)
		if not mode.click.info[n] then
			mode.click.info[n] = {
				canPlay = false,
				totalClick = 0,
				roundClick = 0,
				highScore = 0,
				victories = 0,
			}
		end
		if not mode.click.circle.status then
			tfm.exec.respawnPlayer(n)
			mode.click.info[n].canPlay = true
		end
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
	end,
	-- NewGame
	eventNewGame = function()
		mode.click.spawnCircle(false)
		mode.click.partialTimer = 10.5
	end,
	-- Loop
	eventLoop = function()
		if mode.click.partialTimer > 0 then
			mode.click.partialTimer = mode.click.partialTimer - .5
			ui.setMapName(stringformat(system.getTranslation().newGame,"<ROSE>"..mathfloor(mode.click.partialTimer).."<J>") .. "<")
			if mode.click.partialTimer <= 0 then
				mode.click.spawnCircle(true)
				
				mode.click.counter = mathmax(20,system.miscAttrib)
				
				for k,v in next,mode.click.info do
					v.canPlay = true
					tfm.exec.respawnPlayer(k)
				end
				
				ui.removeTextArea(1,nil)
				ui.setMapName(system.getTranslation().click .. "<")
			end
		else
			if mode.click.counter > 0 then
				mode.click.counter = mode.click.counter - .5
				ui.addTextArea(0,"<p align='center'><font size='28'>" .. stringformat(system.getTranslation().clickfast,mathfloor(mode.click.counter)),nil,0,30,800,50,1,1,0,true)
				if mode.click.counter <= 0 then
					mode.click.spawnCircle(false)

					mode.click.partialTimer = 10.5

					ui.removeTextArea(0,nil)
					mode.click.uileaderboard()
				end
			end
		end
	end,
	-- Mouse
	eventMouse = function(n,x,y)
		if mode.click.circle.status then
			if mode.click.info[n].canPlay then
				if mathpythag(400,200,x,y,150) then
					mode.click.info[n].roundClick = mode.click.info[n].roundClick + 1
					tfm.exec.displayParticle(15,mathrandom(150,650),mathrandom(100,300),0,0,0,0,n)
				end
			end
		end
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+",stringlower)
		if p[1] == "p" then
			p[2] = p[2] and stringnick(p[2]) or n
			if mode.click.info[p[2]] then
				ui.addTextArea(2,"<p align='center'><font size='18'><a:active><a href='event:close'>"..p[2].."</a><p align='left'><font size='13'>\n<J>" .. stringformat(system.getTranslation().profile,mode.click.info[p[2]].totalClick,mode.click.info[p[2]].highScore,mode.click.info[p[2]].victories),n,620,295,175,100,1,1,1,true)
			end
		end
	end,
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		if c == "close" then
			ui.removeTextArea(2,n)
		end
	end,
	-- PlayerDied
	eventPlayerDied = function(n)
		tfm.exec.respawnPlayer(n)
	end,
	-- PlayerLeft
	eventPlayerLeft = function(n)
		mode.click.info[n].canPlay = false
	end,
}

--[[ Presents ]]--
mode.presents = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "<J>Welcome to <VP><B>#presents</B><J>! Choose a gap according to the gift represented and good luck! You will win if your three-gifts-sequence is correct!\nType !p PlayerName to open the profile of the specified player\n\n<CE>Developed by Bolodefchoco and projected by Ruamorangos",
		
			-- Info
			choose = "You have <PT>%s seconds</PT> to choose a gift!",
			kill = "Those who are out of the correct gift will die!",
			newGame = "New game in <PT>%s seconds!",
			nowinner = "No one won!",
			appear = "You will appear in the next game!",
			
			-- Simple words
			rival = "Rivals",
			won = "won!",
			
			-- Profile
			profile = "Rounds <BL>: <V>%s\n<J>Gifts <BL>: <V>%s\n\n<J>Victories <BL>: <V>%s",
		},
		br = {
			welcome = "<J>Bem-vindo ao <VP><B>#presents</B><J>! Escolha um buraco de acordo com o presente representado e boa sorte! Você ganhará se sua sequência nos três presentes estiver correta!\nDigite !p Jogador para abrir o perfil do jogador especificado\n\n<CE>Desenvolvido por Bolodefchoco, pedido por Ruamorangos",
		
			choose = "Você tem <PT>%s segundos</PT> para escolher um presente!",
			kill = "Aqueles que estão fora do presente correto morrerão!",
			newGame = "Novo jogo em <PT>%s segundos!",
			nowinner = "Ninguém ganhou!",
			appear = "Você irá aparecer no próximo jogo!",
			
			rival = "Rivais",
			won = "venceu!",

			profile = "Partidas <BL>: <V>%s\n<J>Presentes <BL>: <V>%s\n\n<J>Vitórias <BL>: <V>%s",
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	--[[ Status ]]--
	isRunning = false,
	gifts = {},
	--[[ Timers ]]--
	chooseTimer = 15,
	blockTimer = 0,
	newMapTimer = 0,
	currentGift = 1,
	--[[ Maps ]]--
	generateMap = function()
		mode.presents.gifts = {
			[1] = tablerandom({2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101}),
			[2] = tablerandom({2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104}),
			[3] = tablerandom({2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102,2100,2101,2103,2100,2104,2102,2103,2101,2104,2102})
		}
		
		tfm.exec.newGame('<C><P DS="m;250,120,400,120,550,120" D="x_transformice/x_inventaire/'..mode.presents.gifts[1]..'.jpg,230,60;x_transformice/x_inventaire/'..mode.presents.gifts[2]..'.jpg,380,60;x_transformice/x_inventaire/'..mode.presents.gifts[3]..'.jpg,530,60;x_transformice/x_inventaire/2100.jpg,140,320;x_transformice/x_inventaire/2101.jpg,260,320;x_transformice/x_inventaire/2102.jpg,380,320;x_transformice/x_inventaire/2103.jpg,500,320;x_transformice/x_inventaire/2104.jpg,620,320" /><Z><S><S P="1,0.0001,20,0.2,90,1,0,0" H="700" L="15" X="400" c="3" Y="161" T="4" /><S X="100" P="0,0,20,0.2,0,0,0,0" L="40" H="135" c="3" Y="335" T="4" /><S H="135" P="0,0,20,0.2,0,0,0,0" L="40" X="220" c="3" Y="335" T="4" /><S X="340" P="0,0,20,0.2,0,0,0,0" L="40" H="135" c="3" Y="335" T="4" /><S H="135" P="0,0,20,0.2,0,0,0,0" L="40" X="460" c="3" Y="335" T="4" /><S X="580" P="0,0,20,0.2,0,0,0,0" L="40" H="135" c="3" Y="335" T="4" /><S H="40" P="0,0,0.3,0.2,0,0,0,0" L="40" X="100" c="3" Y="160" T="0" /><S X="700" P="0,0,0.3,0.2,0,0,0,0" L="40" H="40" c="3" Y="160" T="0" /><S X="550" P="0,0,0.3,0.2,0,0,0,0" L="40" H="40" c="3" Y="160" T="0" /><S X="400" P="0,0,0.3,0.2,0,0,0,0" L="40" H="40" c="3" Y="160" T="0" /><S X="250" P="0,0,0.3,0.2,0,0,0,0" L="40" H="40" c="3" Y="160" T="0" /><S H="20" P="0,0,0.3,0.2,0,0,0,0" L="800" X="400" Y="10" T="0" /><S H="135" P="0,0,20,0.2,0,0,0,0" L="40" X="700" c="3" Y="335" T="4" /><S X="400" P="0,0,0.3,0.2,0,0,0,0" L="800" H="100" c="3" Y="415" T="0" /><S P="0,0,0.3,0.2,0,0,0,0" H="10" L="50" o="324650" X="745" c="3" Y="138" T="13" /><S X="55" P="0,0,0.3,0.2,0,0,0,0" L="50" o="324650" H="10" c="3" Y="138" T="13" /><S P="0,0,0.3,0.2,0,0,0,0" H="140" L="100" o="324650" X="55" c="3" Y="72" T="12" /><S X="745" P="0,0,0.3,0.2,0,0,0,0" L="100" o="324650" H="140" c="3" Y="72" T="12" /><S P="0,0,0,0,0,0,0,0" H="102" L="581" o="6a7495" X="401" c="4" v="3001" Y="78" T="12" /></S><D /><O /><L><JR M2="10" M1="0" /></L></Z></C>')
	end,
	--[[ System ]]--
	-- Kill
	killOutOfRange = function()
		local gift = mode.presents.gifts[mode.presents.currentGift] - 2099
		for k,v in next,tfm.get.room.playerList do
			if not v.isDead then
				if v.x >= (gift * 120) and v.x <= (gift * 120 + 80) and v.y > 267 then
					mode.presents.info[k].gifts = mode.presents.info[k].gifts + 1
					tfm.exec.setPlayerScore(k,1,true)
				else
					tfm.exec.killPlayer(k)
				end
			end
		end
	end,
	-- Win
	victory = function(noone)
		noone = noone or system.players() < 1
		
		if noone then
			tfm.exec.chatMessage("<J>" .. system.getTranslation().nowinner)
			mode.presents.chooseTimer = 0
			mode.presents.blockTimer = 0
		else
			tfm.exec.chatMessage("<S>" .. tablelist(system.players(true),"<J>, <S>",function(k,v)
				mode.presents.info[v].victories = mode.presents.info[v].victories + 1
				return v
			end) .. " <J>" .. system.getTranslation().won)
		end
		mode.presents.newMapTimer = 10.5
	end,
	--[[ Init ]]--
	reset = function()
		-- Data
		mode.presents.info = {}
	end,
	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoNewGame","AutoScore","AfkDeath","MortCommand","DebugCommand","PhysicalConsumables"} do
			tfm.exec["disable"..f]()
		end	
		tfm.exec.setRoomMaxPlayers(30)
		
		system.newTimer(function()
			mode.presents.generateMap()
		end,1000,false)
		
		-- Auto Admin
		system.roomAdmins["Ruamorangos#0000"] = true
	end,
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		if not mode.presents.info[n] then
			mode.presents.info[n] = {
				rounds = 0,
				gifts = 0,
				victories = 0,
			}
		end
		
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
		
		if mode.presents.isRunning then
			ui.addTextArea(0,"<p align='center'><font size='20'><VP>" .. system.getTranslation().appear,n,216,65,365,35,1,1,1,true)
		else
			tfm.exec.respawnPlayer(n)
		end
		
		ui.banner("15d75ac29b7",200,150,n)
	end,
	-- NewGame
	eventNewGame = function()
		mode.presents.isRunning = true
		for i,x in next,{250,400,550} do
			tfm.exec.addPhysicObject(i,x,75,{
				type = 12,
				height = 90,
				width = 90,
				miceCollision = false,
				groundCollision = false,
				color = 0x6A7495
			})
		end
		for i = 0,1 do
			ui.removeTextArea(i)
		end
		mode.presents.chooseTimer = 15
		mode.presents.blockTimer = 0
		mode.presents.newMapTimer = 0
		mode.presents.currentGift = 1
		for k,v in next,mode.presents.info do
			v.rounds = v.rounds + 1
		end
	end,
	-- Loop
	eventLoop = function()
		local mapName = "<N>" .. system.getTranslation().rival .." : <V>" .. mathisNegative(system.players()-1,0)
		if _G.currentTime > 4 and mode.presents.isRunning then
			if mode.presents.chooseTimer > 0 then
				mode.presents.chooseTimer = mode.presents.chooseTimer - .5
				
				if mode.presents.chooseTimer <= 0 then
					mode.presents.blockTimer = 5
					tfm.exec.addPhysicObject(4,400,270,{
						type = 4,
						height = 10,
						width = 640,
						miceCollision = true,
						groundCollision = false
					})
					tfm.exec.removePhysicObject(mode.presents.currentGift)
				else
					mapName = mapName .. "   <G>|   <J>" .. stringformat(system.getTranslation().choose,mathfloor(mode.presents.chooseTimer).."<J>")
				end
				
				if system.players() == 0 then
					mode.presents.victory(true)
				end
			end
			
			if mode.presents.blockTimer > 0 then
				mode.presents.blockTimer = mode.presents.blockTimer - .5
				
				if mode.presents.blockTimer == 2 then
					mode.presents.killOutOfRange()
				end
				
				if mode.presents.blockTimer <= 0 then
					mode.presents.currentGift = mode.presents.currentGift + 1
					if mode.presents.currentGift > 3 then
						mode.presents.victory()
					else
						tfm.exec.removePhysicObject(4)
						mode.presents.chooseTimer = 15
					end
				else
					mapName = mapName .. "   <G>|   <R>" .. system.getTranslation().kill
				end
			end
			
			if mode.presents.newMapTimer > 0 then
				mode.presents.newMapTimer = mode.presents.newMapTimer - .5
				
				mapName = "<PS>" .. stringformat(system.getTranslation().newGame,mathfloor(mode.presents.newMapTimer) .. "<PS>")
				if mode.presents.newMapTimer <= 0 then
					mode.presents.generateMap()
				end
			end
		end
		ui.setMapName(mapName .. "<")
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+",stringlower)
		if p[1] == "p" then
			p[2] = p[2] and stringnick(p[2]) or n
			if mode.presents.info[p[2]] then
				ui.addTextArea(1,"<p align='center'><font size='18'><a:active><a href='event:close'>"..p[2].."</a><p align='left'><font size='13'>\n<J>" .. stringformat(system.getTranslation().profile,mode.presents.info[p[2]].rounds,mode.presents.info[p[2]].gifts,mode.presents.info[p[2]].victories),n,5,30,790,100,1,1,.8,true)
			end
		end
	end,
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		if c == "close" then
			ui.removeTextArea(1,n)
		end
	end,
}

--[[ Chat ]]--
mode.chat = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "<J>Welcome to #chat. Enjoy while you are muted ?! Report any issue to Bolodefchoco.",
		
			-- Info
			loadmap = "loaded by",
			enabled = "enabled",
			disabled = "disabled",
			
			-- Cats
			shaman = "shaman",
			newGame = "Auto New Game",
			
			-- Misc
			title = "%s has just unlocked the «%s» title.\n<ROSE>Type /title to choose a title",
		},
		ar = {
			welcome = "<J>مرحبًا بك في #chat. استمتع بينما أنت مكتوم ?! بلغ عن أي مشكلة إلى Bolodefchoco.",
		
			loadmap = "شُغل بواسطة",
			enabled = "فُعل",
			disabled = "أُلغي",
			
			shaman = "الشامان",
			newGame = "جولة جديدة تلقائية",
			
			title = "%s has just unlocked the «%s» title.\n<ROSE>Type /title to choose a title",
		},
		br = {
			welcome = "<J>Bem-vindo ao #chat. Aproveite enquanto você está mutado ?! Reporte qualquer problema para Bolodefchoco.",
		
			loadmap = "carregado por",
			enabled = "ativado",
			disabled = "desativado",
			
			shaman = "shaman",
			newGame = "Novo Jogo Automático",
			
			title = "%s Desbloqueou o título «%s»\n<ROSE>Digite /title para escolher um título.",
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	data = {},
	displayData = {},
	messageId = 0,
	--[[ Settings ]]--
	-- New Game
	hasShaman = false,
	autoNeWGame = false,
	-- Chat
	chatTitle = "Chat",
	--[[ System ]]--
	-- Chat
	chat = function(n,message,update)
		if not update then
			ui.addPopup(0,2,"",n,107,325,565,true)
		end
		ui.addTextArea(0,"",n,108,73,564,253,0x212E35,0x212E35,1,true)
		ui.addTextArea(1,message,n,110,75,560,250,0x324650,0x324650,1,true)
		ui.addTextArea(2,"<p align='center'><B><V>" .. mode.chat.chatTitle,n,108,53,564,20,0x212E35,0x212E35,1,true)
		ui.addTextArea(3,"<p align='right'><B><R><a href='event:close'>X",n,110,54,560,20,1,1,0,true)
	end,
	-- Length
	getTextLength = function(line)
		return stringlen(stringgsub(line,"<.*>",""))
	end,
	-- Data
	loadData = function()
		local message = "<font size='7'>\n</font>"
		for i = 18,1,-1 do
			if #message < 1900 then
				local line = mode.chat.displayData[i] or ""
				message = message .. line
			end
		end
		return message
	end,
	-- Update
	updateToRead = function(n)
		ui.addTextArea(4,"<p align='center'><V><a href='event:open'><B>" .. stringsub(stringlower(mode.chat.chatTitle),1,8) .. "</B> <J>" .. mode.chat.info[n].toRead,n,712,378,80,nil,0x324650,0x212E35,1,true)
	end,
	-- Display
	displayChat = function(n,update)
		local loadedM = mode.chat.loadData()
		if not update then
			mode.chat.chat(n,loadedM)
		else
			for k,v in next,mode.chat.info do
				if v.open then
					mode.chat.chat(k,loadedM,k ~= n)
				else
					v.toRead = v.toRead + 1
					mode.chat.updateToRead(k)
				end
			end
		end
	end,
	-- Message
	newMessage = function(message,n)
		mode.chat.messageId = mode.chat.messageId + 1
		tableinsert(mode.chat.data,{mode.chat.messageId,n,stringgsub(stringgsub(message,"@%((.*)%)",function(text) return text end),"{.-:(.-)}",function(text) return text end)})
	
		if mode.chat.getTextLength(message) > 50 then
			message = stringsub(message,1,47) .. "..."
		end
		message = stringgsub(message,"<","&lt;") -- < to <
		message = stringgsub(message,"https?","") -- https to ""
		message = stringgsub(message,"://","") -- :// to ""
		message = stringgsub(message,"@%((.*)%)",function(text) -- @(link:text)
			return stringformat("<a href='event:display.%s'>%s</a>",mode.chat.messageId,text)
		end)
		
		if #message > 0 then
			if stringsub(message,1,1) == "/" then
				mode.chat.eventChatCommand(n,stringsub(message,2))
			else
				message = stringgsub(message,"{(.-):(.-)}",function(color,text) -- {colorTag:Text}
					color = stringupper(color)
					if tablefind({"BV","R","BL","J","N","N2","PT","CE","CEP","CS","S","PS","G","V","VP","VI","ROSE","CH","T"},color) then
						return stringformat("<%s>%s</%s>",color,text,color)
					else
						return text
					end
				end)
				
				local nick = n:gsub("#0000", ""):gsub("#", " #")
				tableinsert(mode.chat.displayData,1,stringformat("<V>[%s] <N>%s\n",nick,message))
			end
		end
	end,
	--[[ Init ]]--
	init = function()
		tfm.exec.setRoomMaxPlayers(30)
		system.disableChatCommandDisplay("title",true)
		mode.chat.displayChat()
	end,
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		mode.chat.info[n] = {
			open = true,
			toRead = 0,
		}
		mode.chat.displayChat(n)
		tfm.exec.chatMessage(system.getTranslation().welcome,n)
	end,
	-- PopupAnswer
	eventPopupAnswer = function(i,n,a)
		if #stringgsub(a," ","") > 0 then
			mode.chat.newMessage(a,n)
			mode.chat.displayChat(n,true)
		else
			mode.chat.displayChat(n)
		end
	end,
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		local p = stringsplit(c,"[^%.]+")
		if p[1] == "close" then
			ui.addPopup(0,2,"",n,1e7,1e7)
			for i = 0,3 do
				ui.removeTextArea(i,n)
			end
			mode.chat.info[n].open = false
			mode.chat.updateToRead(n)
		elseif p[1] == "open" then
			mode.chat.info[n].open = true
			mode.chat.info[n].toRead = 0
			mode.chat.displayChat(n)
			ui.removeTextArea(4,n)
		elseif p[1] == "display" then
			local msg = mode.chat.data[tonumber(p[2])]		
			tfm.exec.chatMessage(stringformat("<N>> <V>[%s] <N>%s",msg[2],msg[3]),n)
		end
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+",stringlower)
		if p[1] == "title" and p[2] and system.roomAdmins[n] then
			mode.chat.chatTitle = stringsub(tableconcat(p," ",2),1,40)
			mode.chat.displayChat()
		elseif p[1] == "np" and p[2] then
			tfm.exec.chatMessage(stringformat("<S>%s %s %s",stringsub(p[2],1,1) == "@" and p[2] or "@" .. p[2],system.getTranslation().loadmap,n))
			tfm.exec.newGame(p[2])
		elseif p[1] == "sha" then
			mode.chat.hasShaman = not mode.chat.hasShaman
			
			tfm.exec.chatMessage("<S>• " .. system.getTranslation().shaman .. " " .. system.getTranslation()[(mode.chat.hasShaman and "disabled" or "enabled")],n)
			tfm.exec.disableAutoShaman(mode.chat.hasShaman)
		elseif p[1] == "new" then
			mode.chat.autoNeWGame = not mode.chat.autoNeWGame
		
			tfm.exec.chatMessage("<S>• " .. system.getTranslation().newGame .. " " .. system.getTranslation()[(mode.chat.autoNeWGame and "disabled" or "enabled")],n)
			tfm.exec.disableAutoNewGame(mode.chat.autoNeWGame)
			tfm.exec.disableAutoTimeLeft(mode.chat.autoNeWGame)
		elseif stringsub(c,1,6) == "unlock" then
			tfm.exec.chatMessage("<J>" .. stringformat(system.getTranslation().title,n,stringsub(c,8)),n)
		end
	end,
}

--[[ Xmas ]]--
mode.xmas = {
	-- Translations
	translations = {
		en = {"Merry Christmas & Happy New Year!","Christmas is approaching and S4nt4 has a lot to do on his <I>paws</I>. He wants to give all the gifts on time, but he must be fast! Since our dear S4nt4 is clumsy, some gifts will fall and you will have to <CE>collect</CE> them by pressing the <I>space bar</I>! Give the gifts back to S4nt4 when he feels <CE>dizzy</CE> by pressing the <I>space bar</I>!"},
		ar = {"عيد ميلاد مجيدا و كل عام و أنتم بخير","عيد الميلاد اقترب و<I> يدى </I> سانتا مليئة. يريد سانتا تسليم جميع الهدايا على الوقت, ولكن يجب ان يكون سريعا! ولكن صديقنا العزيز سانتا غير بارع في تسليم الهدايا, بعض الهدايا ستسقط وعليك ان تقوم <CE> بجمع</CE>  الهدايا التي سقطت عن طريق الضغط على المسطرة ! وارجاع الهدايا الى صديقنا العزيز سانتا عندما يشعر <CE> بالدوار</CE> عن طريق الضغط على زر المسطرة!"},
		br = {"Feliz Natal & Feliz Ano Novo!","O Natal está chegando e S4nt4 tem em suas <I>patas</I> muito o que fazer. Ele quer entregar todos os presentes a tempo, mas ele deve ser rápido! Uma vez que nosso querido S4NT4 é desajeitado, alguns presentes cairão e você terá que <CE>coletá-los</CE> pressionando a <I>barra de espaço</I>! Devolva os presentes ao S4nt4, pressionando a <I>barra de espaço</I>, quando ele se sentir <CE>tonto</CE>!"},
		es = {"¡Feliz Navidad y Próspero Año Nuevo!","La Navidad se está acercando y S4nt4 tiene muchas cosas que hacer con sus <I>patas</I>. Él quiere dar todos los regalos a tiempo, pero debe ser rápido! Puesto que nuestro querido S4nt4 es torpe, algunos regalos caerán y tendrás que <CE>recogerlos</CE> pulsando la <I>barra espaciadora</I>! Regrese los regalos a S4nt4 cuando se sienta <CE>mareado</CE> presionando la <I>barra de espacio</I>!"},
		fr = {"Joyeux Noël et Bonne Année!","Noël approche et S4nt4 en a plein les <I>pattes</I>. Il veut donner tous les cadeaux à temps, mais il doit être rapide ! Puisque notre cher S4nt4 est maladroix, certains cadeaux tombent et vous devrez les, <CE>collecter</CE> en appuyant sur la <I>barre d'espace</I>! Donnez les cadeaux à S4nt4 quand il se sent <CE>étourdi</CE> en appuyant sur la <I>barre d'espace</I>!"},
		hu = {"Boldog Karácsonyt & Boldog Új Évet!","A Karácsony közeleg, és a Mikulásra pedig <I>rengeteg munka vár<I>. Oda akarja adni az összes ajándékot időben, de muszáj gyorsnak lennie! Mivel a mi Mikulásunk kétbalkezes, néhány ajándék lepottyan és Neked kell <CE>összegyűjteni</CE> azokat, a <I>Szóköz</I> megnyomásával! Vidd vissza a Mikulásnak az ajándékot a <I>Szóköz</I> megnyomásával, amikor Mikulás <CE>megszédül</CE>!"},
		pl = {"Wesołych Świąt i Wesołego Nowego Roku!","Święta nadchodzą, a S4nt4 ma <I>łapki</I> pełne roboty. On chce dać wszystkim prezenty na czas, ale musi się pośpieszyć! Od kiedy nasz S4nt4 jest niezdarny, gubi prezenty, które musicie <CE>pozbierać</CE> wciskając <I>spację</I>! Oddajcie prezenty S4nt4 kiedy jest <CE>oszołomiony</CE> wciskając <I>spację</I>!"},
		ru = {"С новым годом и Рождеством!","Рождество приближается и S4nt4 направляется к вам! Он очень спешит, чтобы раздать все подарки вовремя! Но так как наш дорогой S4nt4 неуклюж, то некоторые подарки будут падать. Вы должны <CE>собрать</CE> их, нажимая клавишу <I>пробел</I>! Помогите S4nta. <CE>Верните</CE> ему подарки обратно с помощью <I>пробела</I>!"},
		tr = {"Mutlu Noeller & Mutlu Yıllar!","Noel geliyor ve S4nt4'nın <I>patilerinde</I> yapacağı çok işi var. Bütün hediyeleri zamanında vermek istiyor ama hızlı olması gerek! Sevgili S4nt4'mız sakar olduğu için, bazı hediyeler düşecek ve <I>boşluk tuşuna</I> basarak onları <CE>toplamanız</CE> gerekecek! S4nt4'nın <CE>başı döndüğünde</CE> <I>boşluk tuşuna</I> basarak hediyeleri ona geri verin!"},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	gifts = {
		[1] = {
			[1] = "158bb1db61b",
			[2] = 20000,
		};
		[2] = {
			[1] = "158bb1c95e0",
			[2] = 15000,
		};
		[3] = {
			[1] = "158bb1cc6ec",
			[2] = 10000,
		};
		[4] = {
			[1] = "158bb1ce1aa",
			[2] = 8000,
		};
		[5] = {
			[1] = "1591c9b3123",
			[2] = 6000,
		};
	},
	--[[ Maps ]]--
	xml = '<C><P DS="y;310" /><Z><S><S H="10" L="50" X="275" c="2" Y="165" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="200" X="100" H="80" Y="360" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="200" X="109" H="80" Y="379" T="12" P="0,0,0.3,0.2,-10,0,0,0" /><S X="391" L="230" H="80" c="3" Y="354" T="12" P="0,0,0.3,0.2,-2,0,0,0" /><S H="100" L="230" X="430" c="3" Y="411" T="12" P="0,0,0.3,0.2,-30,0,0,0" /><S H="80" L="180" X="705" c="3" Y="397" T="12" P="0,0,0.3,0.2,-2,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="44" H="10" c="3" Y="361" T="13" X="237" /><S X="-5" L="10" H="3000" c="3" Y="100" T="12" P="0,0,0,0,0,0,0,0" /><S H="3000" L="10" X="805" c="3" Y="101" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" X="400" H="3000" Y="-5" T="12" P="0,0,0,0,90,0,0,0" /><S L="80" H="10" X="96" Y="158" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,.9,0,0,0,0" L="50" X="275" c="3" Y="165" T="12" H="10" /><S L="130" X="527" H="10" Y="128" T="12" P="0,0,0.3,0.2,10,0,0,0" /><S L="90" H="10" X="632" Y="131" T="12" P="0,0,0.3,0.2,-10,0,0,0" /><S H="3000" L="10" o="23E9E9" X="805" c="2" Y="100" T="12" m="" P="0,0,0,2,0,0,0,0" /><S X="-5" L="10" o="23E9E9" H="3000" c="2" Y="100" T="12" m="" P="0,0,0,2,0,0,0,0" /><S P="0,0,0.3,0.2,-35,0,0,0" L="230" X="549" c="3" Y="467" T="12" H="100" /><S P="0,0,0.3,0.2,-55,0,0,0" L="230" H="100" c="3" Y="441" T="12" X="250" /><S L="230" X="125" H="100" Y="422" T="12" P="0,0,0.3,0.2,-30,0,0,0" /><S X="510" L="230" H="100" c="3" Y="477" T="12" P="0,0,0.3,0.2,-65,0,0,0" /><S L="50" X="91" H="50" Y="339" T="12" P="0,0,0.3,0.2,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="30" X="164" c="2" Y="325" T="12" H="50" /><S P="0,0,0.3,1.1,0,0,0,0" L="30" H="50" c="3" Y="325" T="12" X="164" /><S L="50" X="240" H="10" Y="158" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="50" H="10" X="443" Y="125" T="12" P="0,0,0.3,0.2,-20,0,0,0" /><S H="80" L="220" o="23E9E9" X="393" c="1" Y="359" T="12" m="" P="0,0,0.3,0.2,-2,0,0,0" /><S L="230" o="23E9E9" X="427" H="100" Y="416" T="12" m="" P="0,0,0.3,0.2,-30,0,0,0" /><S P="0,0,0.3,0.2,-65,0,0,0" L="230" o="23E9E9" H="100" Y="481" T="12" m="" X="501" /><S P="0,0,0.3,0.2,-35,0,0,0" L="230" o="23E9E9" H="100" Y="474" T="12" m="" X="550" /><S P="0,0,0.3,0.2,-2,0,0,0" L="180" o="23E9E9" X="706" Y="404" T="12" m="" H="80" /><S P="0,0,0.3,0.2,1,0,0,0" L="230" o="23E9E9" X="314" c="2" Y="373" T="12" m="" H="100" /></S><D><P X="241" Y="507" T="51" P="0,1" /><P X="566" Y="449" T="46" P="0,0" /></D><O /></Z></C>',
	--[[ Settings ]]--
	-- New Game
	initx = 240,
	inity = 140,
	aim = 8,
	start = true,
	amountPlayers = 20,
	despawnObjects = {},
	currentGifts = {},
	currentTime = 0,
	leftTime = 150,
	-- Player
	setPlayerTools = function(k)
		mode.xmas.info[k] = {
			db = {
				eventNoelGifts = {0,0},
			},
			catch = 0,
			lastColor = 0xB73535,
		}
		if not tfm.get.room.playerList[k].isDead then
			system.bindKeyboard(k,32,true,true)
		end
		mode.xmas.updateBar(k)
	end,
	--[[ System ]]--
	-- Noel
	noel = {
		x = 240,
		y = 140,
		id = -1,
		isEscaping = false,
		isDizzy = {0,false},
		timers = {
			teleport = 0,
			prize = 0
		},
		img = {
			dizzy = {"158bb1dccb6","158bb1cf9a8","158bb1d6489","158bb1e2518"},
			right = "158bb1d8069",
			left = "158bb1e0daf",
			jumping = "158bb1d470a",
			stop = "158bb1d9b67",
		},
		updateImage = function(img)
			tfm.exec.removeImage(mode.xmas.noel.imgId)
			mode.xmas.noel.imgId = tfm.exec.addImage(img..".png","#"..mode.xmas.noel.id,-23,-32)
		end,
		particles = function(id)
			for i = 1,5 do
				tfm.exec.displayParticle(id,mode.xmas.noel.x + mathrandom(-50,50),mode.xmas.noel.y + mathrandom(-50,50),tablerandom({-.2,.2}),tablerandom({-.2,.2}))
			end
		end,
		move = function(x,y)
			tfm.exec.moveObject(mode.xmas.noel.id,0,0,false,x,y,false)
		end,
		nearMouse = function(range)
			local player = {"",{dist=mathrandom(800),x=0,y=0}}
			for k,v in next,tfm.get.room.playerList do
				if not v.isDead then
					if mathpythag(v.x,v.y,mode.xmas.noel.x,mode.xmas.noel.y,range) then
						local m = v.x-mode.xmas.noel.x
						if mathabs(m) < player[2].dist then
							player = {k,{dist=m,x=v.x,y=v.y}}
						end
					end
				end
			end
			mode.xmas.noel.isEscaping = player[1] ~= ""
			return player
		end,
		escape = function(id)
			local player = mode.xmas.noel.nearMouse(mathrandom(80,100))
			local mul = (player[1] ~= "" and mathisNegative(player[2].dist,1,-1) or tablerandom({-1,1}))
			local img = mathisNegative(mul,"left","right")
			local rand = 9 - mathrandom(0,9)
			if id == 0 or (rand < 6) then
				mode.xmas.noel.move(mul * mathrandom(50,80),-mathrandom(1,10))
				mode.xmas.noel.updateImage(mode.xmas.noel.img[img])
			elseif id == 1 or (rand < 9) then
				mode.xmas.noel.move(mul * mathrandom(60,70),-80)
				mode.xmas.noel.updateImage(tablerandom({mode.xmas.noel.img[img],mode.xmas.noel.img.jumping}))
			elseif id == 2 or rand == 9 then
				mode.xmas.noel.move(mul * mathrandom(10,20),-mathrandom(70,100))
				mode.xmas.noel.updateImage(mode.xmas.noel.img.jumping)
			end
		end,
		meep = function()
			tfm.exec.displayParticle(20,mode.xmas.noel.x,mode.xmas.noel.y)
			tfm.exec.explosion(mode.xmas.noel.x,mode.xmas.noel.y,20,50)
		end,
		cannon = function()
			local player = mode.xmas.noel.nearMouse(100)
			if player[1] ~= "" then
				local x = mode.xmas.noel.x + (mode.xmas.noel.x > player[2].x and -40 or 40)
				local y = mode.xmas.noel.y + (mode.xmas.noel.y > player[2].y and -40 or 40)
				local angle = mathdeg(mathatan2(player[2].y-mode.xmas.noel.y,player[2].x-mode.xmas.noel.x)) + 90
				tableinsert(mode.xmas.despawnObjects,{
					[1] = tfm.exec.addShamanObject(1703,x,y,angle),
					[2] = os.time() + 2500
				})
				local effect = function(id,sx,sy,xs,ys,e)
					for i = 1,2 do
						tfm.exec.displayParticle(id[i] and id[i] or id[1],x + sx * e,y - sy * e,xs/1.5,ys/1.5)
					end
				end
				for i = 1,20 do
					effect({9,11},mathcos(i),mathsin(i),mathcos(i),-mathsin(i),22)
					effect({13},mathcos(i),mathsin(i),mathsin(i),mathcos(i),19)
				end
			end
		end,
		teleport = function()
			if os.time() > mode.xmas.noel.timers.teleport then
				mode.xmas.noel.timers.teleport = os.time() + 8000
				tfm.exec.displayParticle(37,mode.xmas.noel.x,mode.xmas.noel.y)
				local x,y = mathrandom(20,780),mathrandom(50,300)
				tfm.exec.moveObject(mode.xmas.noel.id,x,y)
				tfm.exec.displayParticle(37,x,y)
			else
				mode.xmas.noel.escape(2)
			end
		end,
		gift = function()
			if os.time() > mode.xmas.noel.timers.prize then
				mode.xmas.noel.timers.prize = os.time() + 5000
				mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
				local giftsAmount = mode.xmas.amountPlayers < 10 and 1 or mathfloor(mode.xmas.amountPlayers/10)
				for i = 1,giftsAmount do
					local gift = tablerandom({2,4,3,1,1,2,3,5,2,4})
					for k,v in next,mode.xmas.gifts do
						if gift == k then
							gift = k
							break
						end
					end
					local gen = {}
					gen[1] = tfm.exec.addShamanObject(6300,mode.xmas.noel.x,mode.xmas.noel.y,0,tablerandom({-13,-10,-5,5,10,13}))
					gen[2] = os.time() + mode.xmas.gifts[gift][2]
					gen[3] = tfm.exec.addImage(mode.xmas.gifts[gift][1]..".png","#"..gen[1],-15,-15)
					gen[4] = gift
					tableinsert(mode.xmas.currentGifts,gen)
				end
			else
				mode.xmas.noel.escape(0)
			end
		end,
		dizzy = function(timer)
			if os.time() > mode.xmas.noel.timers.prize then
				mode.xmas.noel.isDizzy[1] = os.time() + 9500
			else
				mode.xmas.noel.escape(2)
			end
		end,
	},
	-- Reset
	resetNoel = function()
		mode.xmas.initx = 240
		mode.xmas.inity = 140
		mode.xmas.noel.x = mode.xmas.initx
		mode.xmas.noel.y = mode.xmas.inity
		mode.xmas.noel.id = -1
		mode.xmas.noel.isEscaping = false
		mode.xmas.noel.isDizzy = {0,false}
		mode.xmas.noel.timers = {
			teleport = 0,
			prize = 0
		}
	end,
	--[[ Display ]]--
	-- Bar
	displayBar = function(id,player,value,nvalue,color,sig,size,height)
		sig = sig or ""
		size = size or 100
		height = height or 20

		ui.addTextArea(id,"",player,5,(height+8) * id,size + 4,height,0xC7CED2,1,1,true)
		if value ~= 0 then
			ui.addTextArea(id.."0","",player,6,(height+8) * id + 2,nvalue + 2,height - 4,color,color,1,true)
		end
		ui.addTextArea(id + 2,"<B><font color='#0'>"..value..sig,player,(size-30)/2,(height+8) * id + 1,50,height,1,1,0,true)
	end,
	-- UpdateBar
	updateBar = function(n,giftColor)
		giftColor = giftColor or mode.xmas.info[n].lastColor
		mode.xmas.displayBar(1,n,mathfloor(mode.xmas.info[n].db.eventNoelGifts[2]) .. " / "..mode.xmas.aim,(mode.xmas.info[n].db.eventNoelGifts[2] > mode.xmas.aim and 100 or mathpercent(mode.xmas.info[n].db.eventNoelGifts[2],mode.xmas.aim,100)),0xFF0000)
		mode.xmas.displayBar(2,n,mode.xmas.info[n].db.eventNoelGifts[1],(mode.xmas.info[n].db.eventNoelGifts[1] > 50 and 50 or mathpercent(mode.xmas.info[n].db.eventNoelGifts[1],50,50)),giftColor,"G",50,20)
	end,
	--[[ Init ]]--
	init = function()
		for i,f in next,{"AutoShaman","AfkDeath","MortCommand","AutoTimeLeft","PhysicalConsumables","AutoNewGame","DebugCommand"} do
			tfm.exec["disable"..f]()
		end
		tfm.exec.setRoomMaxPlayers(25)
		tfm.exec.newGame(mode.xmas.xml)
		mode.xmas.aim = system.miscAttrib > 0 and system.miscAttrib or 8
	end,
	--[[ Events ]]--
	-- NewGame
	eventNewGame = function()
		mode.xmas.resetNoel()

		mode.xmas.start = true
		
		local _,aP = system.players()
		mode.xmas.amountPlayers = aP
		
		tfm.exec.setGameTime(150)
		tfm.exec.snow(150)
		mode.xmas.currentTime = 0
		mode.xmas.leftTime = 150
		
		tfm.exec.addImage("158c1feaf90.png","?0",0,0)
		
		ui.setMapName("<J>"..tablerandom({"Nöel","Christmas","Bolodefchoco","Lua event","#xmas","Bogkitty"}).." <G>- @"..tablerandom({666,404,801,os.date("%Y"),0,1}))
		ui.setShamanName("<R>S4NT4 M4U5")
		
		for k,v in next,tfm.get.room.playerList do
			mode.xmas.setPlayerTools(k)
		end
		tfm.exec.chatMessage(stringformat("<V><B>[^_^]</B></V> <BV>%s</BV>\n<V><B>[S4NT4 M4U5]</B></V> <R>%s</R>",system.getTranslation()[2],stringupper(system.getTranslation()[1])))
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		tfm.exec.addImage("158c1feaf90.png","?0",0,0,n)
		mode.xmas.setPlayerTools(n)
		tfm.exec.respawnPlayer(n)
	end,
	-- Loop
	eventLoop = function()
		mode.xmas.currentTime = mode.xmas.currentTime + .5
		mode.xmas.leftTime = mode.xmas.leftTime - .5
		if mode.xmas.start then
			if mode.xmas.currentTime > 4 then
				if mode.xmas.noel.id == -1 then
					mode.xmas.noel.id = tfm.exec.addShamanObject(6300,mode.xmas.noel.x,mode.xmas.noel.y)
					mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
				end

				local ox,oy
				if tfm.get.room.objectList[mode.xmas.noel.id] then
					ox,oy = tfm.get.room.objectList[mode.xmas.noel.id].x,tfm.get.room.objectList[mode.xmas.noel.id].y
				else
					ox,oy = mode.xmas.noel.x,mode.xmas.noel.y
				end

				if (ox < -10 or ox > 810) or (oy > 400 or oy < -50) then
					tfm.exec.removeObject(mode.xmas.noel.id)
					mode.xmas.noel.x,mode.xmas.noel.y = mode.xmas.initx,mode.xmas.inity
					mode.xmas.noel.id = nil
				end

				if mode.xmas.noel.id then
					mode.xmas.noel.x = ox
					mode.xmas.noel.y = oy
				end

				for k,v in ipairs(mode.xmas.despawnObjects) do
					if os.time() > v[2] then
						tfm.exec.removeObject(v[1])
					end
				end
				for k,v in ipairs(mode.xmas.currentGifts) do
					if os.time() > v[2] then
						tfm.exec.removeObject(v[1])
						tfm.exec.removeImage(v[3])
					end
				end

				if os.time() > mode.xmas.noel.isDizzy[1] and mode.xmas.currentTime > 5 then
					mode.xmas.noel.particles(13)
					if mode.xmas.currentTime % 60 == 0 then
						mode.xmas.noel.dizzy()
					elseif mode.xmas.currentTime % 5 == 0 then
						mode.xmas.noel.gift()
						mode.xmas.noel.escape(1)
					elseif mathfloor(mode.xmas.currentTime) % 2 == 0 then
						local option = mathrandom((mode.xmas.noel.isEscaping and 15 or 12))
						if option > 3 then
							mode.xmas.noel.escape()
						else
							mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
							if mode.xmas.currentTime > 7 and mathrandom(1,2) == 1 then
								if option == 3 then
									mode.xmas.noel.cannon()
								elseif option == 2 then
									mode.xmas.noel.teleport()
								elseif option == 1 then
									mode.xmas.noel.meep()
								end
							end
						end
					else
						mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
					end
				else
					mode.xmas.noel.particles(1)
					if not mode.xmas.noel.isDizzy[2] then
						mode.xmas.noel.isDizzy[2] = true
						mode.xmas.noel.timers.prize = os.time() + 5000
						local imgId = #mode.xmas.noel.img.dizzy
						local animation = {}
						local numb = 1
						animation = system.looping(function()
							mode.xmas.noel.updateImage(mode.xmas.noel.img.dizzy[imgId])

							if imgId == #mode.xmas.noel.img.dizzy or imgId == 1 then
								numb = -numb
							end

							imgId = imgId + numb

							if (os.time()+250) > mode.xmas.noel.isDizzy[1] then
								for k,v in next,animation do
									system.removeTimer(v)
								end
								mode.xmas.noel.isDizzy = {0,false}
							end
						end,10)
					end
				end
			end
			if mode.xmas.leftTime < 2 then
				mode.xmas.start = false
				tfm.exec.newGame(mode.xmas.xml)
			end
		end
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if mode.xmas.start then
			if os.time() > mode.xmas.info[n].catch and k == 32 then
				if os.time() < mode.xmas.noel.isDizzy[1] then
					if mathpythag(x,y,mode.xmas.noel.x,mode.xmas.noel.y,32) then
						mode.xmas.info[n].db.eventNoelGifts[2] = (mode.xmas.info[n].db.eventNoelGifts[1]/10) + mode.xmas.info[n].db.eventNoelGifts[2]
						mode.xmas.info[n].db.eventNoelGifts[1] = 0

						mode.xmas.updateBar(n)
					end
				else
					for k,v in next,mode.xmas.currentGifts do
						local o = tfm.get.room.objectList[v[1]]
						if o and mathpythag(x,y,o.x,o.y,25) then
							if (mode.xmas.info[n].db.eventNoelGifts[1]+v[4]) <= 50 then
								tfm.exec.removeObject(v[1])
								tfm.exec.removeImage(v[3])

								mode.xmas.currentGifts[k][2] = 0
								mode.xmas.info[n].db.eventNoelGifts[1] = mode.xmas.info[n].db.eventNoelGifts[1] + v[4]

								mode.xmas.updateBar(n,({0xB73535,0x358CB7,0x35B765,0xB7B735,0xB73487})[v[4]])
								break
							end
						end
					end
				end
				mode.xmas.info[n].catch = os.time() + 1000
			end
		end
	end,
	-- PlayerDied
	eventPlayerDied = function(n)
		if mode.xmas.start then
			system.bindKeyboard(n,32,true,false)
		end
	end,
}

--[[ Godmode ]]--
mode.godmode = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to <B>#godmode</B>. Type !info to read the help message.\n\tReport any issue to Bolodefchoco.",

			-- Guide
			shaman = "Hello shaman! Try to build without nails! Good luck.",

			-- Info
			info = "Use your creativity and build WITHOUT nails in shaman maps! The more mice you save, the higher your score will be. Do not let the mice die.\nPress P or type !p [playername] to open a profile.",
			xp = "You've saved %s mice and %s died.",

			-- Warning
			nail = "You can use %s more nails. After that, you will die.",
			kill = "Try not to use nails in your buildings.",
			fail = "You failed!",
			
			-- Profile
			profile = "Title : <V>«%s»<N>\n\nRounds : %s\n<N>Shaman : %s <G>/ %s\n\n<N>Deaths : %s",
			
			-- Titles
			titles = {
				"Shammy",
				"Experienced Shaman",
				"Evil Shaman",
				"Angry Shaman",
				"Spirit",
				"Haunted Shaman",
				"Troll Shaman",
				"Scientist",
				"Physics Master",
				"Black Magic",
			},
			unlock = "%s just unlocked «%s»",
		},
		br = {
			welcome = "Bem-vindo ao <B>#godmode</B>. Digite !info para ler a mensagem de ajuda.\n\tReporte qualquer problema para Bolodefchoco.",

			shaman = "Olá shaman! Tente construir sem pregos! Boa sorte.",

			info = "Utilize sua criatividade e construa em mapas shaman SEM pregos! Quanto mais ratos você salvar, maior será sua pontuação. Não deixe nenhum rato morrer.\nPressione P ou digite !p [nome] para abrir um perfil.",
			xp = "Você salvou %s ratos e %s morreram.",

			nail = "Você pode usar mais %s pregos. Depois disso, você morrerá.",
			kill = "Tente não usar pregos em suas construções.",
			fail = "Você falhou!",

			profile = "Título : <V>«%s»<N>\n\nPartidas : %s\n<N>Shaman : %s <G>/ %s\n\n<N>Mortes : %s",
			
			titles = {
				"Pequeno Shaman",
				"Shaman Profissional",
				"Shaman Mau",
				"Shaman Bravo",
				"Espírito",
				"Shaman Assombado",
				"Shaman Troll",
				"Cientista",
				"Mestre da Física",
				"Magia Negra",
			},
			unlock = "%s acabou de desbloquear «%s»",
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	--[[ Settings ]]--
	-- Shaman
	getShaman = function()
		local s = {}
		for k,v in next,tfm.get.room.playerList do
			if v.isShaman then
				s[#s + 1] = k
			end
		end

		return s
	end,
	-- New Game
	savedMice = 0,
	deadMice = 0,
	lastShaman = {},
	-- Titles
	title = nil,
	titles = {0,10,20,30,40,50,60,70,80,90},
	--[[ Display ]]--
	-- Profile
	profile = function(n,p)
		ui.addTextArea(0,"<p align='center'><B><R><a href='event:profile.close'>X",n,513,115,20,20,1,1,1,true)
		ui.addTextArea(1,"<p align='center'><font size='16'><B><V>"..p.."</V></B></font></p><p align='left'><font size='12'>\n<N>" .. stringformat(system.getTranslation().profile,mode.godmode.info[p].title,"<V>"..mode.godmode.info[p].roundSha,"<J>"..mode.godmode.info[p].cheeseMice,"<R>"..mode.godmode.info[p].deathMice,"<V>"..mode.godmode.info[p].deathSha),n,290,115,220,160,1,1,1,true)
	end,
	-- InfoMenu
	updateMenu = function()
		ui.setShamanName(tableconcat(mode.godmode.getShaman()," - <PS>") .. "   <G>|   <N>Status : <J>" .. mode.godmode.savedMice .. " <BL>/ <R>" ..  mode.godmode.deadMice)
	end,
	--[[ Init ]]--
	reset = function()
		-- Data
		mode.godmode.info = {}
	end,
	init = function()
		-- Titles
		mode.godmode.title = system.getTranslation().titles
		
		-- Init
		tfm.exec.disableAutoNewGame()
		tfm.exec.disableAllShamanSkills()
		tfm.exec.newGame("#4")
		
		-- Auto Admin
		system.roomAdmins.Mcqv = true
	end,
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		if not mode.godmode.info[n] then
			mode.godmode.info[n] = {
				usedNails = 0,
				roundSha = 0,
				deathSha = 0,
				deathMice = 0,
				cheeseMice = 0,
				title = "Shammy",
			}
		end

		for k,v in next,{66,67,74,78,80,86} do
			system.bindKeyboard(n,v,true,true)
		end

		tfm.exec.chatMessage("<ROSE>" .. system.getTranslation().welcome,n)
		
		ui.banner("15ca3f4a200",5,150,n,7)
	end,
	-- NewGame
	eventNewGame = function()
		if #mode.godmode.lastShaman > 0 then
			for k,v in next,mode.godmode.lastShaman do
				mode.godmode.info[v].cheeseMice = mode.godmode.info[v].cheeseMice + mode.godmode.savedMice
				mode.godmode.info[v].deathMice = mode.godmode.info[v].deathMice + mode.godmode.deadMice
				tfm.exec.chatMessage("<CH>" .. stringformat(system.getTranslation().xp,mode.godmode.savedMice,mode.godmode.deadMice),v)
				
				
				for i = #mode.godmode.titles,1,-1 do
					if mode.godmode.info[v].cheeseMice >= mode.godmode.titles[i] then
						if mode.godmode.info[v].title ~= mode.godmode.title[i] then
							mode.godmode.info[v].title = mode.godmode.title[i]
							tfm.exec.chatMessage("<J>" .. stringformat(system.getTranslation().unlock,v,mode.godmode.title[i]))
						end
						break	
					end
				end
			end
		end
		
		mode.godmode.savedMice = 0
		mode.godmode.deadMice = 0
		
		mode.godmode.updateMenu()

		for k,v in next,mode.godmode.info do
			v.usedNails = 0
		end
		for k,v in next,mode.godmode.getShaman() do
			mode.godmode.info[v].roundSha = mode.godmode.info[v].roundSha + 1
			tfm.exec.chatMessage("<CH>" .. system.getTranslation().shaman,v)
		end
		
		tfm.exec.setGameTime(183)
	end,
	-- Keyboard
	eventKeyboard = function(n,k)
		if k == 80 then
			mode.godmode.profile(n,n)
		elseif not tfm.get.room.playerList[n].isDead and tfm.get.room.playerList[n].isShaman then
			if tablefind({66,67,74,78,86},k) then -- B;C;V;N;J
				mode.godmode.info[n].usedNails = mode.godmode.info[n].usedNails + 1
				if mode.godmode.info[n].usedNails > 4 then
					tfm.exec.killPlayer(n)
					tfm.exec.chatMessage("<R>" .. system.getTranslation().fail .. " " .. system.getTranslation().kill,n)
				else
					tfm.exec.chatMessage("<R>" .. stringformat(system.getTranslation().nail,5 - mode.godmode.info[n].usedNails),n)
				end
			end
		end
	end,
	-- SummoningEnd
	eventSummoningEnd = function(n,o,x,y,a,i)
		tfm.exec.removeObject(i.id)
		
		tfm.exec.addShamanObject(o,x,y,a,i.vx,i.vy,i.ghost)
	end,
	-- Loop
	eventLoop = function()
		local alive,total = system.players()
		if _G.leftTime < 2 or (total > 1 and alive < 2) or alive == 0 then
			mode.godmode.lastShaman = mode.godmode.getShaman()
			tfm.exec.newGame("#4")
		end
	end,
	-- PlayerDied
	eventPlayerDied = function(n)
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.setGameTime(10,false)
			mode.godmode.info[n].deathSha = mode.godmode.info[n].deathSha + 1
			tfm.exec.chatMessage("<R>" .. system.getTranslation().fail,n)
		else
			mode.godmode.deadMice = mode.godmode.deadMice + 1
			mode.godmode.updateMenu()
		end
	end,
	-- PlayerWon
	eventPlayerWon = function(n)
		if not tfm.get.room.playerList[n].isShaman then
			mode.godmode.savedMice = mode.godmode.savedMice + 1
			mode.godmode.updateMenu()
		end
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+",stringlower)
		if p[1] == "info" then
			tfm.exec.chatMessage("<J>" .. system.getTranslation().info,n)
		elseif p[1] == "p" then
			if p[2] then
				p[2] = stringnick(p[2])
				if mode.godmode.info[p[2]] then
					mode.godmode.profile(n,p[2])
				end
			else
				mode.godmode.profile(n,n)
			end
		elseif p[1] == "np" and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 1)) then
			tfm.exec.newGame(p[2] or "#4")
		end
	end,
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		local p = stringsplit(c,"[^%.]+")
		if p[1] == "profile" then
			if p[2] == "close" then
				for i = 0,1 do
					ui.removeTextArea(i,n)
				end
			end
		end
	end,
}

--[[ Sharpie ]]--
mode.sharpie = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to #sharpie! Fly pressing space.",

			-- Warning
			nothacker = "The mice flying are NOT hackers!",

			-- Sample words
			won = "won",
			
			-- Messages
			first = {
				"yay 2 in a row",
				"super pro",
				"oml are you playing alone or what",
				"wooow 4 in a row!",
				"getting hard? good luck pro!",
				"you noob just unlocked the title lightning",
				"woah speedmaster",
				"formula 1",
				"time traveler you sir",
				"queen of the win",
				"as pro as the developer",
				"ILLUMINATI!",
				"are you a real hacker?",
				"I hope you dont loose the chance of seeing the last message",
				"THIS IS A SHIT MESSAGE BECAUSE YOU DIDNT DESERVE IT",
			},
			hardMode = "The hard mode is activated in this round!",
		},
		br = {
			welcome = "Bem-vindo ao #sharpie! Voe apertando espaço.",

			nothacker = "Os ratos voando NÃO são hackers!",

			won = "venceu",

			first = {
				"yay 2 seguidas",
				"super pro",
				"omg você tá jogando sozinho ou o que",
				"etaaa 4 seguidas!",
				"ficando difícil? boa sorte mito!",
				"vc noob acaba de desbloquear o título relâmpago",
				"vuash mestre da corrida",
				"relâmpago marquinhos",
				"viajante do tempo vc senhor",
				"rainha da vitória",
				"tão pro quanto o criador do jogo",
				"ILLUMINATI!",
				"éres um hacker de verdade?",
				"Espero que você não perca a chance de ler a última mensagem",
				"ESSA É UMA MENSAGEM DE MERDA PQ VC N MERECEU ISSO",
			},
			hardMode = "O modo difícil foi ativado nessa partida!",
		},
	},
	langue = "",
	--[[ Settings ]]--
	flyPower = -50,
	firstRow = {"",0}, -- Player, amount
	podium = 0,
	totalPlayers = 0,
	hardmode = false,
	modeImages = {"15cbdb3c427","15cbdb479ca","15cbdb4a1ca","15cbdb4cae5"},
	mapInfo = {800,400},
	--[[ UI ]]--
	uiborder = function(t,x,y)
		local colors = {
			{"#F7F918","#EC4848"},
			{"#4CE7F7","#2C9F5B"},
			{"#4BD9CD","#2A64E9"},
			{"#D4F31A","#8C8fA4"},
		}
		local color = tablerandom(colors)

		ui.addTextArea(0,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y-1,900,25,1,1,0,true)
		ui.addTextArea(1,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y+1,900,25,1,1,0,true)
		ui.addTextArea(2,"<font color='" .. color[2] .. "'><B>"..t,nil,x+1,y,900,25,1,1,0,true)
		ui.addTextArea(3,"<font color='" .. color[2] .. "'><B>"..t,nil,x-1,y,900,25,1,1,0,true)
		ui.addTextArea(4,"<font color='" .. color[1] .. "'><B>"..t,nil,x,y,900,25,1,1,0,true)
	end,
	--[[ Init ]]--
	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame"} do
			tfm.exec["disable"..f]()
		end
		
		tfm.exec.newGame()
	end,
	--[[ Events ]]--
	-- NewGame
	eventNewGame = function()
		mode.sharpie.podium = 0
		
		local currentXml = tfm.get.room.xmlMapInfo
		currentXml = currentXml and currentXml.xml or ""
		
		mode.sharpie.mapInfo = {800,400}
		mode.sharpie.flyPower = -50
		
		xml.attribFunc(currentXml or "",{
			[1] = {
				attribute = "G",
				func = function(value)
					value = stringsplit(value,"[^,]+")
					value = tonumber(value[2]) or 0
					mode.sharpie.flyPower = value < 0 and 50 or -50
				end
			},
			[2] = {
				attribute = "L",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[1] = value
					end
				end
			},
			[3] = {
				attribute = "H",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[2] = value
					end
				end
			},
			[4] = {
				attribute = "P",
				func = function()
					tableforeach(tfm.get.room.playerList,tfm.exec.killPlayer)
					tfm.exec.setGameTime(5,false)
				end
			},
		})
		
		mode.sharpie.hardmode = mathrandom(10) == 6
		if mode.sharpie.hardmode then
			tfm.exec.chatMessage("<CH>" .. system.getTranslation().hardMode)
		end
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		tfm.exec.chatMessage("<CE>" .. system.getTranslation().welcome,n)

		system.bindKeyboard(n,32,true,true)
		
		ui.banner("15d60d8e5b8",130,100,n)
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				tfm.exec.movePlayer(n,0,0,true,0,mode.sharpie.flyPower)
				tfm.exec.displayParticle(3,x,y)
			end
		end
	end,
	-- PlayerWon
	eventPlayerWon = function(n)
		mode.sharpie.podium = mode.sharpie.podium + 1
		if mode.sharpie.podium == 1 then
			if mode.sharpie.firstRow[1] == n then
				mode.sharpie.firstRow[2] = mode.sharpie.firstRow[2] + 1
				
				if mode.sharpie.totalPlayers > 3 then
					local msg = system.getTranslation().first
					tfm.exec.chatMessage("<G># <ROSE>" .. (msg[mode.sharpie.firstRow[2] - 1] or tablerandom({msg[2],msg[3],msg[6],msg[13],msg[15]})),n)
				end
			else
				mode.sharpie.firstRow = {n,1}
			end

			tfm.exec.setPlayerScore(n,(mode.sharpie.firstRow[2]+1) * 5,true)

			tfm.exec.chatMessage(stringformat("<J>%s %s! %s",n,system.getTranslation().won,mode.sharpie.firstRow[2] > 1 and "("..mode.sharpie.firstRow[2]..")" or ""))
		else
			tfm.exec.setPlayerScore(n,5,true)
		end
	end,
	-- Loop
	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			local alive,total = system.players()
			mode.sharpie.totalPlayers = total
			
			-- Warning
			mode.sharpie.uiborder(system.getTranslation().nothacker,10,382)
		end
		
		if _G.leftTime <= 1 or system.players() < 1 then
			tfm.exec.newGame()
		end

		if mode.sharpie.hardmode and _G.currentTime > 1 and _G.currentTime % 7 == 0 then
			system.newTimer(function()
				local x,y = mathrandom(0,mode.sharpie.mapInfo[1]),mathrandom(0,mode.sharpie.mapInfo[2])
				local id = tfm.exec.addImage(tablerandom(mode.sharpie.modeImages) .. ".png","&0",x - 56,y - 51) -- 112x103 img
				system.newTimer(function()
					tfm.exec.removeImage(id)

					tfm.exec.displayParticle(24,x,y)
					tfm.exec.explosion(x,y,50,100)
				end,1250,false)
			end,1000,false)
		end
	end,
}

--[[ Universe ]]--
mode.universe = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to <font color='#BD5DC5'><B>#Universe</B></font>. Build your own solar system or just enjoy the art.\n\tReport bugs to Bolodefchoco.",
			creator = "Now you are the creator of the universe! Press <B>O</B> and build it all!",
			
			-- Data
			objects = {
				star = {
					"Yellow Dwarf",
					"Red Dwarf",
					"Red Giant",
					"Blue Giant",
					"Supergiant",
					"White Dwarf",
					"Brown Dwarf",
				},
				planet = {
					"Chthonian",
					"Gas Dwarf",
					"Gas Giant",
					"Ice Giant",
					"Iron",
					"Sillicate",
					"Telluric",
					"Dwarf",
				},
				moon = {
					"Asteroid",
					"Irregular Asteroid",
				},
			},
			menu = {
				class = "Class",
				type = "Type",
				name = "Name",
				color = "Color",
				size = "Size",
				temperature = "Temperature",
				satellite = "Satellite of",
				velocity = "Velocity",
				distance = "Distance",
				rings = "Rings",
				gravity = "Gravity",
				mass = "Mass",
				flow = "Flow",
				luminosity = "Luminosity",
				magnitude = "Magnitude",
				rotation = "Rotation",
				translation = "Translation",
			},
			
			-- Interface
			buttons = {
				keyboard = {
					"submit",
					"backspace",
					"clear"
				},
				classes = {
					"Star",
					"Planet",
					"Moon"
				},
				main = {
					create = "Create",
					reset = "Reset",
					destroy = "Destroy",
					recreate = "Recreate",
				},
			},
			color = {
				previous = "Previous Color",
				next = "Next Color"
			},
			profile = {
				profiles = "profiles",
				exTime = "Existence Time",
				information = "Information",
				main = "Main",
				planets = "Planets",
				life = "Life",
				periods = "Periods",
				orbit = "Orbit",
				satellites = "Satellites",
			},
			exit = "Exit",
			choose = "Choose",
			yes = "Yes",
			no = "No",
			
			-- Warning
			newObject = {
				"New <B>%s star</B> created!",
				"New <B>%s planet</B> created!",
				"New <B>%s moon</B> orbiting %s!",
			},
			checkProfile = "Check its profile using the command <B>!profile %s</B>",
			fail = "The attributes %s are invalid!",
			nameExist = "There's already an object named \"%s\"!",
			destroyConfirm = "Are you sure you want to delete the %s \"%s\"?",
			cantDestroy = "You cannot destroy this object!",
			moonDestroyed = "All the moons of this planet were destroyed too!",
			systemDestroyed = "This Solar System was destroyed!",
			moonRecreated = "The moons of this planet were recreated!",
			planetRecreated = "The planet which the recreated moon orbits was also recreated (also the other moons, if exists)!",
			systemRecreated = "The System was recreated!",
			sysName = {
				choose = "Set below a name for the Solar System. (20- characters)",
				new = "This Solar System has been renamed to \"%s\"! \\o/",
			},
		},
		br = {
			welcome = "Bem-vindo ao <font color='#BD5DC5'><B>#Universe</B></font>. Construa seu próprio sistema solar or apenas aproveite a arte.\n\tReporte bugs a Bolodefchoco.",
			creator = "Agora você é o criador do universo! Pressione <B>O</B> e construa isso tudo!",
		
			objects = {
				star = {
					"Anã Amarela",
					"Anã Vermelha",
					"Gigante Vermelha",
					"Gigante Azul",
					"Super Gigante",
					"Anã Branca",
					"Anã Marrom",
				},
				planet = {
					"Ctoniano",
					"Anão Gasoso",
					"Gigante Gasoso",
					"Gigante Gelado",
					"Ferro",
					"Silicato",
					"Telúrico",
					"Anão",
				},
				moon = {
					"Asteróide",
					"Asteróide Irregular",
				},
			},
			menu = {
				class = "Classe",
				type = "Tipo",
				name = "Nome",
				color = "Cor",
				size = "Tamanho",
				temperature = "Temperatura",
				satellite = "Satélite de",
				velocity = "Velocidade",
				distance = "Distância",
				rings = "Anéis",
				gravity = "Gravidade",
				mass = "Massa",
				flow = "Fluxo",
				luminosity = "Luminosidade",
				magnitude = "Magnitude",
				rotation = "Rotação",
				translation = "Translação",
			},
		
			buttons = {
				keyboard = {
					"enviar",
					"apagar",
					"limpar"
				},
				classes = {
					"Estrela",
					"Planeta",
					"Lua"
				},
				main = {
					create = "Criar",
					reset = "Resetar",
					destroy = "Destruir",
					recreate = "Recriar",
				},
			},
			color = {
				previous = "Cor Anterior",
				next = "Próxima Cor"
			},
			profile = {
				profiles = "perfis",
				exTime = "Tempo de Existência",
				information = "Informação",
				main = "Principal",
				planets = "Planetas",
				life = "Vida",
				periods = "Período",
				orbit = "Órbita",
				satellites = "Satélites",
			},
			exit = "Sair",
			choose = "Escolher",
			yes = "Sim",
			no = "Não",
			
			newObject = {
				"Nova <B>%s estrela</B> criada!",
				"Novo <B>%s planeta</B> criado!",
				"Nova <B>%s lua</B> orbitando %s!",
			},
			checkProfile = "Cheque seu perfil usando o comando <B>!profile %s</B>",
			fail = "Os atributos %s são inválidos!",
			nameExist = "Já existe um objeto nomeado \"%s\"!",
			destroyConfirm = "Você tem certeza de que quer destruir a/o %s \"%s\"?",
			cantDestroy = "Você não pode destruir este objeto!",
			systemDestroyed = "Este Sistema Solar foi destruido!",
			moonRecreated = "As luas deste planeta foram recriadas!",
			planetRecreated = "O planeta do qual a lua recriada orbita também foi recriado (também as outras luas, se existirem)!",
			systemRecreated = "O Sistema foi recriado!",
			sysName = {
				choose = "Defina abaixo um nome para o Sistema Solar. (20- caracteres)",
				new = "Este Sistema Solar foi renomeado para \"%s\"! \\o/",
			},
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	cosmos = {}, -- Objects
	stuff = {},
	orbit = {0,0,0,0}, -- All Stars, All Planets, All Moons, All Objects
	--[[ Settings ]]--
	star = false, -- Exist main star
	tab = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;",
	systemName = "Solar System",
	images = {
		background = {"15db9f4a44f","15db9f50264","15db9f54ea6","15db9f59aad","15db9f5efb4","15db9f64e66","15db9f6a13a","15db9f6ef03","15db9f7421f","15db9f7aaa8","15db9f80f07","15db9f87630","15db9f8d13b","15db9f93278","15db9f98bca","15db9f9d34d","15db9fa1d2f","15db9fa7ad3","15db9fae62e","15db9fb676f","15db9fbbdd5","15db9fc1b41","15db9fc709d","15db9fcc98d","15db9fd2208","15db9fd7961","15db9fde6ff","15db9fe6bb8","15db9fec6fa","15db9ff2ba4","15db9ff8560","15db9ffe293","15dba00379e","15dba008b05","15dba00f91c","15dba015ac7","15dba01a707","15dba01f8b7","15dba024274","15dba029d5b","15dba02d979","15dba032a4f","15dba0385b5","15dba03e3fc","15dba0424ef","15dba048372","15dba04cb9a","15dba04fd20","15dba053be1","15dba058fb2","15dba05d5ce","15dba063b0e","15dba06a0c7","15dba070036","15dba074e9d","15dba0799df","15dba07e421","15dba083354","15dba087775","15dba08bbba","15dba0914fd","15dba096cb2","15dba09c513","15dba0a1d3e"},
		ufos = {"15dbf1c1b08","15dbf1c6f9d","15dbf1cb752","15dbf20a2c1","15dbf20e553"},
	},
	canInsertBackground = false,
	ufoId = -1,
	--[[ Informations ]]--
	data = { 
		objects = {
			star = {
				--[[
					Name;
					Color accuracy;
					Size range
				]]
				{"Yellow Dwarf", {color.Yellow}, "40:100"},
				{"Red Dwarf", {color.OrangeRed}, "40:100"},
				{"Red Giant", {color.OrangeRed}, "80:160"},
				{"Blue Giant", {color.CornflowerBlue}, "80:160"},
				{"Supergiant", {color.Yellow, color.OrangeRed, color.CornflowerBlue}, "80:160"},
				{"White Dwarf", {color.DarkGray}, "30:60"},
				{"Brown Dwarf", {color.Sienna}, "30:60"},
			},
			planet = {
				--[[
					Name;
					Color accuracy;
					Size range;
					Lifeable;
					Queue Limit (where positive = not > x ; negative = not < abs(x) and 0 is free)
				]]
				{"Chthonian", {color.Sienna, color.MediumTurquoise, color.DarkGoldenrod}, "15:35", false, 2},
				{"Gas Dwarf", {color.DarkGray, color.DarkGoldenrod, color.MediumTurquoise, color.IndianRed}, "20:30", false, -2},
				{"Gas Giant", {color.DarkGray, color.DarkGoldenrod, color.MediumTurquoise, color.IndianRed}, "25:60", false, -2},
				{"Ice Giant", {color.MediumBlue, color.MediumTurquoise, color.SteelBlue}, "20:45", false, -3},
				{"Iron", {color.DarkGray, color.DarkGoldenrod, color.RosyBrown}, "15:25", true, 0},
				{"Sillicate", {color.DarkGoldenrod, color.RosyBrown, color.OliveDrab, color.SteelBlue}, "20:30", true, 0},
				{"Telluric", {color.DarkGoldenrod, color.RosyBrown, color.OliveDrab, color.SteelBlue}, "15:35", true, 0},
				{"Dwarf", {color.DarkGray, color.DarkGoldenrod}, "5:12", true, -1},
			},
			moon = {
				--[[
					Name;
					Color accuracy;
					Size range
				]]
				{"Asteroid", {color.DarkGray}, "5:8"},
				{"Irregular Asteroid", {color.DarkGray, color.DarkGoldenrod}, "2:6"},
			},
		},
		classes = {
		
		},
		menu = {

		},
	}, 
	--[[ Meta ]]--
	meta = {
		add = {
			__add = function(listOne,listTwo) -- Link two tables in one
				local out = {}
				for k,v in next,{listOne,listTwo} do
					for i,j in next,v do
						out[(type(i) == "string" and i or #out+1)] = j
					end
				end
				
				return setmetatable(out,getmetatable(listOne))
			end
		},
	},
	--[[ System ]]--
	-- Keyboard
	keyboard = function()
		local k = ""
		local key = "<a href='event:keyboard.@.insert.%s'>%s</a> "
		for i = stringbyte("A"),stringbyte("Z") do -- Letters
			k = k .. stringformat(key,i,stringchar(i))
		end
		
		k = k .. "\n"
		
		for i = stringbyte("0"),stringbyte("9") do -- Numbers
			k = k .. stringformat(key,i,stringchar(i))
		end
		
		k = k .. "\n"
		
		for i,j in next,{stringbyte("-_",1,2)} do -- Characters
			k = k .. stringformat(key,j,stringchar(j))
		end
    
		return k
	end,
	-- Monochromatic
	paletteMonochromatic = function(hex,amount,period,reversed)
		local h, s, l = color.rgb_to_hsl(color.hex_to_rgb(hex))
		
		local colors = {}
		
		local final = 1
		if reversed then
			final = l - amount
			period = -period
		end
		
		for i = l,final,period do
			colors[#colors+1] = color.rgb_to_hex(color.hsl_to_rgb(h, s, i))
			
			amount = amount - 1
			if amount == 0 then
				break
			end
		end
		
		if reversed then
			tableremove(colors, 1)
		end
		
		return colors
	end,
	--[[ UI ]]--
	uinew = function(id,text,player,x,y,w,h,hasBg,color)
		w,h = w or 100,h or 100
		x,y = ((x or 400) - (w/2)),((y or 400) - (h/2))

		id = id>0 and id*5 or id
		if hasBg then
			ui.addTextArea(id,"",player,5,5,790,400,1,1,.5,true)
		end

		ui.addTextArea(id+1,"",player,x,y,w,h,0x0C191C,0x0C191C,1,true)
		ui.addTextArea(id+2,"",player,x+1,y+1,w-2,h-2,0x24474D,0x24474D,1,true)
		ui.addTextArea(id+3,"",player,x+2,y+2,w-4,h-4,0x183337,0x183337,1,true)
		ui.addTextArea(id+4,text,player,x+2,y+3,w-4,h-5,color or 0x122528,color or 0x122528,1,true)
	end,
	uiremove = function(id,player)
		id = id>0 and id*5 or id
		for i = id + 4,id,-1 do
			ui.removeTextArea(i,player)
		end
	end,
	--[[ UISplash ]]--
	-- closeSplash
	uicloseSplash = function(n,close)
		for i = 10,19 do
			mode.universe.uiremove(i,n)
		end
		
		if not close then
			mode.universe.uicreator(n)
		end
	end,
	-- counter
	uicounter = function(id,range,n,limit,increment)
		local min,max = stringmatch(range,"(%-?%d+):(%-?%d+)")
		min,max = tonumber(min),tonumber(max)
		
		if mode.universe.info[n].settings[id][1] == -mathhuge then
			mode.universe.info[n].settings[id][1] = mathceil((min+max)/2)
		else
			mode.universe.info[n].settings[id][1] = mathsetLim(mode.universe.info[n].settings[id][1],min,max)
		end
		
		limit = limit or 10
		increment = stringgsub(tostring(increment or 1),"%.","%%s")
		mode.universe.info[n].settings[id][2] = mathsetLim(mode.universe.info[n].settings[id][2],.1,limit)

		mode.universe.uinew(10,"<p align='center'><font size='20'><V><B>"..stringupper(id).."</B><font size='7'>\n\n<font size='12'><p align='left'><J><a href='event:counter."..id..".submit'>SUBMIT</a>"..stringrep(mode.universe.tab,3).."<PT><a href='event:counter."..id..".add."..increment.."'><B>+</B></a>  <J>" .. mode.universe.info[n].settings[id][2] .. "  <R><a href='event:counter."..id..".sub."..increment.."'><B>-</B></a>\n\n\n<p align='center'><font size='16'><S><a href='event:item."..id..".add'>▲</a>&nbsp;&nbsp;<PS>" ..  mode.universe.info[n].settings[id][1] .. "&nbsp;&nbsp;<S><a href='event:item."..id..".sub'>▼</a>",n,400,200,180,130,true)
	end,
	-- items
	uiitems = function(text,n,h)
		mode.universe.uinew(10,text,n,400,200,180,h or 180,true)
	end,
	-- keyboard
	uikeyboard = function(id,str,n)
		mode.universe.uinew(10,tablelist(system.getTranslation().buttons.keyboard,"\n",function(k,v)
			return stringformat("<%s><a href='event:keyboard.%s.%s'>%s</a>", k==1 and "J" or "R", id, system.getTranslation("en").buttons.keyboard[k], stringupper(v))
		end) .. "\n\n<p align='center'><PT>" .. stringgsub(mode.universe.keyboard,"@",id) .. "\n\n<font size='15'><T>" .. tableconcat(str),n,400,200,320,150,true)
	end,
	-- palette
	uipaletteMono = function(hex,n)
		mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] < 1 and #hex or mode.universe.info[n].settings.palette[1] > #hex and 1 or mode.universe.info[n].settings.palette[1]

		local darker = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,true)
		local lighter = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,false)

		local colors = setmetatable(darker,mode.universe.meta.add)
		colors = colors + lighter
		tablesort(colors)

		local div = mode.universe.tab .. "<BL>|<V>" .. mode.universe.tab
		mode.universe.uinew(10,stringformat("<font size='11'><V><a href='event:palette.left'>« %s</a>%s<a href='event:palette.right'>%s »</a>%s<a href='event:palette.exit'>%s</a>",system.getTranslation().color.previous,div,system.getTranslation().color.next,div,system.getTranslation().exit),n,400,200,450,80,true)
		for i = 1,#colors do
			local color = colors[i]
			mode.universe.uinew(i + 10,color and ("<font size='7'>\n<p align='center'><font size='13' color='#"..stringformat("%X",0xFFFFFF-color).."'><a href='event:item.color." .. color .. "'>■</a>"),n,150 + (50*i) or "",215,40,40,false,color)
		end
	end,
	--[[ UICreator ]]--
	-- clear
	uiclearCreator = function(n,range)
		for i = 1,#mode.universe.info[n].settings.create do
			if i > (range or 1) then
				mode.universe.info[n].settings.create[i] = nil
			end
		end
	end,
	-- creator
	uicreator = function(n)
		mode.universe.uinew(0,tablelist(mode.universe.info[n].settings.create,"\n<font size='4'>\n</font>",function(k,v)
			return stringformat(v[1],tostring(v[2](n)))
		end),n,400,200,540,300,true)
		
		mode.universe.uinew(1,"<p align='center'><VI><a href='event:main.create'>" .. system.getTranslation().buttons.main.create .. "</a>",n,180,338,100,24,false)
		mode.universe.uinew(2,"<p align='center'><VI><a href='event:main.recreate'>" .. system.getTranslation().buttons.main.recreate .. "</a>",n,290,338,100,24,false)
		mode.universe.uinew(3,"<p align='center'><R><a href='event:main.destroy'>" .. system.getTranslation().buttons.main.destroy .. "</a>",n,400,338,100,24,false)
		mode.universe.uinew(4,"<p align='center'><BV><a href='event:main.reset'>" .. system.getTranslation().buttons.main.reset .. "</a>",n,510,338,100,24,false)
		mode.universe.uinew(5,"<p align='center'><VP><a href='event:main.exit'>" .. system.getTranslation().exit .. "</a>",n,620,338,100,24,false)
		mode.universe.info[n].creatorOpen = true
	end,
	-- reset
	uiresetCreator = function(n)
		mode.universe.info[n].settings.palette = {1,{},1}
		mode.universe.info[n].settings.size = {-mathhuge,5}
		mode.universe.info[n].settings.temperature = {-mathhuge,5,true}
		mode.universe.info[n].settings.velocity = {-mathhuge,1,true}
		mode.universe.info[n].settings.distance = {-mathhuge,5,true}
		mode.universe.info[n].settings.rings = false
		mode.universe.info[n].settings.satellite = 0
	end,
	--[[ MenuUpdate ]]--
	infoBar =  function()
		local out = {
			{"<font color='#CF50DB'>%s",mode.universe.systemName},
			{system.getTranslation().buttons.classes[1] .. " : <V>%s",mode.universe.orbit[1]},
			{system.getTranslation().buttons.classes[2] .. " : <V>%s",mode.universe.orbit[2]},
			{system.getTranslation().buttons.classes[3] .. " : <V>%s",mode.universe.orbit[3]},
			{system.getTranslation().profile.exTime .. " : <V>%s",(_G.currentTime / 25)},
		}
		
		return tablelist(out,"   <G>|   <N>",function(k,v)
			return stringformat(v[1],v[2])
		end) .. "<"
	end,
	--[[ Background ]]--
	insertion = function(n)
		local y = 0
		for i = 0,63 do
			if i > 0 and i % 8 == 0 then
				y = y + 1000
			end
			tfm.exec.addImage(mode.universe.images.background[i + 1] .. ".png","?" .. i,(i%8) * 1000,y,n)

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
	--[[ Profile ]]--
	profile = {
		uiprofile = function(n)
			mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(system.getTranslation().profile.profiles) .. "</B><font size='12'>\n<a href='event:profile.exit'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. tablelist(mode.universe.cosmos,"\n",function(k,v)
				return stringformat("%s <a href='event:profile.open.%s.%s'>%s</a>",(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),v.className,k,v.name)
			end),n,300)
		end,
		uiremoveprofile = function(n)
			for i = 1,41 do
				ui.removeTextArea(-i,n)
			end
		end,
		profileStar = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
		
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = stringupper(stringformat("%x",obj.color))
			
			--tfm.exec.addImage("15d509ca726.png","?0",-110,-120,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V>" .. (obj.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "") .. " <B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,195,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,222,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,196,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,223,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,305,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,332,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.exTime,n,181,306,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.time / 1e7,n,171,333,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-20,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-21,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-22,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().profile.main .. " : <V>" .. system.getTranslation()[obj.id == mode.universe.cosmos[1].id and "yes" or "no"],n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-25,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-26,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-27,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.flow .. " : <V>" .. obj.flow,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.luminosity .. " : <V>" .. obj.luminosity,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-29,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.magnitude .. " : <V>" .. obj.magnitude,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-30,"",n,550,46,102,20,0x242f42,0x242f42,1,true)
			ui.addTextArea(-31,"",n,540,72,122,288,0x242f42,0x242f42,1,true)

			ui.addTextArea(-32,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.planets,n,551,47,100,20,0x0f242e,0x0f242e,1,true)
			ui.addTextArea(-33,"<p align='center'><V>" .. tablelist(mode.universe.cosmos,"",function(k,v)
				return v.class == 2 and stringformat("<a href='event:profile.open.Planet.%s'>%s</a>\n\n",k,v.name) or ""
			end),n,541,73,120,290,0x0f242e,0x0f242e,1,true)
		end,
		profilePlanet = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = stringupper(stringformat("%x",obj.color))
			
			--tfm.exec.addImage("15d509cc1ab.png","?0",-20,30,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,180,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,170,127,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.life,n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.rings,n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V>" .. system.getTranslation()[obj.rings and "yes" or "no"],n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.velocity .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.periods,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.rotation .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.translation .. " : <V>" .. obj.period.translation / 1e10,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-34,"",n,550,41,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-35,"",n,540,67,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-36,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.orbit,n,551,42,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-37,"<p align='center'><V>#" .. obj.planetPosition,n,541,68,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-38,"",n,550,116,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-39,"",n,540,142,122,214,0x242F42,0x242F42,1,true)

			ui.addTextArea(-40,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.satellites,n,551,117,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-41,"<p align='center'><V>" .. tablelist(obj.moons,"",function(k,v)
				return stringformat("<a href='event:profile.open.Moon.%s'>%s</a>\n\n",mode.universe.cosmos[v].position,mode.universe.cosmos[v].name)
			end),n,541,143,120,216,0x0F242E,0x0F242E,1,true)
		end,
		profileMoon = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = stringupper(stringformat("%x",obj.color))
			
			--tfm.exec.addImage("15d41dcea87.png","?0",380,90,n)
			
			ui.addTextArea(-1,"",n,150,40,350,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.life,n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.satellite,n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V><a href='event:profile.open.Planet." .. obj.satelliteOf .. "'>" .. mode.universe.cosmos[obj.satelliteOf].name,n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.velocity .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.periods,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.rotation .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.translation .. " : <V>" .. obj.period.translation,n,351,342,120,20,0x0F242E,0x0F242E,1,true)
		end,
	},
	--[[ Get ]]--
	-- getID
	getID = coroutine.wrap(function(class)
		local id,i = 0
		while true do
			i = ({2,4,3})[class]
			class = coroutine.yield(id)
			id = id + i
		end
	end),
	-- getDistance
	getDistance = function(class,data,size)
		if class == 2 then
			local id = data
			if mode.universe.orbit[2] > 0 then
				local current
				repeat
					id = id - 1
					current = mode.universe.cosmos[id]
				until current.class == 2
				
				return current.distance + (#current.moons * 3.1) + size
			else
				return size / 3
			end
		else -- Moon
			return mode.universe.cosmos[data].distance + mode.universe.cosmos[data].size/2 + #mode.universe.cosmos[data].moons * 2.3
		end
	end,
	-- getFlow
	getFlow = function(luminosity,size)
		-- L / 4πr²
		-- luminosity / 4 * 3.14 * (size/2)^2
		return (luminosity / (4 * 3.14 * (size/2)^2))^.25
	end,
	-- getGravity
	getGravity = function(class,orbit)
		-- G * M / r²
		-- 6.67e-11 * mass / (size/2)^2
		
		if class == 1 then
			return 6.67e-11 * ((orbit * .49) * 1.3e6)
		elseif class == 2 then
			-- g will be (orbit * 0.49), since the distance Star-Earth(1) = 20 and 20/9.8 (its gravity) = 0.49
			return (orbit * .49)
		elseif class == 3 then
			return (orbit * .15)
		end
	end,
	-- getLifePossibility
	getLifePossibility = function(this)
		local possibility = 0
		
		if this.class == 2 then
			if not mode.universe.data.objects[stringlower(this.className)][this.type][4] then
				return 0
			else
				possibility = possibility + 10
				
				if #this.moons > 0 then
					possibility = possibility + 10
				end
				
				if this.velocity > 0.7 and this.velocity < 2.4 then
					possibility = possibility + 10
				end
			end
		elseif this.class == 3 then
			if mode.universe.cosmos[this.satelliteOf].life >= 40 then
				possibility = possibility + 5
			end

			if stringfind(stringlower(mode.universe.cosmos[this.satelliteOf].typeName),"gas") then
				possibility = possibility + 10
			end
			
			if this.velocity == 2.5 then
				possibility = possibility + 10
			end
		end
		
		local dist = this.distance
		local starSize = mode.universe.cosmos[1].size / 100
		
		if dist > (10 * starSize) then
			if dist > (50 * starSize) then
				if dist > (100 * starSize) then
					if dist > (200 * starSize) then
						if dist > (350 * starSize) then
							possibility = possibility + 10
						end
					else
						possibility = possibility + 45
					end
				else
					possibility = possibility + 60
				end
			else
				possibility = possibility + 5
			end
		end
	
		return possibility
	end,
	-- getLuminosity
	getLuminosity = function(size,temperature)
		-- 4πR^2sT^4
		-- 4 * 3.14 * size^2 * 5.67e-8 * temperature^4

		return 4 * 3.14 * size^2 * 5.67e-8 * temperature^4
	end,
	-- getMagnitude
	getMagnitude = function(flow)
		local this = mode.universe.cosmos[id]
		-- –2.5 log(F1 / F2)
		-- -2.5 log(flow / -1.6)

		-- F2 will be –1.6 from Sirius, but it should be 0.00, from Vega
		return -2.5 * mathlog(flow / -1.6)
	end,
	-- getMass
	getMass = function(gravity,size)
		-- g * r² / G
		-- gravity * (size/2)^2 / 6.67e-11

		-- Size is improved
		size = size * 5
		return (gravity * (size/2)^2) / 6.67e-11
	end,
	-- getRotation
	getRotation = function(velocity)
		-- velocity * 365 * 24
		return velocity * 365 * 24
	end,
	-- getTemperature
	getTemperature = function(class,orbit)
		-- Unknown Algorithm Method
		if class == 1 then
			return mathrandom(1e3,1e4)
		else
			return mathlog(orbit,mode.universe.cosmos[1].luminosity)
		end
	end,
	-- getTranslation
	getTranslation = function(mass,size)
		-- (4 * π^2 / G * M) * r^3 
		-- (4 * 9.85 / 6.67e-11 * mass) * (size/2)^3
		
		return ((4 * 9.85 / 6.67e-11 * mass) * ((size/2)^3))^.5
	end,
	-- getVelocity
	getVelocity = function(mass,size,orbit)
		-- sqrt (G * M) / R
		-- sqrt (6.67e-11 * mass) / R

		-- R will be (objectRadius * orbitRadius)
		return (((6.67e-11 * mass) / ((size/2) * (orbit/2)))^.5)^.25
	end,
	--[[ Objects ]]--
	object = {
		new = function(self,info)
			mode.universe.orbit[4] = mode.universe.orbit[4] + 1
		
			local data = {
				position = mode.universe.orbit[4],
				
				name = #info.name>0 and info.name or "?",
				
				class = info.class,
				type = info.type,
				
				size = info.size,
				color = info.color,
				
				display = false,
			}
			
			data.className = system.getTranslation("en").buttons.classes[data.class] or "?"
			data.typeName = mode.universe.data.objects[stringlower(data.className)][data.type][1] or "?"

			data.gravity = mode.universe.getGravity(data.class,data.position)
			data.mass = mode.universe.getMass(data.gravity,data.size)
			data.temperature = (info.temperature == "auto" and mode.universe.getTemperature(data.class,data.position) or info.temperature)
			
			data.id = mode.universe.getID(data.class)
			
			if data.class == 1 then -- Star
				data.luminosity = mode.universe.getLuminosity(data.size,data.temperature)
				data.flow = mode.universe.getFlow(data.luminosity,data.size)
				data.magnitude = mode.universe.getMagnitude(data.flow)
				
				data.time = os.time()
				
				if not mode.universe.star then
					mode.universe.star = true
				end
				
				mode.universe.orbit[1] = mode.universe.orbit[1] + 1
			else
				if data.class == 2 then -- Planet
					data.moons = {}
					data.rings = info.rings
					data.orbit = mode.universe.orbit[2] + 1
					data.distance = (info.distance == "auto" and mathceil(mode.universe.getDistance(data.class,data.position,data.size)) or mathceil(info.distance))
					data.velocity = (info.velocity == "auto" and mode.universe.getVelocity(data.mass,data.size,data.orbit) or (info.velocity == 0 and .5 or info.velocity))
				elseif data.class == 3 then -- Moon
					data.satelliteOf = info.satelliteOf
					data.distance = mathceil(mode.universe.getDistance(data.class,data.satelliteOf))
					data.velocity = 7 * tablerandom({.5,.3,.2,.1})
					
					mode.universe.cosmos[data.satelliteOf].moons[#mode.universe.cosmos[data.satelliteOf].moons + 1] = data.position
				end
				
				data.life = mode.universe.getLifePossibility(data)
				
				data.period = {
					rotation = mode.universe.getRotation(data.velocity),
					translation = mode.universe.getTranslation(data.mass,data.size)
				}
				
				if data.class == 2 then
					mode.universe.orbit[2] = mode.universe.orbit[2] + 1
					data.planetPosition = mode.universe.orbit[2]
				elseif data.class == 3 then
					mode.universe.orbit[3] = mode.universe.orbit[3] + 1
				end
			end

			mode.universe.cosmos[data.position] = data
			mode.universe.stuff[data.name] = true

			self.__index = self
			return setmetatable(data,self)			
		end,
		destroy = function(self)
			if self.class > 1 then
				if self.class == 2 then -- Planet
					if #self.moons > 0 then
						for k,v in next,self.moons do
							mode.universe.cosmos[v]:destroy()
						end
					end
					
					if self.rings then
						tfm.exec.removeJoint(self.id + 3)
					end
				end
				
				-- Below: Planet and Moon
				tfm.exec.removeJoint(self.id + 2) -- Object's JR
			end

			tfm.exec.removeJoint(self.id + 1) -- Object's JD
			tfm.exec.removePhysicObject(self.id) -- Object
			
			self.display = false
		end,
		create = function(self)
			local x = 4e3
			local y = x - (mode.universe.star and (mode.universe.cosmos[1].id == self.id and 0 or (mode.universe.cosmos[1].size + (self.distance * 4))) or 0)
			
			local center = mode.universe.cosmos[1].id
			if self.class == 3 then -- Resets the satellite
				center = mode.universe.cosmos[self.satelliteOf].id
			end
			
			tfm.exec.addPhysicObject(self.id,x,y,{ -- Object
				type = 14, -- Used to be 13
				color = 1,
				width = 1,
				groundCollision = false,
				miceCollision = false,
				mass = 1,
				dynamic = (self.class ~= 1),
			})
			
			tfm.exec.addJoint(self.id + 1,self.id,self.id,{ -- JD (Color)
				type = 0,
				point1 = stringformat("%s,%s",x,y),
				point2 = stringformat("%s,%s",x,y+1),
				line = self.size,
				color = self.color,
				alpha = 1,
				foreground = true,
			})
			
			if self.class ~= 1 then -- Rotation
				tfm.exec.addJoint(self.id + 2,center,self.id,{
					type = 3,
					forceMotor = self.class == 3 and 10 or 9999,
					speedMotor = self.velocity
				})
			end
			
			if self.rings then
				tfm.exec.addJoint(self.id + 3,self.id,self.id,{
					type = 0,
					point1 = stringformat("%s,%s",x - self.size,y + mathfloor(self.rings.inclination * 1.5)),
					point2 = stringformat("%s,%s",x + self.size,y - mathfloor(self.rings.inclination * 1.5)),
					line = self.rings.volume,
					color = self.color,
					alpha = .7,
					foreground = 1
				})
			end
			if self.moons then
				for k,v in next,self.moons do
					mode.universe.object.create(mode.universe.cosmos[v])
				end
			end
			
			self.display = true
		end,
	},
	--[[ Others ]]--
	-- getData
	getDataMenus = function()
		mode.universe.data.menu = {
			class = {
				"<N2>" .. system.getTranslation().menu.class .. " : <V><a href='event:newObject.class'>%s</a>",function(n)
					if mode.universe.info[n].settings.class > 0 then
						return mode.universe.data.classes[mode.universe.info[n].settings.class]
					else
						return system.getTranslation().choose
					end
				end
			},
			type = {
				"<N2>" .. system.getTranslation().menu.type .. " : <V><a href='event:newObject.type'>%s</a>",function(n)
					if mode.universe.info[n].settings.type > 0 then
						return mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][1]
					else
						return system.getTranslation().choose
					end
				end
			},
			name = {
				"<N2>" .. system.getTranslation().menu.name .. " : <V><a href='event:newObject.name'>%s</a>",function(n)
					if #mode.universe.info[n].settings.name > 0 then
						return tableconcat(mode.universe.info[n].settings.name)
					else
						return system.getTranslation().choose
					end
				end
			},
			color = {
				"<N2>" .. system.getTranslation().menu.color .. " : <V><a href='event:newObject.color'>%s</a>",function(n)
					if mode.universe.info[n].settings.palette[3] ~= 1 then
						local color = stringformat("%X",mode.universe.info[n].settings.palette[3])
						return stringformat("<font color='#%s'>#%s</font>",color,color)
					else
						return system.getTranslation().choose
					end
				end
			},
			size = {
				"<N2>" .. system.getTranslation().menu.size .. " : <V><a href='event:newObject.size'>%s</a>",function(n)
					if mode.universe.info[n].settings.size[1] > -mathhuge then
						return mode.universe.info[n].settings.size[1]
					else
						return system.getTranslation().choose
					end
				end
			},
			temperature = {
				"<N2>" .. system.getTranslation().menu.temperature .. " : <V><a href='event:options.temperature'>%s</a>",function(n)
					if mode.universe.info[n].settings.temperature[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.temperature[1] .. " °C"
					end
				end
			},
			satellite = {
				"<N2>" .. system.getTranslation().menu.satellite .. " : <V><a href='event:newObject.moon'>%s</a>",function(n)
					if mode.universe.info[n].settings.satellite > 0 and mode.universe.cosmos[mode.universe.info[n].settings.satellite].name then
						return mode.universe.cosmos[mode.universe.info[n].settings.satellite].name
					else
						return system.getTranslation().choose
					end
				end
			},
			velocity = {
				"<N2>" .. system.getTranslation().menu.velocity .. " : <V><a href='event:options.velocity'>%s</a>",function(n)
					if mode.universe.info[n].settings.velocity[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.velocity[1]
					end
				end
			},
			distance = {
				"<N2>" .. system.getTranslation().menu.distance .. " : <V><a href='event:options.distance'>%s</a>",function(n)
					if mode.universe.info[n].settings.distance[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.distance[1]
					end
				end
			},
			rings = {
				"<N2>" .. system.getTranslation().menu.rings .. " : <V><a href='event:alternate.rings'>%s</a>",function(n)
					return system.getTranslation()[mode.universe.info[n].settings.rings and "yes" or "no"]
				end
			}
		}
	end,
	-- newCreator
	newCreator = function(n)
		-- Data
		mode.universe.info[n] = {
			action = 0,
			creatorOpen = false,
			settings = {
				palette = {1,{},1}, -- Current Page, Color List, Selected Color
				-- For all bellow: [1]=Value,[2]=Counter,[[3] = isAutomatic]
				size = {-mathhuge,5},
				temperature = {-mathhuge,5,true},
				velocity = {-mathhuge,1,true},
				distance = {-mathhuge,5,true},
				-- Settings
				class = 0,
				type = 0,
				name = {},
				rings = false,
				satellite = 0,
				-- List
				create = setmetatable(
					{
						mode.universe.data.menu.class
					},
					mode.universe.meta.add
				),
			},
		}
		
		-- Controls
		system.bindKeyboard(n,stringbyte("O"),true,true)
		
		-- Message
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation().creator,n)
	end,
	--[[ Init ]]--
	reset = function()
		for i = #mode.universe.cosmos,1,-1 do
			mode.universe.cosmos[i]:destroy()
		end
		
		mode.universe.cosmos = {}
		mode.universe.orbit = {0,0,0,0}
		
		tableforeach(system.roomAdmins,mode.universe.newCreator)
	end,
	init = function()
		-- Keyboard
		if type(mode.universe.keyboard) == "function" then
			mode.universe.keyboard = mode.universe.keyboard()
		end
		
		-- Translations
		-- Set object translated names
		if mode.universe.langue ~= "en" then
			for k,v in next,mode.universe.data.objects do
				for i,j in next,v do
					j[1] = system.getTranslation().objects[k][i]
				end
			end
		end
		-- Set class translations
		mode.universe.data.classes = system.getTranslation().buttons.classes
		
		-- Menus
		mode.universe.getDataMenus()
		
		-- Loops
		system.newTimer(function()
			ui.setMapName(mode.universe.infoBar())
		end,1000,true)
		
		-- Settings
		tfm.exec.setRoomMaxPlayers(12)
		for _,f in next,{"AutoShaman","AutoNewGame","DebugCommand"} do
			tfm.exec["disable"..f]()
		end
		
		-- Map
		system.newTimer(function()
			tfm.exec.newGame('<C><P L="8000" G="0," H="8000" /><Z><S><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="-1000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="-1500" c="4" Y="2000" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="5000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="1500" c="4" Y="9500" T="12" P="0,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="4500" c="4" Y="9500" T="12" H="3000" /><S H="3000" L="3000" o="0" X="9500" c="4" Y="5000" T="12" P="1,,.3,.2,,,," /><S H="3000" L="3000" o="0" X="7500" c="4" Y="9500" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="9500" c="4" Y="2000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="9500" c="4" Y="-1000" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="8000" T="12" H="3000" /><S P="1,,.3,.2,,,," L="3000" o="0" X="1500" c="4" Y="-1500" T="12" H="3000" /><S H="3000" L="3000" o="0" X="4500" c="4" Y="-1500" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="6500" c="4" Y="-1500" T="12" H="3000" /><S P="1,,.3,.2,,,," L="3000" o="0" X="9500" c="4" Y="8000" T="12" H="3000" /></S><D><DS Y="4000" X="4000" /></D><O /></Z></C>')
		end,1000,false)
	end,
	--[[ Events ]]--
	-- NewPlayer
	eventNewPlayer = function(n)
		system.bindKeyboard(n,stringbyte("P"),true,true)
		system.bindKeyboard(n,46,true,true) -- Delete
		
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation().welcome,n)
		
		ui.banner("15db5b6ab36",210,120,n,10)
		
		if system.roomAdmins[n] and system.roomAttributes ~= 1 and system.roomNumber ~= 801 then
			mode.universe.newCreator(n)
		end
		
		tfm.exec.addImage("15db9e67479.png","&1",5,30,n)
		
		if mode.universe.canInsertBackground then
			tfm.exec.respawnPlayer(n)
			mode.universe.setBackground(n)
		end
	end,
	-- Keyboard
	eventKeyboard = function(n,k)
		if k == stringbyte("O") and system.roomAdmins[n] then
			if mode.universe.info[n].creatorOpen then
				mode.universe.eventTextAreaCallback(i,n,"main.exit")
			else
				mode.universe.uicreator(n)
			end
			return
		elseif k == stringbyte("P") then
			local allowed = true
			if mode.universe.info[n] and mode.universe.info[n].creatorOpen then
				allowed = false
			end
			if allowed then
				mode.universe.profile.uiprofile(n)
			end
			return
		elseif k == 46 then
			tfm.exec.respawnPlayer(n)
			return
		end
	end,
	-- TextAreaCallback
	eventTextAreaCallback = function(i,n,c)
		local p = stringsplit(c,"[^%.]+")
		-- Keyboard
		if p[1] == "keyboard" then
			if p[2] == "name" then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					if p[3] == "backspace" then
						tableremove(mode.universe.info[n].settings.name)
					elseif p[3] == "clear" then
						mode.universe.info[n].settings.name = {}
					elseif p[3] == "insert" then
						if #mode.universe.info[n].settings.name < 16 then
							mode.universe.info[n].settings.name[#mode.universe.info[n].settings.name + 1] = stringchar(p[4])
						end
					end
					mode.universe.uikeyboard(p[2],mode.universe.info[n].settings.name,n)
				end
			end
			return
		end
		-- Counter
		if p[1] == "counter" then
			if tablefind({"size","temperature","velocity","distance"},p[2]) then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					local increment = tonumber(stringformat(p[4],"."))
					if p[3] == "add" then
						mode.universe.info[n].settings[p[2]][2] = mode.universe.info[n].settings[p[2]][2] + increment
					elseif p[3] == "sub" then
						mode.universe.info[n].settings[p[2]][2] = mode.universe.info[n].settings[p[2]][2] - increment
					end
					mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
				end
			end
			return
		end
		-- Palette
		if p[1] == "palette" then
			if p[2] == "exit" then
				for i = 11,19 do
					mode.universe.uiremove(i,n)
				end
				mode.universe.info[n].settings.palette[1] = 1
				mode.universe.uicreator(n)
			else
				if p[2] == "left" then
					mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] - 1
				elseif p[2] == "right" then
					mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] + 1
				end
				mode.universe.eventTextAreaCallback(i,n,"newObject.color")
			end
			return
		end
		-- New Object
		if p[1] == "newObject" then
			-- Class
			if p[2] == "class" then
				mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. tablelist(mode.universe.data.classes,"\n",function(k,v)
					local out = true
					if k == 1 then
						out = not mode.universe.star
					end
					if k == 2 then
						out = mode.universe.star
					end
					if k == 3 then
						if mode.universe.orbit[2] == 0 then
							out = false
						end
					end
					return out and stringformat("%s<a href='event:item.class.%s'>%s</a>",mode.universe.tab,k,v) or stringformat("%s<N2>%s</N2>",mode.universe.tab,v)
				end),n)
				return
			end
			-- Type
			if p[2] == "type" then
				if mode.universe.info[n].settings.class > 0 then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. tablelist(mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])],"\n",function(k,v)
						local out = true
						if mode.universe.info[n].settings.class == 2 then
							local orbit = mode.universe.orbit[2] + 1
							if v[5] ~= 0 and not mathisNegative(v[5],orbit > mathabs(v[5]),orbit <= v[5]) then
								out = false
							end
						end
						return out and stringformat("%s<a href='event:item.type.%s'>%s</a>",mode.universe.tab,k,v[1]) or stringformat("%s<N2>%s</N2>",mode.universe.tab,v[1])
					end),n)
				end
				return
			end
			-- Name
			if p[2] == "name" then
				mode.universe.uikeyboard(p[2],mode.universe.info[n].settings.name,n)
				return
			end
			-- Size, Color, Temperature, Velocity, Distance, Moon, Respectively. [There must be a type]
			if mode.universe.info[n].settings.type > 0 then
				if p[2] == "size" then
					mode.universe.uicounter(p[2],mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][3],n)
				elseif p[2] == "color" then
					mode.universe.uipaletteMono(mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2],n)
				elseif p[2] == "temperature" then
					mode.universe.uicounter(p[2],"-200:8000",n,1000,200) -- Unknown, yet.
				elseif p[2] == "velocity" then
					mode.universe.uicounter(p[2],"-8:8",n,2,.1) -- Unknown, yet.
				elseif p[2] == "distance" then
					mode.universe.uicounter(p[2],"0:250",n,20) -- Unknown, yet.
				elseif p[2] == "moon" then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(system.getTranslation().menu.satellite) .. "</B><font size='12'><p align='left'>\n\n<S>" .. tablelist(mode.universe.cosmos,"\n",function(k,v)
						return v.class == 2 and stringformat("%s<a href='event:item.satellite.%s'>%s</a>",mode.universe.tab,k,v.name) or ""
					end),n)
				end
				return
			end
			return
		end
		-- Items
		if p[1] == "item" then
			-- Class
			if p[2] == "class" then
				mode.universe.info[n].settings.class = tonumber(p[3])
				mode.universe.info[n].settings.type = 0
				
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n)
				
				mode.universe.info[n].settings.create = mode.universe.info[n].settings.create + {mode.universe.data.menu.type,mode.universe.data.menu.name}
				
				mode.universe.uicloseSplash(n)
				return
			end
			-- Type
			if p[2] == "type" then
				mode.universe.info[n].settings.type = tonumber(p[3])
				
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n,3)
				
				mode.universe.info[n].settings.palette[2] = mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2]
				
				local implement = setmetatable({
					mode.universe.data.menu.color,
					mode.universe.data.menu.size,
					mode.universe.data.menu.temperature
				},mode.universe.meta.add)
				if mode.universe.info[n].settings.class == 2 then
					implement = implement + {mode.universe.data.menu.velocity,mode.universe.data.menu.distance,mode.universe.data.menu.rings}
				end
				if mode.universe.info[n].settings.class == 3 then
					implement = implement + {mode.universe.data.menu.satellite}
				end
				
				mode.universe.info[n].settings.create = mode.universe.info[n].settings.create + implement
				
				mode.universe.uicloseSplash(n)
				return
			end
			-- Size, Temperature, Velocity, Distance
			if tablefind({"size","temperature","velocity","distance"},p[2]) then
				if p[3] == "add" then
					mode.universe.info[n].settings[p[2]][1] = mode.universe.info[n].settings[p[2]][1] + mode.universe.info[n].settings[p[2]][2]
				elseif p[3] == "sub" then
					mode.universe.info[n].settings[p[2]][1] = mode.universe.info[n].settings[p[2]][1] - mode.universe.info[n].settings[p[2]][2]
				end
				mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
				return
			end
			-- Color
			if p[2] == "color" then
				mode.universe.info[n].settings.palette[3] = tonumber(p[3])
				mode.universe.eventTextAreaCallback(i,n,"palette.exit")
				
				return
			end
			-- Satellite
			if p[2] == "satellite" then
				mode.universe.info[n].settings.satellite = tonumber(p[3])
				mode.universe.uicloseSplash(n)
				return
			end
			return
		end
		-- Options
		if p[1] == "options" then
			if mode.universe.info[n].settings[p[2]][3] then
				mode.universe.info[n].settings[p[2]][3] = false
				mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
			else
				mode.universe.info[n].settings[p[2]][3] = true
				mode.universe.uicreator(n)
			end
			return
		end
		-- Alternate (Yes/No)
		if p[1] == "alternate" then
			if p[2] == "rings" then
				mode.universe.info[n].settings[p[2]] = not mode.universe.info[n].settings[p[2]]
				mode.universe.uicreator(n)
			end
			return
		end
		-- Close splash
		if p[1] == "closeSplash" then
			mode.universe.uicloseSplash(n)
		end
		-- Main
		if p[1] == "main" then
			-- Exit
			if p[2] == "exit" then
				mode.universe.uicloseSplash(n)
				for i = 0,9 do
					mode.universe.uiremove(i,n)
				end
				mode.universe.info[n].creatorOpen = false
				return
			end
			-- Reset
			if p[2] == "reset" then
				mode.universe.info[n].settings.class = 0
				mode.universe.info[n].settings.type = 0
				mode.universe.info[n].settings.name = {}
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n)
				if not p[3] then
					mode.universe.uicreator(n)
				end
				return
			end
			-- Create
			if p[2] == "create" then
				local fails = {}
				if mode.universe.info[n].settings.class <= 0 then
					fails[#fails + 1] = "class"
				end
				if #mode.universe.info[n].settings.name == 0 then
					fails[#fails + 1] = "name"
				end
				if mode.universe.info[n].settings.type <= 0 then
					fails[#fails + 1] = "type"
				end
				if mode.universe.info[n].settings.size[1] == -mathhuge then
					fails[#fails + 1] = "size"
				end
				if mode.universe.info[n].settings.palette[3] == 1 then
					fails[#fails + 1] = "color"
				end
				
				if mode.universe.info[n].settings.class == 3 then
					if mode.universe.info[n].settings.satellite == 0 then
						fails[#fails + 1] = "satellite"
					end
				end
				
				local create = #fails == 0
				
				local concatenedName = tableconcat(mode.universe.info[n].settings.name)
				
				if not create then
					tfm.exec.chatMessage("<R>" .. stringformat(system.getTranslation().fail,tablelist(fails,", ",function(k,v)
						return system.getTranslation().menu[v]
					end)),n)
				end
				
				if mode.universe.stuff[concatenedName] then
					create = false
					tfm.exec.chatMessage("<R>" .. stringformat(system.getTranslation().nameExist,concatenedName),n)
				end

				if create and (os.time() > mode.universe.info[n].action) then
					mode.universe.info[n].action = os.time() + 2500
				
					local this = mode.universe.object:new({
						name = concatenedName,
						class = mode.universe.info[n].settings.class,
						type = mode.universe.info[n].settings.type,
						size = mode.universe.info[n].settings.size[1],
						color = mode.universe.info[n].settings.palette[3],
						velocity = mode.universe.info[n].settings.velocity[3] and "auto" or mode.universe.info[n].settings.velocity[1],
						temperature = mode.universe.info[n].settings.temperature[3] and "auto" or mode.universe.info[n].settings.temperature[1],
						rings = mode.universe.info[n].settings.rings and {inclination = 6.5} or false,
						distance = mode.universe.info[n].settings.distance[3] and "auto" or mode.universe.info[n].settings.distance[1],
						satelliteOf = mode.universe.info[n].settings.satellite,			
					})

					if this.class == 3 then
						mode.universe.object.destroy(mode.universe.cosmos[this.satelliteOf])
						mode.universe.object.create(mode.universe.cosmos[this.satelliteOf])
					else
						this:create()
					end
					
					local type = mode.universe.data.objects[stringlower(system.getTranslation("en").buttons.classes[this.class])][this.type][1]
					tfm.exec.chatMessage("<S>" .. stringformat(system.getTranslation().newObject[this.class],type,(this.satelliteOf and mode.universe.cosmos[this.satelliteOf].name or "")) .. "\n\t" .. stringformat(system.getTranslation().checkProfile,this.name))

					mode.universe.eventTextAreaCallback(i,n,"main.reset.not")
					mode.universe.eventTextAreaCallback(i,n,"main.exit")
				end
				return
			end
			-- Destroy
			if p[2] == "destroy" then
				if p[3] then
					p[3] = tonumber(p[3])
					ui.addPopup(p[3],1,"<p align='center'><font color='#2ECF73'>" .. stringformat(system.getTranslation().destroyConfirm,mode.universe.cosmos[p[3]].className,mode.universe.cosmos[p[3]].name),n,200,150,400,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(system.getTranslation().buttons.main.destroy) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. tablelist(mode.universe.cosmos,"",function(k,v)
						return v.display and stringformat("%s%s <a href='event:main.destroy.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name) or ""
					end),n,200)
				end
				return
			end
			-- Recreate
			if p[2] == "recreate" then
				if p[3] then
					p[3] = tonumber(p[3])
					if mode.universe.cosmos[p[3]].id == mode.universe.cosmos[1].id then 
						for i = 1,mode.universe.orbit[4] do
							if mode.universe.cosmos[p[3]].class < 3 then
								mode.universe.cosmos[i]:create()
							end
						end
						
						tfm.exec.chatMessage("<R>" .. system.getTranslation().systemRecreated,n)
					else
						if mode.universe.cosmos[p[3]].class == 3 then
							if mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf].display then
								mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:destroy()
							else
								tfm.exec.chatMessage("<R>" .. system.getTranslation().planetRecreated,n)
							end
							
							mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:create()
						else
							mode.universe.cosmos[p[3]]:create()
							
							if mode.universe.cosmos[p[3]].class == 2 then
								if #mode.universe.cosmos[p[3]].moons > 0 then
									tfm.exec.chatMessage("<R>" .. system.getTranslation().moonRecreated,n)
								end
							end
						end
					end
					mode.universe.uicloseSplash(n,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. stringupper(system.getTranslation().buttons.main.recreate) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. tablelist(mode.universe.cosmos,"",function(k,v)
						return v.display and "" or stringformat("%s%s <a href='event:main.recreate.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name)
					end),n,200)
				end
				return
			end
			return
		end
		-- Profile
		if p[1] == "profile" then
			local allowed = true
			if mode.universe.info[n] and mode.universe.info[n].creatorOpen then
				allowed = false
			end
			if allowed then
				-- Open, Exit, Respectively.
				if p[2] == "open" then
					mode.universe.profile.uiremoveprofile(n)
					mode.universe.profile["profile" .. p[3]](p[4],n)
				elseif p[2] == "exit" then
					mode.universe.uicloseSplash(n,true)
					mode.universe.profile.uiremoveprofile(n)
				end
			end
			return
		end
	end,
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+")
		
		if p[1] == "profile" then
			if p[2] then
				p[2] = stringlower(p[2])
				for k,v in next,mode.universe.cosmos do
					if stringlower(v.name) == p[2] then
						mode.universe.eventTextAreaCallback(nil,n,"profile.open." .. v.className .. "." .. k)
						break
					end
				end
			else
				mode.universe.eventKeyboard(n,stringbyte("P"))
			end
			return
		end
		
		if system.roomAdmins[n] then
			if p[1] == "name" then
				if p[2] then
					mode.universe.eventPopupAnswer(0,n,tableconcat(p," ",2))
				else
					ui.addPopup(0,2,"<p align='center'><font color='#CF50DB'>" .. system.getTranslation().sysName.choose,n,200,150,400,true)
				end
				return
			end
		end
	end,
	-- PopupAnswer
	eventPopupAnswer = function(i,n,a)
		if i == 0 then
			if a ~= "" then
				mode.universe.systemName = stringsub(a,1,20)
				tfm.exec.chatMessage("<font color='#CF50DB'>" .. stringformat(system.getTranslation().sysName.new,mode.universe.systemName))
			end
		else
			if a == "yes" then
				local destroyable,moonMessage = true,false
				if mode.universe.cosmos[i].id == mode.universe.cosmos[1].id then 
					for id = 2,mode.universe.orbit[4] do
						--[[if mode.universe.cosmos[id].class < 3 then
							mode.universe.cosmos[id]:destroy()
						end]]
						if mode.universe.cosmos[id].display then
							destroyable = false
							break
						end
					end
				else
					if mode.universe.cosmos[i].class == 2 then
						if #mode.universe.cosmos[i].moons > 0 then
							moonMessage = true
						end
					end
				end
				if destroyable then
					mode.universe.cosmos[i]:destroy()
					
					if moonMessage then
						tfm.exec.chatMessage("<R>" .. system.getTranslation().moonDestroyed,n)
					end
				else
					tfm.exec.chatMessage("<R>" .. system.getTranslation().cantDestroy,n)
				end
			end
			mode.universe.uicloseSplash(n,true)
		end
	end,
	-- NewGame
	eventNewGame = function()
		if (tfm.get.room.xmlMapInfo or {}).author ~= "#Module" then
			return
		end
	
		mode.universe.canInsertBackground = true
		
		mode.universe.setBackground()
	
		-- Solar System
		if system.roomNumber == 801 or not stringfind(tfm.get.room.name,"@") then
			local system = {
				[1] = {
					name = "Sun",
					class = 1,
					className = "Star",
					type = 1,
					typeName = "Yellow Dwarf",
					size = 90,
					color = 0xF8B55F,
					temperature = 5500,
				},
				[2] = {
					name = "Mercury",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Iron",
					size = 18,
					color = 0x929292,
					velocity = 4,
					temperature = 200,
					rings = false,
					distance = 1,
				},
				[3] = {
					name = "Venus",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Telluric",
					size = 32,
					color = 0xCFB181,
					velocity = .5,
					temperature = 450,
					rings = false,
					distance = 20,
				},
				[4] = {
					name = "Earth",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Telluric",
					size = 35,
					color = 0x3E7B9D,
					velocity = 1,
					temperature = 20,
					rings = false,
					distance = 70,
				},
				[5] = {
					name = "Moon",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 6.5,
					color = 0x848484,
					temperature = -30,
					satelliteOf = 4
				},
				[6] = {
					name = "Mars",
					class = 2,
					className = "Planet",
					type = 6,
					typeName = "Sillicate",
					size = 24,
					color = 0xEF6B3E,
					velocity = .6,
					temperature = -17,
					rings = false,
					distance = 120,
				},
				[7] = {
					name = "Phobos",
					class = 3,
					className = "Moon",
					type = 2,
					typeName = "Irregular Asteroid",
					size = 3.3,
					color = 0x73572B,
					temperature = -58,
					satelliteOf = 6
				},
				[8] = {
					name = "Deimos",
					class = 3,
					className = "Moon",
					type = 2,
					typeName = "Irregular Asteroid",
					size = 2.2,
					color = 0xB9B9B9,
					temperature = -40,
					satelliteOf = 6
				},
				[9] = {
					name = "Jupiter",
					class = 2,
					className = "Planet",
					type = 3,
					typeName = "Gas Giant",
					size = 55,
					color = 0xE39492,
					velocity = .4,
					temperature = -170,
					rings = {
						inclination = .6,
					},
					distance = 185,
				},
				[10] = {
					name = "Io",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 5.5,
					color = 0xE7D587,
					temperature = -100,
					satelliteOf = 9
				},
				[11] = {
					name = "Europa",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 4.5,
					color = 0xB4BCBE,
					temperature = -180,
					satelliteOf = 9
				},
				[12] = {
					name = "Ganymede",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 10,
					color = 0x907E6D,
					temperature = -150,
					satelliteOf = 9
				},
				[13] = {
					name = "Callisto",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 8,
					color = 0xB9A89F,
					temperature = -180,
					satelliteOf = 9
				},
				[14] = {
					name = "Saturn",
					class = 2,
					className = "Planet",
					type = 3,
					typeName = "Gas Giant",
					size = 50,
					color = 0xCAAB7B,
					velocity = .3,
					temperature = -170,
					rings = {
						inclination = .3,
						volume = 7
					},
					distance = 280,
				},
				[15] = {
					name = "Titan",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 9,
					color = 0xCF892A,
					temperature = -180,
					satelliteOf = 14
				},
				[16] = {
					name = "Enceladus",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 6.5,
					color = 0xAEBBC3,
					temperature = -200,
					satelliteOf = 14
				},
				[17] = {
					name = "Uranus",
					class = 2,
					className = "Planet",
					type = 4,
					typeName = "Ice Giant",
					size = 36,
					color = 0x57D2C9,
					velocity = .2,
					temperature = -216,
					rings = {
						inclination = 2,
						volume = 1
					},
					distance = 360,
				},
				[18] = {
					name = "Neptune",
					class = 2,
					className = "Planet",
					type = 4,
					typeName = "Ice Giant",
					size = 30,
					color = 0x456FFD,
					velocity = .17,
					temperature = -210,
					rings = false,
					distance = 430,
				},
				[19] = {
					name = "Pluto",
					class = 2,
					className = "Planet",
					type = 8,
					typeName = "Dwarf",
					size = 6,
					color = 0x40181C,
					velocity = .08,
					temperature = -230,
					rings = false,
					distance = 500,
				},
				[20] = {
					name = "Charon",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 3.8,
					color = 0xA7A7A7,
					temperature = -220,
					satelliteOf = 19
				},
			}
			
			for i = 1,#system do
				if not mode.universe.stuff[system[i].name] then
					mode.universe.object.new(mode.universe.object,system[i])
				end
			end
			
			
			for i = 1,#mode.universe.cosmos do
				if mode.universe.cosmos[i].class ~= 3 then
					mode.universe.cosmos[i]:create()
				end
			end
		end
	end,
	-- Loop
	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			for k,v in next, (system.players(true)) do
				tfm.exec.killPlayer(v)
			end
		end
		
		if _G.currentTime % 80 == 0 then
			if mode.universe.ufoId > -1 then
				tfm.exec.removeImage(mode.universe.ufoId)
			end

			mode.universe.ufoId = tfm.exec.addImage(tablerandom(mode.universe.images.ufos) .. ".png","!65",mathrandom(200,7800),mathrandom(200,7800))
		end
	end
}

--[[ Dev ]]--
mode.dev = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to the enviroment #dev. Here you can test images, objects, timers and chat messages. Type !help to check the commands or report bugs to Bolodefchoco.",
		
			-- Sets
			maxPlayers = "%s has limited the room to %s players",
			removePassword = "%s just removed the password",
			addPassword = "%s just set the password as %s",
			timerCreated = "Timer \"%s\" created successfully",
			timerDestroyed = "Timer \"%s\" destroyed successfully",
			imageDestroyed = "Image \"%s\" removed successfully",
			imageTargetInvalid = "Image \"%s\": Target invalid!",
			throwDisabled = "Throwing objects was disabled!",
			throwCreated = "Throwing system created!",
			characterDisabled = "Characters disabled!",
			characterCreated = "Character system created!",
			loadMap = "%s just loaded the map %s",
			
			-- Help
			commands = {
				"set players [amount] ~> Defines a limit amount of mice in the room",
				"set password [password] ~> Defines/Removes a password in the room",
				"set background [background image] [x] [y] ~> Defines a background in the map",
				"set background remove ~> Removes the background in the map",
				"timer ~> Displays all the timers running",
				"timer [name] break ~> Destroyes the specified timer",
				"timer [name] [(boolean)loop / (int)total executions] [time, in seconds, for each execution] [(function's name)callback] [*optional*parameters (#Int,@String,!Boolean,?var)] ~> Creates a timer",
				"img ~> Displays all the images being displayed in the moment",
				"img [name] remove ~> Removes the specified image",
				"img [name] [image] [target (#ObjectName in case of #)] [x] [y] [*optional*player] ~> Adds an image",
				"object ~> Displays all the objects in the map",
				"object [name] remove ~> Removes the specified object",
				"object [name] [id] [x] [y] [angle] [(boolean:int)\"true:1\" <seconds for despawning] [x speed] [y speed] [(boolean)ghost] ~> Creates an object",
				"throw remove ~> Disables the throwing system",
				"throw [player (* > all)] [object type] [x speed] [y speed] [(boolean)ghost] [*optional*(string/table>use {x,y,z})left images] [*optional*(string/table>use {x,y,z})right images(- > same value of the last argument)] ~> Enables the throwing system by pressing space and shooting an object [*optional*linked to an image]",
				"character disable ~> Disables the character system",
				"character [player (* > all)] [depth ($/%)] [left image] [right image(- > same value of the last argument)] [xAxis] [yAxis] ~> Creates the character system",
				"display [message] [player (* > all)] ~> Displays a chat message",
				"disable [disableable official function] [(boolean)disable] ~> Disables/Enables the specified setting (Shaman, New Game, ...)",
				"xml [@Map] ~> Loads the map as XML. You can also insert the XML parameter img=\"img.png,x,y,0/1 (foreground)\" to add images automatically",
				"np [@Map] ~> Loads a map",
				"execute [function] [arguments (#Int,@String,!Boolean,?var)] ~> Executes the specified function"
			},
		},
		br = {
			welcome = "Bem-vindo ao ambiente #dev. Aqui você poderá testar imagens, objectos, timers e mensagens no chat, Digite !help para checar os comandos ou reporte bugs para Bolodefchoco.",
		
			maxPlayers = "%s limitou a sala a %s jogadores",
			removePassword = "%s acabou de remover a senha",
			addPassword = "%s acabou de definir a senha para %s",
			timerCreated = "Timer \"%s\" criado com sucesso",
			timerDestroyed = "Timer \"%s\" destruido com sucesso",
			imageDestroyed = "Imagem \"%s\" removida com sucesso",
			imageTargetInvalid = "Imagem \"%s\": Target inválido!",
			throwDisabled = "Sistema de tiro desativado!",
			throwCreated = "Sistema de tiro criado!",
			loadMap = "%s acabou de carregar o mapa %s",
			
			commands = {
				"set players [quantidade] ~> Define um limite de jogadores na sala",
				"set password [senha] ~> Define/Remove a senha da sala",
				"set background [imagem de fundo] [x] [y] ~> Define uma imagem de fundo no mapa",
				"set background remove ~> Remove a imagem de fundo do mapa",
				"timer ~> Mostra todos os timers rodando",
				"timer [nome] break ~> Destrói um timer especificado",
				"timer [nome] [(boolean)loop / (int)execuções totais] [tempo, em segundos, para cada execução] [(nome da função)callback] [*opcional*parâmetros (#Número,@Texto,!Boolean,?Variável)] ~> Cria um timer",
				"img ~> Exibe todas as imagens que estão sendo exibidas no momento",
				"img [nome] remove ~> Remove a imagem especificada",
				"img [nome] [imagem] [target (#NomeDoObjeto no caso de #)] [x] [y] [*opcional*jogador] ~> Adiciona uma imagem",
				"object ~> Mostra todos os objetos no mapa",
				"object [nome] remove ~> Remove um objeto especificado",
				"object [nome] [id] [x] [y] [angle] [(boolean:int)\"true:1\" <segundos para despawn] [velocidade x] [velocidade y] [(boolean)transparente] ~> Cria um objeto",
				"throw remove ~> Desativa o sistema de lançamento",
				"throw [jogador (* > todos)] [tipo do objeto] [velocidade x] [velocidade y] [(boolean)transparente] [*opcional*(string/table>use {x,y,z})imagens da esquerda] [*opcional*(string/table>use {x,y,z})imagens da direita(- > mesmo valor do último argumento)] ~> Ativa o sistema de lançamento ao apertar espaço e atirar um objeto [*opcional*ligado à uma imagem]",
				"character disable ~> Desativa o sistema de personagens",
				"character [jogador (* > todos)] [camada ($/%)] [imagem da esquerda] [imagem da direita(- > mesmo valor do último argumento)] [x] [y] ~> Cria o sistema de personagens",
				"display [mensagem] [jogador (* > todos)] ~> Mostra uma mensagem no chat",
				"disable [função oficial desativável] [(boolean)desativar] ~> Desativa/Ativa a opção especificada (Shaman, New Game, ...)",
				"xml [@Mapa] ~> Carrega o mapa como XML. Você pode também inserir o parâmetro XML img=\"img.png,x,y,0/1 (primeiro plano)\" para adicionar imagens automaticamente.",
				"np [@Mapa] ~> Carrega um mapa",
				"execute [(nome da função)callback] [argumentos (#Número,@Texto,!Boolean,?Variável)] ~> Executa a função especificada",
			},
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	--[[ Settings ]]--
	-- image
	currentBackground = {},
	images = {},
	mapImages = {},
	mouseImages = {false},
	-- newGame
	runXml = false,
	-- object
	objects = {},
	toDespawn = {},
	-- throw
	throw = {false},
	-- timer
	timers = {},
	--[[ Get ]]--
	getWithType = function(a)
		local values = stringsplit(a or "","[^,]+")
		
		local out = {}
		
		for k,v in next,values do
			local icon,value = stringmatch(v,"([@?#!])(.*)")
			if icon and value then	
				if icon == "#" then
					out[#out + 1] = tonumber(value)
				elseif icon == "@" then
					out[#out + 1] = stringtrim(tostring(value))
				elseif icon == "!" then
					out[#out + 1] = value == "true"
				elseif icon == "?" then
					out[#out + 1] = system.loadTable(value)
				end
			end
		end
		
		return out
	end,
	--[[ Init ]]--
	reset = function()
		mode.dev.currentBackground = {}
		mode.dev.images = {}
		mode.dev.timers = {}
		mode.dev.objects = {}
	end,
	init = function()
		-- Init
		tfm.exec.disableAutoShaman()
		disableChatCommand("set","timer","object","img","throw","display","disable","execute","np","xml","help")
		
		-- Auto Admin
		system.roomAdmins["Mescouleur#0000"] = true
		
		-- Start
		tfm.exec.newGame()
	end,
	--[[ Events ]]--
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = stringsplit(c,"[^%s]+")
		
		if p[1] == "help" then
			tfm.exec.chatMessage(tablelist(system.getTranslation().commands,"\n\n",function(k,v)
				return "<ROSE>• <CE>" .. stringgsub(v,"<","&lt;")
			end),n)
			return
		end
		
		if system.roomAdmins[n] then

			if p[1] == "set" then
				if p[2] == "players" then --set players INT
					p[3] = mathsetLim(tonumber(p[3]) or 25,1,50)
					tfm.exec.setRoomMaxPlayers(p[3])
					tfm.exec.chatMessage("<CE>[#dev] " .. stringformat(system.getTranslation().maxPlayers,n,p[3]))
				elseif p[2] == "password" then --set password PASSWORD
					if p[3] then
						p[3] = tableconcat(p," ",3)
					
						tfm.exec.setRoomPassword(p[3])
					
						tfm.exec.chatMessage("<CE>[#dev] " .. stringformat(system.getTranslation().addPassword,n,stringrep("*",#p[3])))
					else
						tfm.exec.chatMessage("<CE>[#dev] " .. stringformat(system.getTranslation().removePassword,n))
					end
				elseif p[2] == "background" and p[3] then --set background img x y
					if p[3] == "remove" then
						if #mode.dev.currentBackground > 0 then
							tfm.exec.removeImage(mode.dev.currentBackground[4])
							mode.dev.currentBackground = {}
						end
					else
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
						mode.dev.currentBackground = {p[3] .. ".png",tonumber(p[4]) or 0,tonumber(p[5]) or 0}
						mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
					end
				end
				return
			end
			
			if p[1] == "timer" then --timer NAME LOOP TIME FUNC PARAM
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. tablelist(mode.dev.timers,"\n",tostring),n)
				elseif p[3] == "break" then
					if mode.dev.timers[p[2]] then
						system.removeTimer(mode.dev.timers[p[2]])
						mode.dev.timers[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().timerDestroyed,p[2]),n)
					end
				else
					if #mode.dev.timers < 39 then
						if mode.dev.timers[p[2]] then
							mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " break")
						end
						
						if p[5] then 
							local loop,counter = true
							
							if p[3] == "true" then
								counter = -1
							elseif p[3] == "false" then
								counter = 1
							else
								counter = tonumber(p[3]) or 5
							end
							
							local time = mathsetLim(tonumber(p[4]) or 1,1,50) * 1000
							local f = system.loadTable(p[5])
							f = type(f) == "function" and f or tfm.exec.chatMessage

							local args = mode.dev.getWithType(tablelist(p," ",function(k,v)
								return (tablefind({"#","@","!","?"},stringsub(v,1,1)) and "," or "") .. v
							end,6))
							
							local this
							this = system.newTimer(function()
								f(tableunpack(args))
								
								counter = counter - 1
								if counter == 0 then
									system.removeTimer(this)
									mode.dev.timers[p[2]] = nil
								end
							end,time,loop)
							
							mode.dev.timers[p[2]] = this
							
							tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().timerCreated,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "img" then --img NAME IMG TARG X Y PLAYER
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. tablelist(mode.dev.images,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.images[p[2]] then
						tfm.exec.removeImage(mode.dev.images[p[2]])
						mode.dev.images[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().imageDestroyed,p[2]),n)
					end
				else
					if mode.dev.images[p[2]]then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
					
					if p[4] then
						local target = tablefind({"#","$","%","?","_","!","&"},stringsub(p[4],1,1))
						
						if target then
							p[5],p[6] = p[5] or 0,p[6] or 0
						
							local object = stringsub(p[4],1,1) == "#" and "#" .. (mode.dev.objects[stringsub(p[4],2)] or tfm.exec.addShamanObject(1,p[5],p[6])) or p[4]
							mode.dev.images[p[2]] = tfm.exec.addImage(p[3] .. ".png",object,p[5],p[6],p[7])
						else
							tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().imageTargetInvalid,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "object" then --object NAME ID X Y BOOLEAN_DESPAWN:TIME_TO_DESPAWN ANGLE XS YS GHOST
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. tablelist(mode.dev.objects,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.objects[p[2]] then
						tfm.exec.removeObject(mode.dev.objects[p[2]])
						mode.dev.objects[p[2]] = nil
					end
				else
					if mode.dev.objects[p[2]] then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
				
					mode.dev.objects[p[2]] = tfm.exec.addShamanObject(tonumber(p[3]) or 1,tonumber(p[4]) or 0,tonumber(p[5]) or 0,tonumber(p[7]),tonumber(p[8]),tonumber(p[9]),p[10] == "true")
					if p[6] and stringfind(p[6],"true") then
						mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {mode.dev.objects[p[2]],os.time() + (tonumber(stringmatch(p[6],":(%d+)")) or 5) * 1000,p[2]}
					end
				end
				return
			end
			
			if p[1] == "throw" and p[2] then --throw WHO ID XS YS BOOLEAN_GHOST {IMG,IMG} {IMG,IMG}
				if p[2] == "remove" then
					mode.dev.throw = {false}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwDisabled,n)
					
					for k,v in next,mode.dev.info do
						system.bindKeyboard(k,32,true,false)
					end
				else
					mode.dev.throw = {false}
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							system.bindKeyboard(k,32,true,true)
						end
					else
						system.bindKeyboard(p[2],32,true,true)
					end
					mode.dev.throw[2] = p[2] -- Who
					
					mode.dev.throw[3] = tonumber(p[3]) or 17 -- Object type
					
					local create = true
					if p[7] then
						if not p[8] or p[8] == "-" then
							p[8] = rawget(p,7)
						end	
						if stringfind(p[7],"{") or stringfind(p[8],"{") then
							if stringfind(p[7],"{") and stringfind(p[8],"{") then
								mode.dev.throw[7] = stringsplit(stringsub(p[7],2,-2),"[^,]+") -- Left images
								mode.dev.throw[8] = stringsplit(stringsub(p[8],2,-2),"[^,]+") -- Right images
							else
								create = false
							end
						else
							mode.dev.throw[7] = {p[7]}
							mode.dev.throw[8] = {p[8]}
						end
					end
					
					if create then
						mode.dev.throw[4] = tonumber(p[4]) or 0 -- X speed
						mode.dev.throw[5] = tonumber(p[5]) or 0 -- Y speed
						mode.dev.throw[6] = p[6] == "true" -- Ghost
						
						mode.dev.throw[1] = true
						tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwCreated,n)
					else
						mode.dev.throw = {false}
					end
				end
				return
			end

			if p[1] == "character" and p[4] then --character WHO DEPTH IMG IMG X Y
				if p[2] == "disable" then
					mode.dev.mouseImages = {false}
					
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterDisabled,n)
					
					for k,v in next,mode.dev.info do
						for i = 0,2,2 do
							system.bindKeyboard(k,i,true,false)
						end
						
						if v.mouseImage > -1 then
							tfm.exec.removeImage(v.mouseImage)
							v.mouseImage = -1
						end
					end
				else
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							for i = 0,2,2 do
								system.bindKeyboard(k,i,true,true)
							end
						end
					else
						for i = 0,2,2 do
							system.bindKeyboard(p[2],i,true,true)
						end
					end

					p[3] = tablefind({"$","%"},p[3]) and p[3] or "%"
					
					if not p[5] or p[5] == "-" then
						p[5] = rawget(p,4)
					end
					
					mode.dev.mouseImages = {true,p[2],p[3],p[4],p[5],tonumber(p[6]) or 0,tonumber(p[7]) or 0}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterCreated,n)
				end
				return
			end
			
			if p[1] == "display" and p[2] then
				tfm.exec.chatMessage("<CE>[" .. n .. "#DEV-DISPLAY] <N>" .. stringgsub(tableconcat(p," ",2),"<","&lt;"))
				return
			end
		
			if p[1] == "disable" and p[2] then --disable AUTONEWGAME TRUE
				for k,v in next,tfm.exec do
					if stringlower(k) == p[1]..p[2] then
						local status = p[3] == "true"
						tfm.exec.chatMessage("<CE>" .. k .. " : " .. tostring(status))
						v(status)
						break
					end
				end
				return
			end
			
			if p[1] == "xml" and p[2] and _G.currentTime > 10 then
				mode.dev.runXml = true
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().loadMap,n,p[2]) .. " (XML)")
				return
			end
		
			if p[1] == "np" and p[2] and _G.currentTime > 10 then
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. stringformat(system.getTranslation().loadMap,n,p[2]))
				return
			end
		
			if p[1] == "execute" and p[2] then --execute tfm.exec.giveCheese NAME
				local f = system.loadTable(p[2])
				if type(f) == "function" then
					local args = mode.dev.getWithType(tablelist(p," ",function(k,v)
						return (tablefind({"#","@","!","?"},stringsub(v,1,1)) and "," or "") .. v
					end,3))
				
					f(tableunpack(args))
				end
				return
			end
		end
	end,
	-- NewGame
	eventNewGame = function()
		mode.dev.objects = {}
		
		if mode.dev.runXml then
			system.newTimer(function()
				tfm.exec.newGame(tfm.get.room.xmlMapInfo.xml or "")
			end,7000,false)
			ui.addTextArea(0,"",nil,-1500,-1500,3000,3000,0x6A7495,0x6A7495,1,true)
		else
			ui.removeTextArea(0,nil)
			for k,v in next,mode.dev.mapImages do
				tfm.exec.removeImage(v)
			end
			
			if mode.dev.currentBackground[1] then
				mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
			end

			if tfm.get.room.xmlMapInfo.xml then
				xml.attribFunc(tfm.get.room.xmlMapInfo.xml,{
				
					[1] = {
						attribute = "img",
						func = function(value)
							for k,v in next,stringsplit(value,"[^;]+") do
								local info = stringsplit(v,"[^,]+") -- "img.png,x or 0,y or 0,0/1 (foreground)"
								info[4] = mathsetLim(tonumber(info[4]) or 0,0,1)
								
								mode.dev.mapImages[#mode.dev.mapImages + 1] = tfm.exec.addImage(info[1] .. ".png",(({"?","!"})[info[4] + 1]) .. k,tonumber(info[2]) or 5,tonumber(info[3]) or 30)	
							end
						end
					}
				})
			end
		end
		mode.dev.runXml = false
	end,
	-- NewPlayer
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
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				if mode.dev.throw[1] and os.time() > mode.dev.info[n].timer then
					mode.dev.info[n].timer = os.time() + 500
			
					x = x + (tfm.get.room.playerList[n].isFacingRight and 30 or -30)
					y = y - 15
					
					local xs,ys = mode.dev.throw[4],mode.dev.throw[5]
					
					local angle = 0			
					if mode.dev.throw[3] == 17 then
						angle = tfm.get.room.playerList[n].isFacingRight and 90 or -90
					else
						xs = (tfm.get.room.playerList[n].isFacingRight and xs or -xs)
						ys = (tfm.get.room.playerList[n].isFacingRight and ys or -ys)
					end
					
					local object = tfm.exec.addShamanObject(mode.dev.throw[3],x,y,angle,xs,ys,mode.dev.throw[6])
					
					if mode.dev.throw[8] then
						local imageId = mathrandom(#mode.dev.throw[7])
						tfm.exec.addImage(mode.dev.throw[(tfm.get.room.playerList[n].isFacingRight and 8 or 7)][imageId] .. ".png","#" .. object,-5,-8)
					end
					
					mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {object,os.time() + 5000}
				end
				return
			end
			
			if k == 0 or k == 2 then
				if mode.dev.mouseImages[1] then
					if mode.dev.info[n].mouseImage > -1 then
						tfm.exec.removeImage(mode.dev.info[n].mouseImage)
					end
					
					mode.dev.info[n].mouseImage = tfm.exec.addImage(({[0]=mode.dev.mouseImages[4],[2]=mode.dev.mouseImages[5]})[k] .. ".png",mode.dev.mouseImages[3] .. n,mode.dev.mouseImages[6],mode.dev.mouseImages[7])
				end
				return
			end
		end
	end,
	-- Loop
	eventLoop = function()
		for k,v in next,{tableunpack(mode.dev.toDespawn)} do
			if os.time() > v[2] then
				tfm.exec.removeObject(v[1])
				mode.dev.objects[v[1]] = nil
				tableremove(mode.dev.toDespawn,k)
			end
		end

		if system.miscAttrib == 1 then
			tableforeach(tfm.get.room.playerList,tfm.exec.respawnPlayer)
		end
	end,
}

--[[ Chess ]]--
mode.chess = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to the module! Sit on an armchair and enjoy the game with a friend!\n\tYou, chess lord, report any bug to Bolodefchoco!",
		
			-- Info
			team = "%s is playing with the %s pieces",
			space = "Space",
		
			-- System
			move = "You can only move the %s pieces!",
			win = "%s pieces won!",
			left = "%s left the game",
			turn = "%s's turn.",
			promo = "Pawn Promotion",
			
			-- Colors
			colors = {"White", "Black"},
			
			-- Promo Pieces
			pieces = {
				queen = "Queen",
				rook = "Rook",
				bishop = "Bishop",
				knight = "Knight",
			},
		},
		br = {
			welcome = "Bem-vindo ao módulo! Sente numa poltrona e aproveite o jogo com um amigo!\n\tVocê, senhor do xadrez, reporte qualquer bug para Bolodefchoco!",
		
			team = "%s está jogando com as peças de cor %s",
			space = "Espaço",
		
			move = "Você só pode mover as peças de cor %s!",
			win = "As peças de cor %s venceram!",
			left = "%s deixou o jogo",
			turn = "Vez das peças de cor %s.",
			promo = "Promoção de Peão",
			
			colors = {"Branca", "Preta"},
			
			pieces = {
				queen = "Rainha",
				rook = "Torre",
				bishop = "Bispo",
				knight = "Cavalo",
			},
		},
	},
	langue = "",
	--[[ Board ]]--
	setBoard = function()
		return
		{
			{'♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜'},
			{'♟', '♟', '♟', '♟', '♟', '♟', '♟', '♟'},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'', '', '', '', '', '', '', ''},
			{'♙', '♙', '♙', '♙', '♙', '♙', '♙', '♙'},
			{'♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'}
		}
	end,
	--[[ Data ]]--
	board = {},
	colors = {
		background = 0x2F363F,
		whiteSquare = 0xFFCE9E,
		whitePiece = 'FFFFFF',
		blackSquare = 0xD18B47,
		blackPiece = '1',
		specialMove = 0xB300EF,
		emptyMove = 0x2ECF73,
		captureMove = 0xAF2A2A,
		lastMove = 0xFFCF5F,
		selectedPiece = '<PT>',
	},
	pieces = {
		king = 1,
		queen = 2,
		rook = 3,
		bishop = 4,
		knight = 5,
		pawn = 6
	},
	players = {},
	moveTimer = 0,
	canStart = false,
	currentPlayer = 2,
	currentPlayerColor = "",
	lastMove = {},
	coloredSquares = {},
	--[[ StringRef ]]--
	stringReference = {
		emptySquare = "<textformat leftmargin='30' rightmargin='30' leading='30'>",
		HREF_select = "<a href='event:select_%s_%s_%s_%s'>",
		squareFormat = "<font size='25'><B>",
		
		realReference = function()
			mode.chess.stringReference.select = mode.chess.stringReference.emptySquare .. mode.chess.stringReference.HREF_select .. "\n"
			mode.chess.stringReference.piece = mode.chess.stringReference.squareFormat .. mode.chess.stringReference.HREF_select .. "%s"
			mode.chess.stringReference.castling = mode.chess.stringReference.emptySquare .. "<a href='event:kingpass_%s_%s_%s'>\n"
		end,
	},
	--[[ System ]]--
	-- playerInfo
	playerInfo = function()
		return 
		{
			[1] = { name = "", pieces = 16, castling = {true, true}, lastMove = "" },
			[2] = { name = "", pieces = 16, castling = {true, true}, lastMove = "" },
		}
	end,
	-- White Piece
	isWhitePiece = function(p)
		p = stringbyte(p, 3, 3)
		return p > 147 and p < 154
	end,
	-- Square Exists
	existSquare = function(row, column)
		return mode.chess.board[row] and mode.chess.board[row][column]
	end,
	-- isPiece
	isPieceSquare = function(row, column)
		return mode.chess.existSquare(row, column) and mode.chess.board[row][column] ~= ''
	end,
	-- Piece Different Color
	pieceDifColor = function(p1, p2)
		return mode.chess.isWhitePiece(p1) ~= mode.chess.isWhitePiece(p2)
	end,
	-- Piece ID
	pieceID = function(p)
		return (stringbyte(p, 3, 3) - 148) % 6 + 1
	end,
	-- Check Capture
	checkCapture = function(n, row, column, newRow, newColumn, boolCapture, boolEmpty)
		boolCapture = boolCapture == nil or boolCapture
		boolEmpty = boolEmpty == nil or boolEmpty

		if mode.chess.isPieceSquare(newRow, newColumn) then
			if boolCapture and mode.chess.pieceDifColor(mode.chess.board[row][column], mode.chess.board[newRow][newColumn]) then
				mode.chess.uiupdateSquare(newRow, newColumn, n, mode.chess.colors.captureMove, stringformat(mode.chess.stringReference.piece, row, column, newRow, newColumn, mode.chess.board[newRow][newColumn]))
			end
			return true
		end
		if boolEmpty then
			mode.chess.uiupdateSquare(newRow, newColumn, n, mode.chess.colors.emptyMove, stringformat(mode.chess.stringReference.select, row, column, newRow, newColumn))
		end
		return false
	end,
	-- Turn
	changeTurn = function()
		mode.chess.currentPlayer = (mode.chess.currentPlayer == 1 and 2 or 1)
		mode.chess.currentPlayerColor = system.getTranslation().colors[mode.chess.currentPlayer]
		
		local text = "<B><p align='center'><font size='18'>" .. stringformat(system.getTranslation().turn, mode.chess.currentPlayerColor)
		mode.chess.border(text)
	end,
	--[[ Refresh ]]--
	refresh = function()
		mode.chess.canStart = false

		mode.chess.uiclearColoredSquares()
		
		for k, v in next, mode.chess.players do
			tfm.exec.movePlayer(v.name, 400, 375)
		end
		
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()

		mode.chess.currentPlayer = 2
		for i = 3, 5 do
			ui.removeTextArea(-i)
		end
		
		for i = 1, 2 do
			ui.addTextArea(-i, "<font color='#" .. system.getTranslation().colors[i] .. "'><p align='center'><font size='20'>[" .. system.getTranslation().space .. "]", nil, 5 + (i - 1) * 595, 180, 200, nil, 1, 1, 0, true)
		end
		
		mode.chess.uiboard()
	end,
	--[[ UI ]]--
	-- Border
	border = function(text)
		ui.addTextArea(-4, "<font color='#1'>" .. text, nil, 5, 367, 792, nil, 1, 1, 0, true)
		ui.addTextArea(-5, "<PS>" .. text, nil, 5, 365, 790, nil, 1, 1, 0, true)
	end,
	-- Clear Squares
	uiclearColoredSquares = function()
		for k, v in next, tablecopy(mode.chess.coloredSquares) do
			if v then
				ui.removeTextArea(k)
				mode.chess.coloredSquares[k] = nil
			end
		end
	end,
	-- Update Square
	uiupdateSquare = function(row, column, n, color, href, notNeg)
		if mode.chess.existSquare(row, column) then
			local isNeg = false
			if not notNeg then
				isNeg = not not (color or href)
			end

			local squareText = href or mode.chess.board[row][column] == '' and '' or stringformat("%s%s<a href='event:square_%s_%s'>%s", mode.chess.stringReference.squareFormat, "<font color='#" .. mode.chess.colors[(mode.chess.isWhitePiece(mode.chess.board[row][column]) and "white" or "black") .. "Piece"] .. "'>", row, column, mode.chess.board[row][column])
			
			ui.addTextArea((row..column) * (isNeg and -1 or 1), squareText, n, 252 + (column - 1) * 38, 50 + (row - 1) * 38, 30, 30, color or (((row + column) % 2 == 0) and mode.chess.colors.whiteSquare or mode.chess.colors.blackSquare), 1, 1, true)
			
			ui.setShamanName(stringformat("-   <G>|   <S>%s x %s", mode.chess.players[1].pieces, mode.chess.players[2].pieces))
			if isNeg then
				mode.chess.coloredSquares[-(row..column)] = true
			end
		end
	end,
	-- Update Move
	uiupdateLastMove = function(...)
		if mode.chess.lastMove[1] and mode.chess.lastMove[2] then
			mode.chess.uiupdateSquare(mode.chess.lastMove[1], mode.chess.lastMove[2])
		end
		mode.chess.lastMove = {...}
	end,
	-- Board
	uiboard = function(n)
		--[[
			[11:88] -> Squares
			[-88:-11] -> Effects
			[-10:0] -> Others
		]]
		ui.addTextArea(0, "", n, 247, 45, 306, 306, mode.chess.colors.background, mode.chess.colors.background, 1, true)
		for row = 1, 8 do
			for column = 1, 8 do
				mode.chess.uiupdateSquare(row, column, n)
			end
		end
	end,
	--[[ Init ]]--
	init = function()
		mode.chess.stringReference.realReference()
	
		mode.chess.board = mode.chess.setBoard()
		mode.chess.players = mode.chess.playerInfo()
	
		for k, v in next, {"AutoShaman", "AfkDeath", "AutoNewGame", "AutoScore"} do
			tfm.exec["disable" .. v]()
		end

		tfm.exec.newGame(1995980)
		
		system.roomAdmins["Billysmille#0000"] = true
		
		mode.chess.refresh()
	end,
	--[[ Events ]]--
	-- TextAreaCallback
	eventTextAreaCallback = function(i, n, c)
		if mode.chess.canStart and mode.chess.players[mode.chess.currentPlayer].name == n and os.time() > mode.chess.moveTimer then
			mode.chess.moveTimer = os.time() + 250
		
			c = stringsplit(c, "[^_]+", function(value)
				return tonumber(value) or value
			end)
			
			local row, column = c[2], c[3]
			
			mode.chess.uiclearColoredSquares()
			if c[1] == "transform" then
				ui.removeTextArea(-3, n)
				mode.chess.board[row][column] = stringchar(226, 153, (c[4] == 2 and c[5] + 6 or c[5]))
				
				mode.chess.uiupdateSquare(row, column, nil, mode.chess.colors.lastMove, nil, true) 
				
				mode.chess.changeTurn()
			elseif c[1] == "kingpass" then
				local initialSquare = (c[4] == "left" and -1 or 1)
				local finalSquare = column + (c[4] == "right" and 3 or -4)
				
				local iniTwo = column + (2 * initialSquare)
				local iniSig = column + (1 * initialSquare)
				
				mode.chess.board[row][iniTwo] = mode.chess.board[row][column]
				mode.chess.board[row][column] = ''
				
				mode.chess.board[row][iniSig] = mode.chess.board[row][finalSquare]
				mode.chess.board[row][finalSquare] = ''
				
				mode.chess.players[mode.chess.currentPlayer].castling = {false, false}
				mode.chess.players[mode.chess.currentPlayer].lastMove = ''
				
				mode.chess.uiupdateLastMove(row, iniTwo)
				
				mode.chess.uiupdateSquare(row, iniTwo, nil, mode.chess.colors.lastMove, nil, true)
				mode.chess.uiupdateSquare(row, column)
				mode.chess.uiupdateSquare(row, iniSig)
				mode.chess.uiupdateSquare(row, finalSquare)
				
				mode.chess.changeTurn()
			else
				local piece = mode.chess.pieceID(mode.chess.board[row][column])
			
				if c[1] == "square" then
					local whitePiece = mode.chess.isWhitePiece(mode.chess.board[row][column])
					if (mode.chess.currentPlayer == 1 and not whitePiece) or (mode.chess.currentPlayer == 2 and whitePiece) then
						tfm.exec.chatMessage("<S>[#Chess] " .. stringformat(system.getTranslation().move, mode.chess.currentPlayerColor), n)
						return
					end

					-- Highlights the piece you've selected
					mode.chess.uiupdateSquare(row, column, n, nil, mode.chess.stringReference.squareFormat .. mode.chess.colors.selectedPiece .. mode.chess.board[row][column])
					
					local dir = whitePiece and -1 or 1
					if piece == mode.chess.pieces.pawn then
						-- In front, 1 or 2 squares
						for i = 1, ((row == 2 or row == 7) and 2 or 1) do
							local newRow = row + i * dir
							
							if mode.chess.isPieceSquare(newRow, column) then
								break
							end
							
							mode.chess.uiupdateSquare(newRow, column, n, ((newRow == 1 or newRow == 8) and mode.chess.colors.specialMove or mode.chess.colors.emptyMove), stringformat(mode.chess.stringReference.select, row, column, newRow, column))
						end
						
						-- En passant
						if mode.chess.players[3 - mode.chess.currentPlayer].lastMove ~= "" then
							local grid = stringsplit(mode.chess.players[3 - mode.chess.currentPlayer].lastMove, "[^_]+", tonumber)
							if grid[1] and grid[2] then
								for i = -1, 1, 2 do
									if grid[1] == row and grid[2] + i == column then
										mode.chess.uiupdateSquare(grid[1] + dir, grid[2], n, mode.chess.colors.specialMove, stringformat(mode.chess.stringReference.piece, row, column, grid[1], grid[2] .. "_" .. (grid[1] + dir), "\n"))
										break
									end
								end
							end
						end
					end
					if piece == mode.chess.pieces.rook or piece == mode.chess.pieces.queen or piece == mode.chess.pieces.king then
						local range = (piece == mode.chess.pieces.king and 1 or 8)
						
						-- Horizontal and Vertical
						local coord = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}}
						for i = 1, 4 do
							for j = 1, range do
								local newRow = row + j * coord[i][1]
								local newColumn = column + j * coord[i][2]
								
								if mode.chess.checkCapture(n, row, column, newRow, newColumn) then
									break
								end
							end
						end
					end
					if piece == mode.chess.pieces.knight then
						-- L Shape
						local coord = {{-2, -1}, {-1, -2}, {-2, 1}, {-1, 2}, {1, -2}, {2, -1}, {1, 2}, {2, 1}}
						for i = 1, 8 do
							local newRow = row + coord[i][1]
							local newColumn = column + coord[i][2]
							
							mode.chess.checkCapture(n, row, column, newRow, newColumn)
						end
					end
					if piece == mode.chess.pieces.bishop or piece == mode.chess.pieces.queen or piece == mode.chess.pieces.king or piece == mode.chess.pieces.pawn then
						local isPawn = piece == mode.chess.pieces.pawn
						local range = ((piece == mode.chess.pieces.king or isPawn) and 1 or 8)
						
						-- Diagonal
						local coord = {{-1, -1}, {-1, 1}, {1, -1}, {1, 1}}
						for i = 1, 4 do
							for j = 1, range do
								local newRow = row + j * coord[i][1]
								local newColumn = column + j * coord[i][2]
								
								local check = mode.chess.checkCapture(n, row, column, newRow, newColumn, (not isPawn or coord[i][1] == dir), not isPawn)
								if check then
									break
								end
							end
						end
					end
					if piece == mode.chess.pieces.king then
						-- Castling
						local d = 1
						for i = 1, 2 do
							if mode.chess.players[mode.chess.currentPlayer].castling[i] and not mode.chess.isPieceSquare(row, column + d) and not mode.chess.isPieceSquare(row, column + (d * 2)) then
								if d > 0 or not mode.chess.isPieceSquare(row, column - 3) then
									mode.chess.uiupdateSquare(row, column + (d > 0 and 2 or -3), n, mode.chess.colors.specialMove, stringformat(mode.chess.stringReference.castling, row, column, (d > 0 and "right" or "left")))
								end
							end
							d = -d
						end
					end
				elseif c[1] == "select" then
					local newRow, newColumn = c[4], c[5]
				
					mode.chess.uiupdateLastMove(c[6] or newRow, newColumn)
					
					-- Checks the attack
					local checkmate = false
					if mode.chess.isPieceSquare(row, column) and mode.chess.isPieceSquare(newRow, newColumn) and mode.chess.pieceDifColor(mode.chess.board[row][column], mode.chess.board[newRow][newColumn]) then
						mode.chess.players[3 - mode.chess.currentPlayer].pieces = mode.chess.players[3 - mode.chess.currentPlayer].pieces - 1
						checkmate = mode.chess.pieceID(mode.chess.board[newRow][newColumn]) == mode.chess.pieces.king
					end
					
					-- Updates the squares
					mode.chess.board[c[6] or newRow][newColumn] = mode.chess.board[row][column]
					if c[6] then
						mode.chess.board[newRow][newColumn] = ''
						mode.chess.uiupdateSquare(c[6], newColumn, nil, mode.chess.colors.lastMove, nil, true) 
					end
					mode.chess.uiupdateSquare(newRow, newColumn, nil, (not c[6] and mode.chess.colors.lastMove or nil), nil, true)
					
					mode.chess.board[row][column] = ''
					mode.chess.uiupdateSquare(row, column)
					
					if checkmate then
						tfm.exec.chatMessage("<S>[#Chess] " .. stringformat(system.getTranslation().win, mode.chess.currentPlayerColor))
						tfm.exec.setPlayerScore(n, 10, true)
						mode.chess.refresh()
						return
					end
					
					-- Sets the lastMove
					mode.chess.players[mode.chess.currentPlayer].lastMove = ((piece == mode.chess.pieces.pawn and mathabs(newRow - row) == 2) and (newRow .. "_" .. newColumn) or '')

					-- Pawn promotion
					if piece == mode.chess.pieces.pawn then
						if newRow == 1 or newRow == 8 then
							local text = "<textformat leading='40'><p align='center'><font size='25'>" .. stringupper(system.getTranslation().promo) .. "<font size='15'>\n<B>"
							for k, v in next, {
								{'<ROSE>' .. system.getTranslation().pieces.queen, 149},
								{'<J>' .. system.getTranslation().pieces.rook, 150},
								{'<PT>' .. system.getTranslation().pieces.bishop, 151},
								{'<BV>' .. system.getTranslation().pieces.knight, 152}
							} do
								text = text .. stringformat("<a href='event:transform_%s_%s_%s_%s'>%s\n", newRow, newColumn, mode.chess.currentPlayer, v[2], "<CH>" .. stringchar(226, 153, v[2]) .. " " .. v[1] .. " <CH>" .. stringchar(226, 153, v[2] + 6))
							end
							ui.addTextArea(-3, text, n, 247, 45, 306, 306, nil, nil, .9, true)
							mode.chess.border("<B><p align='center'><font size='18'>" .. system.getTranslation().promo .. " (" .. mode.chess.currentPlayerColor .. ")")
							return
						end
					-- Disable Castling
					elseif piece == mode.chess.pieces.king then
						mode.chess.players[mode.chess.currentPlayer].castling = {false, false}
					elseif piece == mode.chess.pieces.rook then
						if mode.chess.players[mode.chess.currentPlayer].castling[1] or mode.chess.players[mode.chess.currentPlayer].castling[2] then
							local pieceColumn = column == 1 and 1 or column == 8 and 2 or 0
							if pieceColumn > 0 then
								mode.chess.players[mode.chess.currentPlayer].castling[pieceColumn] = true
							end
						end
					end
					
					mode.chess.changeTurn()
				end
			end
		end
	end,
	-- Loop
	eventLoop = function()
		if not mode.chess.canStart then
			local totalPlayers = 0
			for i = 1, 2 do
				if mode.chess.players[i].name == "" then
					tfm.exec.addShamanObject(0, 40 + 720 * (i - 1), 200)
				else
					totalPlayers = totalPlayers + 1
				end
			end
			
			if totalPlayers == 2 then
				mode.chess.canStart = true
				mode.chess.changeTurn()
			end
		end
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		mode.chess.uiboard(n)
		tfm.exec.respawnPlayer(n)
		system.bindKeyboard(n, 32, true, true)
		tfm.exec.chatMessage("<S>[#Chess] " .. system.getTranslation().welcome, n)
	end,
	-- Keyboard
	eventKeyboard = function(n, k, d, x)
		for k, v in next, mode.chess.players do
			if v.name == n then
				return
			end
		end
		
		local id = x < 76 and 1 or x > 724 and 2 or 0
		if id > 0 then
			if mode.chess.players[id].name == "" then
				mode.chess.players[id].name = n
				local color = system.getTranslation().colors[id]
				ui.addTextArea(-id, "<font color='#" .. mode.chess.colors[(id == 1 and "white" or "black") .. "Piece"] .. "' size='20'><p align='center'>" .. n .. "\n«" .. color .. "»", nil, 5 + (id - 1) * 595, 180, 200, nil, 1, 1, 0, true)
				tfm.exec.playEmote(n, 8)
				tfm.exec.chatMessage("<S>[#Chess] " .. stringformat(system.getTranslation().team , n, color))
			end
		end
	end,
	-- EmotePlayed
	eventEmotePlayed = function(n, t)
		if t == 8 then
			mode.chess.eventKeyboard(n, 32, nil, tfm.get.room.playerList[n].x)
		end
	end,
	-- PlayerLeft
	eventPlayerLeft = function(n)
		for i = 1, 2 do
			if mode.chess.players[i].name == n then
				tfm.exec.chatMessage("<S>[#Chess] " .. stringformat(system.getTranslation().left, n))
				mode.chess.refresh()
				break
			end
		end
	end,
	-- PlayerDied
	eventPlayerDied = tfm.exec.respawnPlayer,
}

--[[ ModeChanged ]]--
system.objects = {
	image = {},
	textarea = {}
}
eventOnModeChange = function()
	-- Remove content
	for k in next,system.objects.image do
		tfm.exec.removeImage(k)
	end
	
	for k in next,system.objects.textarea do
		ui.removeTextArea(k,nil)
	end
	
	system.objects = {
		image = {},
		textarea = {}
	}
	
	ui.addPopup(0,0,"",nil,-1500,-1500)
	
	-- Unbind keyboard and mouse, also normalize color name and scores
	for k in next,tfm.get.room.playerList do
		for i = 0,255 do
			for v = 0,1 do
				system.bindKeyboard(k,i,v == 0,false)
			end
		end
		
		system.bindMouse(k,false)
		
		tfm.exec.setNameColor(k,-1)
		tfm.exec.setPlayerScore(k,0)
	end
	
	-- Set admin back
	system.roomAdmins = system.getAdmins()
	
	-- Reset settings
	tfm.exec.snow(0)
	for k,v in next,{"AutoScore","WatchCommand","AutoNewGame","AutoShaman","AllShamanSkills","MortCommand","DebugCommand","MinimalistMode","AfkDeath","PhysicalConsumables","AutoTimeLeft"} do
		tfm.exec["disable" .. v](false)
	end
	tfm.exec.setAutoMapFlipMode()
	
	tfm.exec.setRoomMaxPlayers(25)
	tfm.exec.setRoomPassword("")	
end

--[[ Events ]]--
	--[[ eventLoop ]]--
events.eventLoop = function(currentTime,leftTime)
	_G.currentTime = mathround(currentTime / 1e3)
	_G.leftTime = mathround(leftTime / 1e3)
end
	--[[ eventNewPlayer ]]--
events.eventNewPlayer = function(n)
	tfm.exec.lowerSyncDelay(n)
	
	if system.officialMode[2] ~= "" then
		tfm.exec.chatMessage(system.officialMode[2],n)
	end
end
	--[[ eventChatCommand ]]--
events.eventChatCommand = function(n,c)
	if system.isPlayer(n) then
		system.disableChatCommandDisplay(c,true)
		
		local p = stringsplit(c,"[^%s]+",stringlower)
		disableChatCommand(p[1])
	
		if module._FREEACCESS[n] then
			if p[1] == "refresh" and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				tfm.exec.chatMessage("[#bolo] Refreshing the module...")
				eventOnModeChange()
				system.init(true)
				return
			end
			
			if p[1] == "room" and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				local room = tonumber(p[2]) or 0
				if _G["eventChatCommand"] and system.roomNumber ~= room then
					system.roomNumber = room
					tfm.exec.chatMessage("[#bolo] Room number changed.")
					eventChatCommand(n,"refresh")
				end
				return
			end
			
			if p[1] == "setmisc" and p[2] and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				system.miscAttrib = tonumber(p[2]) or 0
				system.miscAttrib = mathsetLim(system.miscAttrib,0,99)
				tfm.exec.chatMessage("[#bolo] Misc attribute changed.")
				if p[3] == "true" then
					eventChatCommand(n,"refresh")
				end
				return
			end
			
			if p[1] == "load" and (module._FREEACCESS[n] > 2 or not system.isRoom) then
				if os.time() > system.modeChanged and os.time() > system.newGameTimer then
					if system.getGameMode(p[2],true) then
						tfm.exec.chatMessage("[#bolo] Loading " .. p[2])
						system.init(system.isRoom)
					end
				end				
				return
			end
		end
		
		if p[1] == "module" then
			p[2] = stringupper(p[2] or "")
			
			if module["_" .. p[2]] then
				if p[2] == "FREEACCESS" then
					if p[3] then
						local num = tonumber(p[3])
						if num then
							num = mathsetLim(num, 1, 3)
							local lastValue = num
							
							tfm.exec.chatMessage("[#bolo] " .. p[2] .. " [" .. num .. "] : " .. tablelist(module._FREEACCESS, "", function(name, value)
								return value == num and name .. " ~ " or ""
							end), n)
						else
							p[3] = stringnick(p[3])
							tfm.exec.chatMessage("[#bolo] " .. p[3] .. " ~> " .. (module._FREEACCESS[p[3]] or 0),n)
						end
					end
				else
					tfm.exec.chatMessage("[#bolo] " .. p[2] .. " : " .. tablelist(tableturnTable(module["_" .. p[2]]),"\n",function(k,v)
						return v
					end),n)
				end
			else
				tfm.exec.chatMessage(stringformat("VERSION : %s\nNAME : %s\nSTATUS : %s\nAUTHOR : %s\n\nMODE : %s",module._VERSION,module._NAME,module._STATUS,module._AUTHOR,system.gameMode),n)
			end
			return
		end
		
		if p[1] == "modes" then
			local _modes = {}
			for k, v in next, mode do
				if k ~= module._NAME then
					_modes[#_modes + 1] = k
				end
			end
		
			tfm.exec.chatMessage(tablelist(_modes,"\n",function(k,v)
				return stringformat("~> /room #%s%s@%s#%s",module._NAME,mathrandom(0,999),n,v)
			end),n)
			return
		end

		if p[1] == "stop" and system.roomAdmins[n] then
			system.exit()
		end
		
		if p[1] == "admin" then
			tfm.exec.chatMessage("[#bolo] Room Admins : " .. tablelist(system.roomAdmins,", ",tostring),n)
			return
		end
		
		if p[1] == "adm" and p[2] and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 2)) then
			if tablefind({"true","false"},p[3]) then
				local pl = stringnick(p[2])
				system.roomAdmins[pl] = (not not module._FREEACCESS[pl]) or p[3] == "true" or nil
				eventChatCommand(n,"admin")
			end
			return
		end
		
		if p[1] == "setroomlanguage" and p[2] and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 2)) then
			if mode[system.gameMode].translations[p[2]] then
				system.roomLanguage = p[2]
				mode[system.gameMode].langue = system.roomLanguage
				tfm.exec.chatMessage("[#bolo] Language set to " .. mode[system.gameMode].langue)
			end
			return
		end
		
		if p[1] == "me" then
			local commands = {
				[0] = {"!modes"},
				[1] = {"!refresh (tribe house)","!setMisc [number] [refresh] (tribe house)","!room [number] (tribe house)","!load [mode] (tribe house)"},
				[2] = {"!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode] (tribe house)"},
				[3] = {"!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode]"}
			}
			
			local access = module._FREEACCESS[n] or 0
			
			if system.roomAdmins[n] then
				for k,v in next,{"!stop","!adm [playerName] [true/false]","!setRoomLanguage [language]"} do
					commands[access][#commands[access] + 1] = v
				end
			end
			
			tfm.exec.chatMessage(stringformat("@%s\nACCESS : %s\nROOM ADMIN : %s\n\n~> Commands: %s",n,access,tostring(not not system.roomAdmins[n]),tableconcat(commands[access],"; ")),n)
			return
		end
	end
end

--[[ RoomSettings ]]--
system.roomSettings = {
	[1] = {
		char = "@",
		execute = function(n)
			if n and #n > 2 then
				system.roomAdmins[stringnick(n)] = true
			end
		end
	},
	[2] = {
		char = "#",
		execute = function(name)
			if name then
				local game = system.getGameMode(name)
				if not game then
					system.gameMode = module._NAME
				end
			end
		end
	},
	[3] = {
		char = "*",
		execute = function(id)
			system.miscAttrib = tonumber(id) or 1
			system.miscAttrib = mathsetLim(system.miscAttrib,1,99)
		end
	},
	[4] = {
		char = "!",
		execute = function(langue)
			if langue and #langue > 0 then
				system.roomLanguage = stringlower(langue)
			end
		end
	},
}

system.setRoom = function()
	if system.isRoom and system.roomAttributes then
		for playerName in stringgmatch(system.roomAttributes, system.roomSettings[1].char .. "(%+?[a-zA-Z0-9_]+#%d%d%d%d)") do
			system.roomSettings[1].execute(playerName)
		end
	
		system.roomSettings[2].execute(stringmatch(system.roomAttributes, system.roomSettings[2].char .. "([%a_]+)"))
		
		local characters = tablelist(system.roomSettings, "", function(index, value) return value.char end, 3)
		for char, value in stringgmatch(system.roomAttributes, "([" .. characters .. "])([^" .. characters .. "]+)") do
			for id, setting in next, system.roomAttributes do
				if setting.char == char then
					setting.execute(stringgmatch(value, "%S+"))
		
					break
				end
			end
		end
		
		local officialModes = {
			{"vanilla","<VP>Enjoy your vanilla (: .. okno"},
			{"survivor","<R>Aw, you cannot play survivor on #grounds"},
			{"racing","<CH>Uh, racing? Good luck!"},
			{"music","<BV>Music? Nice choice! Why don't you try a rock'n'roll?"},
			{"bootcamp","<PT>Bootcamp? Ok. This is unfair and your data won't be saved out of the room."},
			{"defilante","<R>Aw, you cannot play defilante on #grounds"},
			{"village","<R>You cannot play village on #grounds. Please, change your room."},
		}
		for k, v in next, officialModes do
			if stringfind(stringlower(system.roomAttributes), v[1]) then
				system.officialMode = {v[1], v[2]}
				break
			end
		end
	end
end

--[[ Initialize ]]--
local _events = {}

local eventNames = {"eventLoop", "eventNewGame", "eventPlayerDied", "eventPlayerGetCheese", "eventPlayerVampire", "eventPlayerWon", "eventPlayerLeft", "eventEmotePlayed", "eventKeyboard", "eventMouse", "eventPopupAnswer", "eventTextAreaCallback", "eventChatCommand", "eventChatMessage", "eventSummoningStart", "eventSummoningEnd", "eventSummoningCancel", "eventNewPlayer", "eventPlayerRespawn", "eventColorPicked"}

local foo = function() end

system.init = function(refresh)
	_events = {}
	
	for _, event in next, eventNames do
		_events[event] = mode[system.gameMode][event] or foo
	end

	if refresh then
		if mode[system.gameMode].reset then
			mode[system.gameMode].reset()
		end
	end
	
	normalizeTranslation()
	mode[system.gameMode].init()

	tableforeach(tfm.get.room.playerList,eventNewPlayer)
end

for _, event in next, eventNames do
	_G[event] = function(...)
		if events[event] then
			events[event](...)
		end

		_events[event](...)
	end
end

system.setRoom()
system.init()