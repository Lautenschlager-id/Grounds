local canColor = true
local modeName = modulePath:match("mode\\(.-)\\")
local isMode = true
if not modeName then
	isMode = false
	modeName = modulePath:match("src\\(.-)\\")
end

local fileExist = function(file)
	local f = io.open(file,"r")
	if f then
		f:close()
	end
	return f
end
local fileLines = function(file)
	local lines = {}
	for line in io.lines(file) do
		lines[#lines+1] = line
	end
	return table.concat(lines,"\n")
end

getFolder = function(folder)
	local files = io.popen("dir " .. modulePath..folder .. " /b")
	files = files:read("*a")

	local translation = isMode and folder == "Translations"
	local format = (isMode and translation) and "-- Translations\n\ttranslations = {\n%s\n\t},\n\tlangue = \"\"," or "%s"

	local chunk = {}
	if not translation then
		chunk[1] = "\t--[[ " .. folder .. " ]]--"
	end
	
	for file in files:gmatch("[^\n]+") do
		local fileName = file:find("@") and file:sub(5) or file
		fileName = fileName:sub(0,-5)
	
		chunk[#chunk + 1] = (translation and "" or ("\t-- " .. fileName .. "\n")) .. fileLines(modulePath.."\\"..folder.."\\"..file)
		
		io.write("> " .. folder..":"..fileName .. " loaded!\n")
	end
		
	return string.format(format,table.concat(chunk,"\n"))
end
getFile = function(file)
	local code
	
	local path = modulePath..file..".lua"
	
	if fileExist(path) then
		code = "--[[ " .. file .. " ]]--\n"
		
		code = code .. fileLines(path)
		io.write("> " .. file .. " loaded!\n")
	else
		code = "--[[ File " .. file .. " doesn't exist. ]]--\n"
		io.write("> " .. file .. " not found!\n")
		
		canColor = false
		os.execute("color 4F")
	end
	
	return "\t" .. code
end

getTree = function(moduleName)
	local code = ""
	for i = 1,#tree do
		code = code .. tree[i] .. "\n"
	end
	return isMode and string.format("mode.%s = {\n\t%s}",moduleName:lower(),code) or code
end
setFile = function()
	local path = modulePath .. "Debug\\Versions\\"
	
	local info = getTree(modeName)

	local file = io.open(path .. string.format("%s_%s_%s.lua",(isMode and "m" or "sys"),modeName,os.date("%y_%m_%d")),"w+")
	file:write(info)
	
	local cvFile = io.open(modulePath .. "CURRENTVERSION_"..modeName..".lua","w+")
	cvFile:write(info)
	
	file:flush()
	file:close()
	cvFile:flush()
	cvFile:close()
	
	if canColor then
		os.execute("color 2F")
	end
	io.write(modeName .. " updated!")
	os.execute("ping localhost >nul -n 4")
end

os.execute("title " .. modeName)