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