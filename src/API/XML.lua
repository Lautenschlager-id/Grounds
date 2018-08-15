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
