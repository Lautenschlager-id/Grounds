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
table.concat = function(list,sep,f,i,j)
	local txt = ""
	sep = sep or ""
	i,j = i or 1,j or #list
	for k,v in next,list do
		if type(k) ~= "number" and true or (k >= i and k <= j) then
			txt = txt .. (f and f(k,v) or v) .. sep
		end
	end
	return string.sub(txt,1,-1-#sep)
end
do
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
	
	local addTextArea = ui.addTextArea
	ui.addTextArea = function(id,...)
		addTextArea(id,...)
		if not system.objects.textarea[id] then
			system.objects.textarea[id] = true
		end
	end
	
	local chatMessage = tfm.exec.chatMessage
	tfm.exec.chatMessage = function(txt,n)
		txt = tostring(txt)
		if #txt > 1000 then
			local total = 0
			while #txt > total do
				chatMessage(string.sub(txt,total,total + 1000),n)
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
	return tfm.get.room.playerList[n] and string.sub(n,1,1) ~= "*" and tfm.get.room.playerList[n].registrationDate and (os.time() - (tfm.get.room.playerList[n].registrationDate or 0) >= 432e6) or false
end
system.players = function(alivePlayers)
	local alive,total = 0,0
	if alivePlayers then
		alive = {}
	end
	for k,v in next,tfm.get.room.playerList do
		if system.isPlayer(k) then
			if not v.isDead and not v.isVampire then
				if alivePlayers then
					alive[#alive + 1] = k
				else
					alive = alive + 1
				end
			end
			total = total + 1
		end
	end
	if alivePlayers then
		return alive
	else
		return alive,total
	end
end
	--[[ System ]]--
events = {}
currentTime,leftTime = 0,0
system.loadTable = function(s)
	-- "a.b.c.1" returns a[b][c][1]
	local list
	for tbl in string.gmatch(s,"[^%.]+") do
		tbl = tonumber(tbl) and tonumber(tbl) or tbl
		list = (list and list[tbl] or _G[tbl])
	end
	return list
end
system.getTranslation = function(index,n)
	local t = string.format("mode.%s.translations.%s.%s",system.gameMode,(n and mode[system.gameMode].info[n].langue or mode[system.gameMode].langue),index)
	return system.loadTable(t) or system.loadTable(string.gsub(t,"translations%..-%.",function() return "translations.en." end))
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
	iN = iN == nil and x or iN
	iP = iP == nil and x or iP
	return (x<0 and iN or iP)
end
math.percent = function(x,y,v)
	v = (v or 100)
	local m = x/y * v
	return math.min(m,v)
end
math.pythag = function(x1,y1,x2,y2,range)
	return (x1-x2)^2 + (y1-y2)^2 <= (range^2)
end
math.setLim = function(value,min,max)
	return math.max(min,math.min(max,value))
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
	--[[ String ]]--
string.split = function(value,pattern,f)
	local out = {}
	for v in string.gmatch(value,pattern) do
		out[#out + 1] = (f and f(v) or v)
	end
	return out
end
string.nick = function(player)
	return string.gsub(string.lower(player),"%a",string.upper,1)
end
string.trim = function(s)
	return (string.gsub(s,"^%s*(.-)%s*$","%1"))
end
	--[[ Table ]]--
table.find = function(list,value,index,f)
	for k,v in next,list do
		local i = (type(v) == "table" and index and v[index] or v)
		if (f and f(i) or i) == value then
			return true,k
		end
	end
	return false,0
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
	for k,v in next,list do
		out[k] = v
	end
	return out
end
	--[[ Others ]]--
deactivateAccents=function(str)
	local letters = {a = {"á","â","à","å","ã","ä"},e = {"é","ê","è","ë"},i = {"í","î","ì","ï"},o = {"ó","ô","ò","õ","ö"},u = {"ú","û","ù","ü"}}
	for k,v in next,letters do
		for i = 1,#v do
			str = string.gsub(str,v[i],tostring(k))
		end
	end
	return str
end
normalizeTime = function(time)
	return math.floor(time) + ((time - math.floor(time)) >= .5 and .5 or 0)
end
disableChatCommand = function(command,...)
	for k,v in next,{command,...} do
		system.disableChatCommandDisplay(v,true)
		system.disableChatCommandDisplay(string.lower(v),true)
		system.disableChatCommandDisplay(string.upper(v),true)
	end
end	
normalizeTranslation = function()
	local t = mode[system.gameMode].translations

	if not mode[system.gameMode].translations.pt then
		mode[system.gameMode].translations.pt = mode[system.gameMode].translations.br
	end
	
	if not mode[system.gameMode].languageIsSet then
		local p = {system.roomLanguage,tfm.get.room.community}
		for i = 1,#p do
			if mode[system.gameMode].translations[p[i]] then
				mode[system.gameMode].langue = p[i]
			end
		end
		
		mode[system.gameMode].languageIsSet = true
	end

	for k,v in next,t do
		if k ~= "en" then
			table.merge(v,t.en)
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
	--[[ XML ]]--
xml = {}
xml.parse = function(currentXml)
	currentXml = string.match(currentXml,"<P (.-)/>") or ""
	local out = {}
	for tag,_,value in string.gmatch(currentXml,"([%-%w]+)=([\"'])(.-)%2") do
		out[tag] = value
	end
	return out
end
xml.attribFunc = function(currentXml,funcs)
	local attributes = xml.parse(currentXml)
	for k,v in next,funcs do
		if attributes[v.attribute] then
			v.func(attributes[v.attribute])
		end
	end
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
		local axis,value = string.match(s,"(%a);(%d+)")
		value = tonumber(value)
		if value then
			if axis == "x" then x = value else y = value end
		end
		return x or 0,y or 0
	else
		local pos = {}
		for x,y in string.gmatch(s,"(%d+) ?, ?(%d+)") do
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
	YELLOW = 0xF9EC27,
	RED = 0xF94226,
	LIGHT_RED = 0xD1605D,
	BLUE = 0x34A4E5,
	DEEP_BLUE = 0x4F7F9A,
	DARK_BLUE = 0x2D80AF,
	GRAY = 0x969696,
	SALMON = 0xAC6C64,
	BROWN = 0x89635A,
	BEIGE = 0x937A53,
	TURQUOISE = 0x59D1C8,
	ROSE = 0x816669,
	MOSS_GREEN = 0x689636,
}
