-- Initially based on Jordynl19#Pokelua repository
local modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)builder.lua")

menu = {
	display = function(id)
		os.execute("cls")
		io.write("Insert the number according to the needed option.\n")
		for k,v in next,menu[id].options do
			io.write(string.format("\t%s. %s\n",k,v))
		end
		io.write(">> ")
		return io.read()
	end,
	get = function(id)
		local option
		repeat
			option = tonumber(menu.display(id)) or 0
		until option > 0 and option <= #menu[id].options
		
		if menu[id].func then
			menu[id].func(option)
		end
		
		return option
	end,
	[1] = {
		options = {
			"Update all modes",
			"Update specific modes",
			"Skip modes updating",
			"Exit",
		},
		func = function(option)
			if option < 3 then
				if option == 1 then
					local files = io.popen("dir " .. modulePath.."src\\mode" .. " /b")
					files = files:read("*a")

					for file in files:gmatch("[^\n]+") do
						os.execute("start ".. modulePath.."src\\mode\\"..file.."\\Debug\\combine.lua")
					end
					io.write("Submodes updated!")
				elseif option == 2 then
					local updating = true
					while updating do
						local modeName
						repeat
							io.write("Enter mode name: ")
							modeName = io.read()
						until #modeName > 0

						os.execute("start ".. modulePath.."src\\mode\\"..modeName:sub(2).."\\Debug\\combine.lua")
						
						local answer
						repeat
							io.write("Update new mode? (y/n): ")
							answer = io.read():lower()
						until answer == "y" or answer == "n"
						
						if answer == "n" then
							updating = false
						end
					end
				end
				io.write("\nUpdated!")
				os.execute("ping localhost >nul -n 4")
			elseif option == #menu[1].options then
				os.exit()
			end
		end,
	},
	[2] = {
		options = {
			"Use Optimization",
			"Remove commentaries",
			"Use Optimization and remove commentaries",
			"Nothing",
		},
	},
	[3] = {
		options = {
			"Update Components",
			"Skip components updating",
		},
		func = function(option)
			if option == 1 then
				os.execute("start ".. modulePath.."src\\API\\Debug\\combine.lua")
				os.execute("start ".. modulePath.."src\\Events\\Debug\\combine.lua")
				io.write("Updated!")
				os.execute("ping localhost >nul -n 4")
			end
		end
	},
	[4] = {
		options = {
			"Combine Tree",
			"Use Maintenance Mode",
			"Use Combine Builder",
			"Set Modes",
			"Exit",
		},
		func = function(option)
			if option == #menu[4].options then
				os.exit()
			end
		end
	},
}

local update = menu.get(1)
local settings = menu.get(2)
local component = menu.get(3)
local option = menu.get(4)

local script = {}
if settings == 1 or settings == 4 then
	script[1] = "--Creator: Bolodefchoco\n--Made in: 06/02/2017\n--Last update: " .. os.date("%d/%m/%Y")
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
local getFile = function(file,d)
	local m = 0
	if file == "#" then
		m = 1
		if (settings == 1 --[[or settings == 3]]) then
			file = "Optimization"
			m = 2
		end
	end

	local code = ""
	
	local fileName = tostring(file:match("%P+$"))
	
	local path = modulePath.."src\\"..(d and file.."\\CURRENTVERSION_" or "")..fileName..".lua"
	
	if fileExist(path) then
		code = "--[[ " .. fileName .. " ]]--\n"
		
		code = code .. fileLines(path)
		io.write("> " .. fileName .. " loaded!\n")
	else
		if m ~= 1 then
			code = "--[[ File " .. fileName .. " doesn't exist. ]]--\n"
			io.write("> " .. file .. " not found!\n")
		end
	end
	
	return code
end

construct = setmetatable({true,true,true,true},{
	__call = function()
		for id,chunk in next,construct[option] do
			if (settings == 1 --[[or settings == 3]]) and chunk[1] ~= "Optimization" then
				chunk[2] = chunk[2]:gsub("string%.","string")
				chunk[2] = chunk[2]:gsub("math%.","math")
				chunk[2] = chunk[2]:gsub("table%.","table")
				io.write("[" .. tostring(chunk[1]:match("%P+$")) .. "] Optmized!\n")
			end
			--[[ if (settings == 2 or settings == 3) then
				chunk[2] = chunk[2]:gsub("%-%-%[=*%[.*%]=*%]%-*","")
				chunk[2] = chunk[2]:gsub("%-%-%.*\n","")
				io.write("[" .. chunk[1] .. "] Cleared!\n")
			end ]]
			
			script[#script + 1] = chunk[2]
			io.write(string.format("[%s] %s",id,tostring(chunk[1]:match("%P+$"))) .. " written!\n")
		end
		
		local buildFile = string.format("%s\\versions\\Grounds_%s.lua",modulePath,os.date("%y_%m_%d")) 
		local file = io.open(buildFile,"w")
		file:write(table.concat(script,"\n\n"))
		file:flush()
		
		io.write("File created!\n")
		
		file:close()
		
		io.read()
	end
})
construct[1] = setmetatable({
	"Module"	,
	"#",
	"@API",
	"GameMode",
	"Modes",
	"@mode\\Grounds",
	"@mode\\Jokenpo",
	"@mode\\Click",
	"@mode\\Presents",
	"@mode\\Chat",
	"@mode\\Xmas",
	"@mode\\Godmode",
	"@mode\\Sharpie",
	"@mode\\Universe",
	"@mode\\Dev",
	"@mode\\Chess",
	"ModeChanged",
	"@Events",
	"RoomSettings",
	"Initialize",	
},{
	__call = function(this)
		for i = 1,#this do
			if this[i] == "#" then
				if (settings == 1 --[[or settings == 3]]) then
					this[i] = "Optimization"
				end
			end
			
			local d = not not this[i]:find("@")
			this[i] = {this[i],getFile(this[i]:sub(d and 2 or 1),d)}
		end
	end
})
construct[2] = setmetatable({
	"Module",
	"#",
	"Maintenance",
},getmetatable(construct[1]))
construct[3] = setmetatable({},{
	__call = function(this)
		local files = true
		while files do
			local fileName
			repeat
				io.write("Enter file name: ")
				fileName = io.read()
			until #fileName > 0
			
			if fileName == "#" then
				if (settings == 1 --[[or settings == 3]]) then
					fileName = "Optimization"
				end
			end
			
			local d = not not fileName:find("@")
			this[#this+1] = {fileName,getFile(fileName:sub(d and 2 or 1),d)}
			
			local answer
			repeat
				io.write("Continue? (y/n): ")
				answer = io.read():lower()
			until answer == "y" or answer == "n"
			
			if answer == "n" then
				files = false
			end
		end
	end
})
construct[4] = setmetatable({
	"Module",
	"#",
	"@API",
	"GameMode",
	"Modes",
	
	"ModeChanged",
	"@Events",
	"RoomSettings",
	"Initialize"
},{
	__call = function(this)
		for i = 1,#this do
			if this[i] == "#" then
				if (settings == 1 --[[or settings == 3]]) then
					this[i] = "Optimization"
				end
			end
			
			local d = not not this[i]:find("@")
			this[i] = {this[i],getFile(this[i]:sub(d and 2 or 1),d)}
		end

		local files = true
		while files do
			local modeName
			repeat
				io.write("Enter mode name: ")
				modeName = io.read()
			until #modeName > 0

			table.insert(this,#this - 3,{modeName,getFile("mode\\"..modeName:sub(2),true)})
			
			local answer
			repeat
				io.write("Continue? (y/n): ")
				answer = io.read():lower()
			until answer == "y" or answer == "n"
			
			if answer == "n" then
				files = false
			end
		end
	end
})

construct[option]()
construct()	