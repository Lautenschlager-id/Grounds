	--[[ Control ]]--
system.newGameTimer = 0
system.officialMode = {"",""}
system.playerMessage = ""
system.setAdmins = function()
	local out = {}
	for k,v in next,module._FREEACCESS do
		if v > 2 then
			out[k] = true
		end
	end
	return out
end
	--[[ Improvements ]]--
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
	--[[ Room ]]--
system.isRoom = string.byte(tfm.get.room.name,2) ~= 3
system.roomAdmins = system.setAdmins()
system.miscAttrib = 0
system.roomNumber,system.roomAttributes = (function()
	if system.isRoom then
		local number,attribute = string.match(tfm.get.room.name,"%*?#"..module._NAME.."(%d+)(.*)")
		return tonumber(number) or 0,attribute or ""
	else
		return 0,""
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
events = {}
currentTime,leftTime = 0,0
system.loadTable = function(s)
	-- "a.b.c.1" returns a[b][c][1]
	local list
	for tbl in string.gmatch(s,"[^%.]+") do
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

system.looping = function(f,tick)
	local s = 1000 / tick
	local t = {}
	
	local fooTimer = function()
		t[#t+1] = system.newTimer(f,1000,true)
	end
	for timer = 0,1000 - s,s do
		system.newTimer(fooTimer,1000 + timer,false)
	end
	return t
end
	--[[ Interface ]]--
ui.banner = function(image,aX,aY,n,time)
	time = time or 5
	axis = axis or {100,100}
	
	local img = tfm.exec.addImage(image .. ".png","&0",aX,aY,n)
	system.newTimer(function()
		tfm.exec.removeImage(img)
	end,time * 1000,false)
end
	--[[ Math ]]--
math.isNegative = function(x,iN,iP)
	if x < 0 then
		return iN == nil and x or iN
	else
		return iP == nil and x or iP
	end
end
math.percent = function(x,y,v)
	v = v or 100
	local m = x/y * v
	return math.min(m,v)
end
math.pythag = function(x1,y1,x2,y2,range)
	return (x1-x2)^2 + (y1-y2)^2 <= (range^2)
end
math.setLim = function(value,min,max)
	return value < min and min or value > max and max or value -- math.max(min,math.min(max,value))
end
math.intersects = function(x1, y1, x2, y2, x3, y3)
	if x1 >= x2 and x1 <= x3 then
		if y1 >= y2 and y1 <= y3 then
			return true
		end
	end
	return false
end
math.minmax = function(a, b)
	if a > b then
		return a, b
	else
		return b, a
	end
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
	return (math.floor(x) + (x%1 > .5 and .5 or 0))
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
	
	return string.gsub(string.lower(player),"%a",string.upper,1)
end
string.trim = function(s)
	return (string.gsub(s,"^%s*(.-)%s*$","%1"))
end
	--[[ Table ]]--
table.find = function(list,value,index,f)
	for k,v in next,list do
		local i = (type(v) == "table" and index) and v[index] or v
		if (not f and i or f(i)) == value then
			return true, k
		end
	end
	return false, 0
end
table.turnTable = function(x)
	return (type(x)=="table" and x or {x})
end
table.random = function(t)
	return (type(t) == "table" and t[math.random(#t)] or math.random())
end
table.shuffle = function(t)
	local randomized = {}
	for v = 1,#t do
		table.insert(randomized,math.random(#randomized),t[v])
	end
	return randomized
end
table.merge = function(this,src)
	for k,v in next,src do
		if this[k] then
			if type(v) == "table" then
				this[k] = table.turnTable(this[k])
				table.merge(this[k],v)
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
	for k,v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end
	--[[ Others ]]--
deactivateAccents=function(str)
	local letters = {
		["a"] = {"á","à","â","ä","ã","å"},
		["e"] = {"é","è","ê","ë"},
		["i"] = {"í","ì","î","ï"},
		["o"] = {"ó","ò","ô","ö","õ"},
		["u"] = {"ú","ù","û","ü"},
		["c"] = {"ç"},
		["n"] = {"ñ"},
		["y"] = {"ý","ÿ"},
	}
	for k,v in next,letters do
		for i = 1,#v do
			str = string.gsub(str, v[i], tostring(k))
		end
	end
	return str
end
disableChatCommand = function(command,...)
	for k,v in next,{command,...} do
		system.disableChatCommandDisplay(v,true)
		system.disableChatCommandDisplay(string.lower(v),true)
		system.disableChatCommandDisplay(string.upper(v),true)
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
	number = string.gsub(number,"E(%d+)",function(cn) -- e5 = 00000
		return string.rep("0",tonumber(cn))
	end)
	number = string.gsub(string.reverse(number),"(...)",function(c)
		return c .. sep
	end)
	return string.reverse(number)
end
pairsByIndexes = function(list,f)
	local out = {}
	for index in next,list do
		out[#out + 1] = index
	end
	table.sort(out,f)
	
	local i = 0
	return function()
		i = i + 1
		if out[i] == nil then
			return nil
		else
			return out[i],list[out[i]]
		end
    end
end
	--[[ DataManager ]]--
dataManager = {}
dataManager.using = function(module, data)
	local self = {}	
	
	--[[ Tools ]]--
	local transform = function(value, dataType, reverse)
		if dataType == "number" then
			return reverse and (tostring(value)) or (tonumber(value) or 0)
		elseif dataType == "boolean" then
			return reverse and (value and "1" or "0") or (value == "1")
		elseif dataType == "table" then
			return reverse and (table.concat(value, "|")) or (string.split(value, "[^|]+", function(value)
				if value == "true" or value == "false" then
					return value == "true"
				end
				return tonumber(value) or tostring(value)
			end))
		else
			return tostring(value)
		end
	end
	
	local normalizeData = function(self, data)
		data = string.split(data, "[^~]+")
		local out = {}
		
		for k, v in next, self._data do
			local value = data[v.index]
			if value then
				if value == "nil" then
					value = v.default
				else
					value = transform(value, type(v.default))
				end
			end
			if type(value) == "nil" then
				value = v.default
			end
			
			out[v.name] = value
		end
		
		return out
	end

	local init = function(self, module, data)
		self._module = module
		self._data = {}
		self._players = {}
		
		local availableTypes = { number = true, string =  true, table = true, boolean = true }
		
		for k, v in next, data do
			if v.index and type(v.index) == "number" then
				if not self._data[v.index] then
					if v.default ~= nil and availableTypes[type(v.default)] then
						self._data[v.index] = {
							index = v.index,
							default = v.default,
							name = k
						}
					else
						error(string.format("parameter_index_%s:%s: The index 'default' does not exist or have not its value type available for this manager [number, string, table, boolean].", v.index, type(v.default)))
					end
				else
					error(string.format("parameter_index_%s: The index 'index' must be unique. There is already a value with this index.", v.index))
				end
			else
				error(string.format("parameter_%s: The index 'index' does not exist or is not a number.", k))
			end
		end
	end

	--[[ Managers ]]--
	self.struct = function(self, player, data)
		local hasData = false
		
		local garbage = data
		for Module, Data in string.gmatch(data, "%[(.-)%]%((.-)%)") do
			garbage = string.gsub(string.gsub(garbage, string.format("%%[%s%%]%%(.-%%)", Module), ""), "<INSERT_DATA>", "")
		
			if Module == self._module then
				hasData = true
				
				local raw = string.gsub(data, string.format("%%[%s%%]%%(.-%%)", Module), "<INSERT_DATA>")
				self._players[player] = setmetatable({_GARBAGE = {"", false}, data = normalizeData(self, Data)},{
					__call = function(playerTable, single)
						local out = {}
						for k, v in next, self._data do
							out[#out + 1] = transform(self._players[player].data[v.name], type(self._players[player].data[v.name]), true)
						end
						
						local out =  string.format("[%s](%s)", self._module, table.concat(out, "~"))
						if single then
							return out
						else
							raw = string.gsub(raw, playerTable._GARBAGE[2] and playerTable._GARBAGE[1] or "", "", 1)
							return string.gsub(raw, "<INSERT_DATA>", out)
						end
					end
				})
			end
		end

		if hasData then
			garbage = string.gsub(garbage, "[%^%$%(%)%%%[%]%?%*%+%-]", "%%%1")
			self._players[player]._GARBAGE[1] = garbage
		else
			return self:struct(player, data .. string.format("[%s](nil)", self._module))
		end
		
		return not not self._players[player]
	end
	
	self.getData = function(self, player, index)
		if self._players[player] then
			if index then
				if self._players[player].data[index] ~= nil then
					return self._players[player].data[index]
				else
					return { error = string.format("getData_ The index '%s' does not exist.", index) }
				end
			else
				return self._players[player]()
			end
		else
			return { error = string.format("getData_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	self.setValue = function(self, player, values, save)
		if self._players[player] then
			local updated = false
			for k, v in next, values do
				if self._players[player].data[k] ~= nil and type(v) == type(self._players[player].data[k]) then
					if not updated then
						updated = true
					end
					
					self._players[player].data[k] = v
				end
			end
			
			if updated then
				local out = self._players[player]()
				if save then
					self:save(player, out)
				end
				return out
			else
				return { error = string.format("setValue_ The values '%s' do not exist.", table.concat(values, " ~ ", tostring)) }
			end
		else
			return { error = string.format("setValue_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	self.save = function(self, player, data)
		if player then
			system.savePlayerData(player, data or self._players[player]())
			return true
		else
			return false
		end
	end
	
	self.garbage = function(self, player, remove)
		if self._players[player] then
			local garbage = self._players[player]._GARBAGE[1]
			if remove then
				self._players[player]._GARBAGE[2] = true
				self:save(player)
				self._players[player]._GARBAGE[1] = ""
			end
			return garbage, self._players[player]._GARBAGE[2]
		else
			return { error = string.format("garbage_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	init(self, module, data)
	return self
end
dataManager.delete = function(module, data)
	for Module, Data in string.gmatch(data, "%[(.-)%]%((.-)%)") do
		local mod = module
		if type(module) == "table" then
			local found, index = table.find(module, Module)
			if found then
				mod = module[index]
			end
		end
		if Module == mod then
			data = string.gsub(data, string.format("%%[%s%%]%%(.-%%)", Module), "")
		end
	end
	return data
end
	--[[ XML ]]--
xml = {}
xml.parse = function(currentXml)
	currentXml = string.match(currentXml,"<P (.-)/>") or ""
	local out = {}
	for tag,_,value in string.gmatch(currentXml,"([%-%w]+)=([\"'])(.-)%2") do
		out[tag] = value
	end
	return out, currentXml
end
xml.attribFunc = function(currentXml,funcs)
	local attributes, properties = xml.parse(currentXml)
	for k,v in next,funcs do
		if attributes[v.attribute] then
			v.func(attributes[v.attribute])
		end
	end
	return properties
end
xml.addAttrib = function(currentXml,out,launch)
	local parameters = string.match(currentXml,"<P (.-)/>") or ""
	for k,v in next,out do
		if not string.find(parameters,v.tag) then
			currentXml = string.gsub(currentXml,"<P (.-)/>",function(attribs)
				return string.format("<P %s=\"%s\" %s/>",v.tag,v.value,attribs)
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
	if string.find(s,";") then
		local x,y
		local axis,value = string.match(s,"(%a);(%-?%d+)")
		value = tonumber(value)
		if value then
			if axis == "x" then x = value else y = value end
		end
		return x or 0,y or 0
	else
		local pos = {}
		for x,y in string.gmatch(s,"(%-?%d+) ?, ?(%-?%d+)") do
			pos[#pos+1] = {x = x,y = y}
		end
		return pos
	end
end
	--[[ Color ]]--
color = {
	hexToRgb = function(hex)
		local h = string.format("%06x",hex)
		return tonumber("0x"..string.sub(h,1,2)),tonumber("0x"..string.sub(h,3,4)),tonumber("0x"..string.sub(h,5,6))
	end,
	rgbToHsl = function(r,g,b)
		r,g,b = r/255,g/255,b/255

		local max,min = math.max(r,g,b),math.min(r,g,b)
		local h,s,l

		h = (max + min) / 2
		s,l = h,h

		if max == min then
			h,s = 0,0
		else
			local d = max - min
			
			local s = l > .5 and (d/(2 - max - min)) or (d/(max + min))
			
			if max == r then
				h = (g-b)/d
				if g < b then
					h = h + 6
				end
			elseif max == g then
				h = (b-r)/d + 2
			elseif max == b then
				h = (r-g)/d + 4
			end
			h = h/6
		end

		return {h=h,s=s,l=l}
	end,
	hslToRgb = function(h,s,l)
		local r,g,b

		if s == 0 then
			r,g,b = l,l,l
		else
			local hueToRgb = function(p,q,t)
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
					return p + (q - p) * (2/3 - t) * 6
				end
				return p
			end

			local q = l < .5 and (l * (1 + s)) or (l + s - l * s)
			local p = 2 * l - q

			r = hueToRgb(p,q,h + 1/3)
			g = hueToRgb(p,q,h)
			b = hueToRgb(p,q,h - 1/3)
		end

		return r * 255,g * 255,b * 255
	end,
	rgbToHex = function(r,g,b)
		return tonumber(string.format('%02x%02x%02x',r,g,b),16)
	end,

	AntiqueWhite = 0xFAEBD7,
	Aqua = 0x00FFFF,
	Aquamarine = 0x7FFFD4,
	Azure = 0xF0FFFF,
	Beige = 0xF5F5DC,
	Bisque = 0xFFE4C4,
	Black = 0x000000,
	BlanchedAlmond = 0xFFEBCD,
	Blue = 0x0000FF,
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
	Cyan = 0x00FFFF,
	DarkBlue = 0x00008B,
	DarkCyan = 0x008B8B,
	DarkGoldenrod = 0xB8860B,
	DarkGray = 0xA9A9A9,
	DarkGreen = 0x006400,
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
	DarkTurquoise = 0x00CED1,
	DarkViolet = 0x9400D3,
	DeepPink = 0xFF1493,
	DeepSkyBlue = 0x00BFFF,
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
	Green = 0x008000,
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
	Lime = 0x00FF00,
	LimeGreen = 0x32CD32,
	Linen = 0xFAF0E6,
	Magenta = 0xFF00FF,
	Maroon = 0x800000,
	MediumAquamarine = 0x66CDAA,
	MediumBlue = 0x0000CD,
	MediumOrchid = 0xBA55D3,
	MediumPurple = 0x9370DB,
	MediumSeaGreen = 0x3CB371,
	MediumSlateBlue = 0x7B68EE,
	MediumSpringGreen = 0x00FA9A,
	MediumTurquoise = 0x48D1CC,
	MediumVioletRed = 0xC71585,
	MidnightBlue = 0x191970,
	MintCream = 0xF5FFFA,
	MistyRose = 0xFFE4E1,
	Moccasin = 0xFFE4B5,
	NavajoWhite = 0xFFDEAD,
	Navy = 0x000080,
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
	SpringGreen = 0x00FF7F,
	SteelBlue = 0x4682B4,
	Tan = 0xD2B48C,
	Teal = 0x008080,
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
