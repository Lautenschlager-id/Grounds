	--[[ eventLoop ]]--
events.eventLoop = function(currentTime,leftTime)
	_G.currentTime = math.round(currentTime / 1e3)
	_G.leftTime = math.round(leftTime / 1e3)
end
	--[[ eventNewPlayer ]]--
events.eventNewPlayer = function(n)
	tfm.exec.lowerSyncDelay(n)
	
	if system.officialMode[2] ~= "" then
		tfm.exec.chatMessage(system.officialMode[2],n)
	end
end
	--[[ eventChatCommand ]]--
do
	local cfg_caching = true

	local floor,modf = math.floor,math.modf
	local char,format,rep = string.char,string.format,string.rep

	local function bytes_to_w32 (a,b,c,d) return a*0x1000000+b*0x10000+c*0x100+d end
	local function w32_to_bytes (i)
		return floor(i/0x1000000)%0x100,floor(i/0x10000)%0x100,floor(i/0x100)%0x100,i%0x100
	end

	local function w32_rot (bits,a)
		local b2 = 2^(32-bits)
		local a,b = modf(a/b2)
		return a+b*b2*(2^(bits))
	end

	local function cache2arg (fn)
		if not cfg_caching then return fn end
		local lut = {}
		for i=0,0xffff do
			local a,b = floor(i/0x100),i%0x100
			lut[i] = fn(a,b)
		end
		return function (a,b)
			return lut[a*0x100+b]
		end
	end

	local function byte_to_bits (b)
		local b = function (n)
			local b = floor(b/n)
			return b%2==1
		end
		return b(1),b(2),b(4),b(8),b(16),b(32),b(64),b(128)
	end

	local function bits_to_byte (a,b,c,d,e,f,g,h)
		local function n(b,x) return b and x or 0 end
		return n(a,1)+n(b,2)+n(c,4)+n(d,8)+n(e,16)+n(f,32)+n(g,64)+n(h,128)
	end

	local function bits_to_string (a,b,c,d,e,f,g,h)
		local function x(b) return b and "1" or "0" end
		return ("%s%s%s%s %s%s%s%s"):format(x(a),x(b),x(c),x(d),x(e),x(f),x(g),x(h))
	end

	local function byte_to_bit_string (b)
		return bits_to_string(byte_to_bits(b))
	end

	local function w32_to_bit_string(a)
		if type(a) == "string" then return a end
		local aa,ab,ac,ad = w32_to_bytes(a)
		local s = byte_to_bit_string
		return ("%s %s %s %s"):format(s(aa):reverse(),s(ab):reverse(),s(ac):reverse(),s(ad):reverse()):reverse()
	end

	local band = cache2arg (function(a,b)
		local A,B,C,D,E,F,G,H = byte_to_bits(b)
		local a,b,c,d,e,f,g,h = byte_to_bits(a)
		return bits_to_byte(
			A and a, B and b, C and c, D and d,
			E and e, F and f, G and g, H and h)
	end)

	local bor = cache2arg(function(a,b)
		local A,B,C,D,E,F,G,H = byte_to_bits(b)
		local a,b,c,d,e,f,g,h = byte_to_bits(a)
		return bits_to_byte(
			A or a, B or b, C or c, D or d,
			E or e, F or f, G or g, H or h)
	end)

	local bxor = cache2arg(function(a,b)
		local A,B,C,D,E,F,G,H = byte_to_bits(b)
		local a,b,c,d,e,f,g,h = byte_to_bits(a)
		return bits_to_byte(
			A ~= a, B ~= b, C ~= c, D ~= d,
			E ~= e, F ~= f, G ~= g, H ~= h)
	end)

	local function bnot (x)
		return 255-(x % 256)
	end

	local function w32_comb(fn)
		return function (a,b)
			local aa,ab,ac,ad = w32_to_bytes(a)
			local ba,bb,bc,bd = w32_to_bytes(b)
			return bytes_to_w32(fn(aa,ba),fn(ab,bb),fn(ac,bc),fn(ad,bd))
		end
	end

	local w32_and = w32_comb(band)
	local w32_xor = w32_comb(bxor)
	local w32_or = w32_comb(bor)

	local function w32_xor_n (a,...)
		local aa,ab,ac,ad = w32_to_bytes(a)
		for i=1,select('#',...) do
			local ba,bb,bc,bd = w32_to_bytes(select(i,...))
			aa,ab,ac,ad = bxor(aa,ba),bxor(ab,bb),bxor(ac,bc),bxor(ad,bd)
		end
		return bytes_to_w32(aa,ab,ac,ad)
	end

	local function w32_or3 (a,b,c)
		local aa,ab,ac,ad = w32_to_bytes(a)
		local ba,bb,bc,bd = w32_to_bytes(b)
		local ca,cb,cc,cd = w32_to_bytes(c)
		return bytes_to_w32(
			bor(aa,bor(ba,ca)), bor(ab,bor(bb,cb)), bor(ac,bor(bc,cc)), bor(ad,bor(bd,cd))
		)
	end

	local function w32_not (a)
		return 4294967295-(a % 4294967296)
	end

	local function w32_add (a,b) return (a+b) % 4294967296 end

	local function w32_add_n (a,...)
		for i=1,select('#',...) do
			a = (a+select(i,...)) % 4294967296
		end
		return a
	end
	local function w32_to_hexstring (w) return format("%08x",w) end

	function sha1(msg)
		local H0,H1,H2,H3,H4 = 0x67452301,0xEFCDAB89,0x98BADCFE,0x10325476,0xC3D2E1F0
		local msg_len_in_bits = #msg * 8

		local first_append = char(0x80)

		local non_zero_message_bytes = #msg +1 +8 
		local current_mod = non_zero_message_bytes % 64
		local second_append = current_mod>0 and rep(char(0), 64 - current_mod) or ""

		local B1, R1 = modf(msg_len_in_bits  / 0x01000000)
		local B2, R2 = modf( 0x01000000 * R1 / 0x00010000)
		local B3, R3 = modf( 0x00010000 * R2 / 0x00000100)
		local B4	  =	0x00000100 * R3

		local L64 = char( 0) .. char( 0) .. char( 0) .. char( 0)
					.. char(B1) .. char(B2) .. char(B3) .. char(B4)

		msg = msg .. first_append .. second_append .. L64

		assert(#msg % 64 == 0)

		local chunks = #msg / 64

		local W = { }
		local start, A, B, C, D, E, f, K, TEMP
		local chunk = 0

		while chunk < chunks do
			start,chunk = chunk * 64 + 1,chunk + 1

			for t = 0, 15 do
				W[t] = bytes_to_w32(msg:byte(start, start + 3))
				start = start + 4
			end

			for t = 16, 79 do
				W[t] = w32_rot(1, w32_xor_n(W[t-3], W[t-8], W[t-14], W[t-16]))
			end

			A,B,C,D,E = H0,H1,H2,H3,H4

			for t = 0, 79 do
				if t <= 19 then
					f = w32_or(w32_and(B, C), w32_and(w32_not(B), D))
					K = 0x5A827999
				elseif t <= 39 then
					f = w32_xor_n(B, C, D)
					K = 0x6ED9EBA1
				elseif t <= 59 then
					f = w32_or3(w32_and(B, C), w32_and(B, D), w32_and(C, D))
					K = 0x8F1BBCDC
				else
					f = w32_xor_n(B, C, D)
					K = 0xCA62C1D6
				end

				A,B,C,D,E = w32_add_n(w32_rot(5, A), f, E, W[t], K),
					A, w32_rot(30, B), C, D
			end
			H0,H1,H2,H3,H4 = w32_add(H0, A),w32_add(H1, B),w32_add(H2, C),w32_add(H3, D),w32_add(H4, E)
		end
		local f = w32_to_hexstring
		return f(H0) .. f(H1) .. f(H2) .. f(H3) .. f(H4)
	end

	local function hex_to_binary(hex)
		return hex:gsub('..', function(hexval)
			return string.char(tonumber(hexval, 16))
		end)
	end

	function sha1_binary(msg)
		return hex_to_binary(sha1(msg))
	end

	local xor_with_0x5c = {}
	local xor_with_0x36 = {}
	for i=0,0xff do
		xor_with_0x5c[char(i)] = char(bxor(i,0x5c))
		xor_with_0x36[char(i)] = char(bxor(i,0x36))
	end

	local blocksize = 64

	function hmac_sha1(key, text)
		assert(type(key)  == 'string', "key passed to hmac_sha1 should be a string")
		assert(type(text) == 'string', "text passed to hmac_sha1 should be a string")

		if #key > blocksize then
			key = sha1_binary(key)
		end

		local key_xord_with_0x36 = key:gsub('.', xor_with_0x36) .. string.rep(string.char(0x36), blocksize - #key)
		local key_xord_with_0x5c = key:gsub('.', xor_with_0x5c) .. string.rep(string.char(0x5c), blocksize - #key)

		return sha1(key_xord_with_0x5c .. sha1_binary(key_xord_with_0x36 .. text))
	end

	function hmac_sha1_binary(key, text)
		return hex_to_binary(hmac_sha1(key, text))
	end

	local hash_key = "0k=[yR>4kk9:DUzt;Pb;"
	
	_HASH = function(name)
		return sha1(name .. hash_key)
	end
end

events.eventChatCommand = function(n,c)
	if system.isPlayer(n) then
		system.disableChatCommandDisplay(c,true)
		
		local p = string.split(c,"[^%s]+",string.lower)
		disableChatCommand(p[1])
	
		if module._FREEACCESS[n] then
			if p[1] == "refresh" and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				tfm.exec.chatMessage("[#bolo] Refreshing the module...")
				eventModeChanged()
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
				system.miscAttrib = math.setLim(system.miscAttrib,0,99)
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
			p[2] = string.upper(p[2] or "")
			
			if module["_" .. p[2]] then
				if p[2] == "FREEACCESS" then
					if p[3] then
						local num = tonumber(p[3])
						if num then
							num = math.setLim(num, 1, 3)
							local lastValue = num
							
							tfm.exec.chatMessage("[#bolo] " .. p[2] .. " [" .. num .. "] : " .. table.concat(module._FREEACCESS, "", function(name, value)
								return value == num and name .. " ~ " or ""
							end), n)
						else
							p[3] = string.nick(p[3])
							tfm.exec.chatMessage("[#bolo] " .. p[3] .. " ~> " .. (module._FREEACCESS[p[3]] or 0),n)
						end
					end
				else
					tfm.exec.chatMessage("[#bolo] " .. p[2] .. " : " .. table.concat(table.turnTable(module["_" .. p[2]]),"\n",function(k,v)
						return v
					end),n)
				end
			else
				tfm.exec.chatMessage(string.format("VERSION : %s\nNAME : %s\nSTATUS : %s\nAUTHOR : %s\n\nMODE : %s",module._VERSION,module._NAME,module._STATUS,module._AUTHOR,system.gameMode),n)
			end
			return
		end
		
		if p[1] == "modes" then
			tfm.exec.chatMessage(table.concat({table.unpack(system.submodes,2)},"\n",function(k,v)
				return string.format("~> /room #%s%s@%s#%s",module._NAME,math.random(0,999),n,v)
			end),n)
			return
		end

		if p[1] == "stop" and system.roomAdmins[n] then
			system.exit()
		end
		
		if p[1] == "admin" then
			tfm.exec.chatMessage("[#bolo] Room Admins : " .. table.concat(system.roomAdmins,", ",tostring),n)
			return
		end
		
		if p[1] == "adm" and p[2] and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 2)) then
			if table.find({"true","false"},p[3]) then
				local pl = string.nick(p[2])
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
				[0] = {"!hash"},
				[1] = {"!hash","!refresh (tribe house)","!setMisc [number] [refresh] (tribe house)","!room [number] (tribe house)","!load [mode] (tribe house)"},
				[2] = {"!hash","!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode] (tribe house)"},
				[3] = {"!hash [name]","!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode]"}
			}
			
			local access = module._FREEACCESS[n] or 0
			
			if system.roomAdmins[n] then
				for k,v in next,{"!stop","!adm [playerName] [true/false]","!setRoomLanguage [language]"} do
					commands[access][#commands[access] + 1] = v
				end
			end
			
			tfm.exec.chatMessage(string.format("@%s\nACCESS : %s\nROOM ADMIN : %s\n\n~> Commands: %s",n,access,tostring(not not system.roomAdmins[n]),table.concat(commands[access],"; ")),n)
			return
		end

		if p[1] == "hash" then
			p[2] = (module._FREEACCESS[n] and module._FREEACCESS[n] > 2) and (p[2] or n) or n
			p[2] = string.nick(p[2])
		
			tfm.exec.chatMessage(string.format("\n\n<p align='center'><font size='20'><J>MICE CLAN\nACCOUNT VERIFICATION\n</J></font></p><p align='left'><font size='12'><PT>Yay! So you want to join us on Mice Clan!!!\n\nYour pretty hash is : <ROSE><B>%s</B></ROSE></PT></p></font>\n\n", _HASH(p[2])), n)
		end
	end
end
