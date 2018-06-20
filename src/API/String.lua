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