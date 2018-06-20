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
	langue = "en",
	languageIsSet = false,
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
				{"Yellow Dwarf",{color.YELLOW},"40:100"},
				{"Red Dwarf",{color.RED},"40:100"},
				{"Red Giant",{color.RED},"80:160"},
				{"Blue Giant",{color.BLUE},"80:160"},
				{"Supergiant",{color.YELLOW,color.RED,color.BLUE},"80:160"},
				{"White Dwarf",{color.GRAY},"30:60"},
				{"Brown Dwarf",{color.BROWN},"30:60"},
			},
			planet = {
				--[[
					Name;
					Color accuracy;
					Size range;
					Lifeable;
					Queue Limit (where positive = not > x ; negative = not < abs(x) and 0 is free)
				]]
				{"Chthonian",{color.BROWN,color.TURQUOISE,color.BEIGE},"15:35",false,2},
				{"Gas Dwarf",{color.GRAY,color.BEIGE,color.TURQUOISE,color.LIGHT_RED},"20:30",false,-2},
				{"Gas Giant",{color.GRAY,color.BEIGE,color.TURQUOISE,color.LIGHT_RED},"25:60",false,-2},
				{"Ice Giant",{color.DEEP_BLUE,color.TURQUOISE,color.DARK_BLUE},"20:45",false,-3},
				{"Iron",{color.GRAY,color.BEIGE,color.ROSE},"15:25",true,0},
				{"Sillicate",{color.BEIGE,color.ROSE,color.MOSS_GREEN,color.DARK_BLUE},"20:30",true,0},
				{"Telluric",{color.BEIGE,color.ROSE,color.MOSS_GREEN,color.DARK_BLUE},"15:35",true,0},
				{"Dwarf",{color.GRAY,color.BEIGE},"5:12",true,-1},				
			},
			moon = {
				--[[
					Name;
					Color accuracy;
					Size range
				]]
				{"Asteroid",{color.GRAY},"5:8"},
				{"Irregular Asteroid",{color.GRAY,color.BEIGE},"2:6"},
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
		for i = string.byte("A"),string.byte("Z") do -- Letters
			k = k .. string.format(key,i,string.char(i))
		end
		
		k = k .. "\n"
		
		for i = string.byte("0"),string.byte("9") do -- Numbers
			k = k .. string.format(key,i,string.char(i))
		end
		
		k = k .. "\n"
		
		for i,j in next,{string.byte("-_",1,2)} do -- Characters
			k = k .. string.format(key,j,string.char(j))
		end
    
		return k
	end,
	-- Monochromatic
	paletteMonochromatic = function(hex,amount,period,reversed)
		local hsl = color.rgbToHsl(color.hexToRgb(hex))
		
		local colors = {}
		
		local final = 1
		if reversed then
			final = hsl.l - amount
			period = -period
		end
		
		for i = hsl.l,final,period do
			colors[#colors+1] = color.rgbToHex(color.hslToRgb(hsl.h,hsl.s,i))
			
			amount = amount - 1
			if amount == 0 then
				break
			end
		end
		
		if reversed then
			table.remove(colors,1)
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
		local min,max = string.match(range,"(%-?%d+):(%-?%d+)")
		min,max = tonumber(min),tonumber(max)
		
		if mode.universe.info[n].settings[id][1] == -math.huge then
			mode.universe.info[n].settings[id][1] = math.ceil((min+max)/2)
		else
			mode.universe.info[n].settings[id][1] = math.setLim(mode.universe.info[n].settings[id][1],min,max)
		end
		
		limit = limit or 10
		increment = string.gsub(tostring(increment or 1),"%.","%%s")
		mode.universe.info[n].settings[id][2] = math.setLim(mode.universe.info[n].settings[id][2],.1,limit)

		mode.universe.uinew(10,"<p align='center'><font size='20'><V><B>"..string.upper(id).."</B><font size='7'>\n\n<font size='12'><p align='left'><J><a href='event:counter."..id..".submit'>SUBMIT</a>"..string.rep(mode.universe.tab,3).."<PT><a href='event:counter."..id..".add."..increment.."'><B>+</B></a>  <J>" .. mode.universe.info[n].settings[id][2] .. "  <R><a href='event:counter."..id..".sub."..increment.."'><B>-</B></a>\n\n\n<p align='center'><font size='16'><S><a href='event:item."..id..".add'>▲</a>&nbsp;&nbsp;<PS>" ..  mode.universe.info[n].settings[id][1] .. "&nbsp;&nbsp;<S><a href='event:item."..id..".sub'>▼</a>",n,400,200,180,130,true)
	end,
	-- items
	uiitems = function(text,n,h)
		mode.universe.uinew(10,text,n,400,200,180,h or 180,true)
	end,
	-- keyboard
	uikeyboard = function(id,str,n)
		mode.universe.uinew(10,table.concat(system.getTranslation("buttons.keyboard"),"\n",function(k,v)
			return string.format("<%s><a href='event:keyboard.%s.%s'>%s</a>",k==1 and "J" or "R",id,v,string.upper(v))
		end) .. "\n\n<p align='center'><PT>" .. string.gsub(mode.universe.keyboard,"@",id) .. "\n\n<font size='15'><T>" .. table.concat(str),n,400,200,320,150,true)
	end,
	-- palette
	uipaletteMono = function(hex,n)
		mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] < 1 and #hex or mode.universe.info[n].settings.palette[1] > #hex and 1 or mode.universe.info[n].settings.palette[1]

		local darker = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,true)
		local lighter = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,false)

		local colors = setmetatable(darker,mode.universe.meta.add)
		colors = colors + lighter
		table.sort(colors)

		local div = mode.universe.tab .. "<BL>|<V>" .. mode.universe.tab
		mode.universe.uinew(10,string.format("<font size='11'><V><a href='event:palette.left'>« %s</a>%s<a href='event:palette.right'>%s »</a>%s<a href='event:palette.exit'>%s</a>",system.getTranslation("color.previous"),div,system.getTranslation("color.next"),div,system.getTranslation("exit")),n,400,200,450,80,true)
		for i = 1,#colors do
			local color = colors[i]
			mode.universe.uinew(i + 10,color and ("<font size='7'>\n<p align='center'><font size='13' color='#"..string.format("%X",0xFFFFFF-color).."'><a href='event:item.color." .. color .. "'>■</a>"),n,150 + (50*i) or "",215,40,40,false,color)
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
		mode.universe.uinew(0,table.concat(mode.universe.info[n].settings.create,"\n<font size='4'>\n</font>",function(k,v)
			return string.format(v[1],tostring(v[2](n)))
		end),n,400,200,540,300,true)
		
		mode.universe.uinew(1,"<p align='center'><VI><a href='event:main.create'>" .. system.getTranslation("buttons.main.create") .. "</a>",n,180,338,100,24,false)
		mode.universe.uinew(2,"<p align='center'><VI><a href='event:main.recreate'>" .. system.getTranslation("buttons.main.recreate") .. "</a>",n,290,338,100,24,false)
		mode.universe.uinew(3,"<p align='center'><R><a href='event:main.destroy'>" .. system.getTranslation("buttons.main.destroy") .. "</a>",n,400,338,100,24,false)
		mode.universe.uinew(4,"<p align='center'><BV><a href='event:main.reset'>" .. system.getTranslation("buttons.main.reset") .. "</a>",n,510,338,100,24,false)
		mode.universe.uinew(5,"<p align='center'><VP><a href='event:main.exit'>" .. system.getTranslation("exit") .. "</a>",n,620,338,100,24,false)
		mode.universe.info[n].creatorOpen = true
	end,
	-- reset
	uiresetCreator = function(n)
		mode.universe.info[n].settings.palette = {1,{},1}
		mode.universe.info[n].settings.size = {-math.huge,5}
		mode.universe.info[n].settings.temperature = {-math.huge,5,true}
		mode.universe.info[n].settings.velocity = {-math.huge,1,true}
		mode.universe.info[n].settings.distance = {-math.huge,5,true}
		mode.universe.info[n].settings.rings = false
		mode.universe.info[n].settings.satellite = 0
	end,
	--[[ MenuUpdate ]]--
	infoBar =  function()
		local out = {
			{"<font color='#CF50DB'>%s",mode.universe.systemName},
			{system.getTranslation("buttons.classes.1") .. " : <V>%s",mode.universe.orbit[1]},
			{system.getTranslation("buttons.classes.2") .. " : <V>%s",mode.universe.orbit[2]},
			{system.getTranslation("buttons.classes.3") .. " : <V>%s",mode.universe.orbit[3]},
			{system.getTranslation("profile.exTime") .. " : <V>%s",(_G.currentTime / 25)},
		}
		
		return table.concat(out,"   <G>|   <N>",function(k,v)
			return string.format(v[1],v[2])
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
			mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation("profile.profiles")) .. "</B><font size='12'>\n<a href='event:profile.exit'>" .. system.getTranslation("exit") .. "</a><p align='left'>\n\n<S>" .. table.concat(mode.universe.cosmos,"\n",function(k,v)
				return string.format("%s <a href='event:profile.open.%s.%s'>%s</a>",(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),v.className,k,v.name)
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

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d509ca726.png","?0",-110,-120,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V>" .. (obj.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "") .. " <B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation("exit") .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.class"),n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,195,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,222,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.type"),n,181,196,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,223,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,305,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,332,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.exTime"),n,181,306,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.time / 1e7,n,171,333,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.information"),n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.size") .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-20,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.color") .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-21,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.gravity") .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-22,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.mass") .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.temperature") .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("profile.main") .. " : <V>" .. (obj.id == mode.universe.cosmos[1].id and system.getTranslation("yes") or system.getTranslation("no")),n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-25,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-26,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-27,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.flow") .. " : <V>" .. obj.flow,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.luminosity") .. " : <V>" .. obj.luminosity,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-29,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.magnitude") .. " : <V>" .. obj.magnitude,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-30,"",n,550,46,102,20,0x242f42,0x242f42,1,true)
			ui.addTextArea(-31,"",n,540,72,122,288,0x242f42,0x242f42,1,true)

			ui.addTextArea(-32,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.planets"),n,551,47,100,20,0x0f242e,0x0f242e,1,true)
			ui.addTextArea(-33,"<p align='center'><V>" .. table.concat(mode.universe.cosmos,"",function(k,v)
				return v.class == 2 and string.format("<a href='event:profile.open.Planet.%s'>%s</a>\n\n",k,v.name) or ""
			end),n,541,73,120,290,0x0f242e,0x0f242e,1,true)
		end,
		profilePlanet = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d509cc1ab.png","?0",-20,30,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation("exit") .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,180,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,170,127,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.class"),n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.type"),n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.life"),n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.rings"),n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V>" .. (obj.rings and system.getTranslation("yes") or system.getTranslation("no")),n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.information"),n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.size") .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.color") .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.gravity") .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.mass") .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.temperature") .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.velocity") .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.periods"),n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.rotation") .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.translation") .. " : <V>" .. obj.period.translation / 1e10,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-34,"",n,550,41,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-35,"",n,540,67,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-36,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.orbit"),n,551,42,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-37,"<p align='center'><V>#" .. obj.planetPosition,n,541,68,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-38,"",n,550,116,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-39,"",n,540,142,122,214,0x242F42,0x242F42,1,true)

			ui.addTextArea(-40,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.satellites"),n,551,117,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-41,"<p align='center'><V>" .. table.concat(obj.moons,"",function(k,v)
				return string.format("<a href='event:profile.open.Moon.%s'>%s</a>\n\n",mode.universe.cosmos[v].position,mode.universe.cosmos[v].name)
			end),n,541,143,120,216,0x0F242E,0x0F242E,1,true)
		end,
		profileMoon = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d41dcea87.png","?0",380,90,n)
			
			ui.addTextArea(-1,"",n,150,40,350,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation("exit") .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.class"),n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.type"),n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.life"),n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("menu.satellite"),n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V><a href='event:profile.open.Planet." .. obj.satelliteOf .. "'>" .. mode.universe.cosmos[obj.satelliteOf].name,n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.information"),n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.size") .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.color") .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.gravity") .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.mass") .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.temperature") .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.velocity") .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation("profile.periods"),n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.rotation") .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation("menu.translation") .. " : <V>" .. obj.period.translation,n,351,342,120,20,0x0F242E,0x0F242E,1,true)
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
			if not mode.universe.data.objects[string.lower(this.className)][this.type][4] then
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

			if string.find(string.lower(mode.universe.cosmos[this.satelliteOf].typeName),"gas") then
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
		return -2.5 * math.log(flow / -1.6)
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
			return math.random(1e3,1e4)
		else
			return math.log(orbit,mode.universe.cosmos[1].luminosity)
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
			
			data.className = mode.universe.translations.en.buttons.classes[data.class] or "?"
			data.typeName = mode.universe.data.objects[string.lower(data.className)][data.type][1] or "?"

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
					data.distance = (info.distance == "auto" and math.ceil(mode.universe.getDistance(data.class,data.position,data.size)) or math.ceil(info.distance))
					data.velocity = (info.velocity == "auto" and mode.universe.getVelocity(data.mass,data.size,data.orbit) or (info.velocity == 0 and .5 or info.velocity))
				elseif data.class == 3 then -- Moon
					data.satelliteOf = info.satelliteOf
					data.distance = math.ceil(mode.universe.getDistance(data.class,data.satelliteOf))
					data.velocity = 7 * table.random({.5,.3,.2,.1})
					
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
				point1 = string.format("%s,%s",x,y),
				point2 = string.format("%s,%s",x,y+1),
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
					point1 = string.format("%s,%s",x - self.size,y + math.floor(self.rings.inclination * 1.5)),
					point2 = string.format("%s,%s",x + self.size,y - math.floor(self.rings.inclination * 1.5)),
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
				"<N2>" .. system.getTranslation("menu.class") .. " : <V><a href='event:newObject.class'>%s</a>",function(n)
					if mode.universe.info[n].settings.class > 0 then
						return mode.universe.data.classes[mode.universe.info[n].settings.class]
					else
						return system.getTranslation("choose")
					end
				end
			},
			type = {
				"<N2>" .. system.getTranslation("menu.type") .. " : <V><a href='event:newObject.type'>%s</a>",function(n)
					if mode.universe.info[n].settings.type > 0 then
						return mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][1]
					else
						return system.getTranslation("choose")
					end
				end
			},
			name = {
				"<N2>" .. system.getTranslation("menu.name") .. " : <V><a href='event:newObject.name'>%s</a>",function(n)
					if #mode.universe.info[n].settings.name > 0 then
						return table.concat(mode.universe.info[n].settings.name)
					else
						return system.getTranslation("choose")
					end
				end
			},
			color = {
				"<N2>" .. system.getTranslation("menu.color") .. " : <V><a href='event:newObject.color'>%s</a>",function(n)
					if mode.universe.info[n].settings.palette[3] ~= 1 then
						local color = string.format("%X",mode.universe.info[n].settings.palette[3])
						return string.format("<font color='#%s'>#%s</font>",color,color)
					else
						return system.getTranslation("choose")
					end
				end
			},
			size = {
				"<N2>" .. system.getTranslation("menu.size") .. " : <V><a href='event:newObject.size'>%s</a>",function(n)
					if mode.universe.info[n].settings.size[1] > -math.huge then
						return mode.universe.info[n].settings.size[1]
					else
						return system.getTranslation("choose")
					end
				end
			},
			temperature = {
				"<N2>" .. system.getTranslation("menu.temperature") .. " : <V><a href='event:options.temperature'>%s</a>",function(n)
					if mode.universe.info[n].settings.temperature[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.temperature[1] .. " °C"
					end
				end
			},
			satellite = {
				"<N2>" .. system.getTranslation("menu.satellite") .. " : <V><a href='event:newObject.moon'>%s</a>",function(n)
					if mode.universe.info[n].settings.satellite > 0 and mode.universe.cosmos[mode.universe.info[n].settings.satellite].name then
						return mode.universe.cosmos[mode.universe.info[n].settings.satellite].name
					else
						return system.getTranslation("choose")
					end
				end
			},
			velocity = {
				"<N2>" .. system.getTranslation("menu.velocity") .. " : <V><a href='event:options.velocity'>%s</a>",function(n)
					if mode.universe.info[n].settings.velocity[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.velocity[1]
					end
				end
			},
			distance = {
				"<N2>" .. system.getTranslation("menu.distance") .. " : <V><a href='event:options.distance'>%s</a>",function(n)
					if mode.universe.info[n].settings.distance[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.distance[1]
					end
				end
			},
			rings = {
				"<N2>" .. system.getTranslation("menu.rings") .. " : <V><a href='event:alternate.rings'>%s</a>",function(n)
					return mode.universe.info[n].settings.rings and system.getTranslation("yes") or system.getTranslation("no")
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
				size = {-math.huge,5},
				temperature = {-math.huge,5,true},
				velocity = {-math.huge,1,true},
				distance = {-math.huge,5,true},
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
		system.bindKeyboard(n,string.byte("O"),true,true)
		
		-- Message
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation("creator"),n)
	end,
	--[[ Init ]]--
	reset = function()
		for i = #mode.universe.cosmos,1,-1 do
			mode.universe.cosmos[i]:destroy()
		end
		
		mode.universe.cosmos = {}
		mode.universe.orbit = {0,0,0,0}
		
		table.foreach(system.roomAdmins,mode.universe.newCreator)
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
					j[1] = system.getTranslation("objects." .. k .. "." .. i)
				end
			end
		end
		-- Set class translations
		mode.universe.data.classes = system.getTranslation("buttons.classes")
		
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
		system.bindKeyboard(n,string.byte("P"),true,true)
		system.bindKeyboard(n,46,true,true) -- Delete
		
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation("welcome"),n)
		
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
		if k == string.byte("O") and system.roomAdmins[n] then
			if mode.universe.info[n].creatorOpen then
				mode.universe.eventTextAreaCallback(i,n,"main.exit")
			else
				mode.universe.uicreator(n)
			end
			return
		elseif k == string.byte("P") then
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
		local p = string.split(c,"[^%.]+")
		-- Keyboard
		if p[1] == "keyboard" then
			if p[2] == "name" then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					if p[3] == "backspace" then
						table.remove(mode.universe.info[n].settings.name)
					elseif p[3] == "clear" then
						mode.universe.info[n].settings.name = {}
					elseif p[3] == "insert" then
						if #mode.universe.info[n].settings.name < 16 then
							mode.universe.info[n].settings.name[#mode.universe.info[n].settings.name + 1] = string.char(p[4])
						end
					end
					mode.universe.uikeyboard(p[2],mode.universe.info[n].settings.name,n)
				end
			end
			return
		end
		-- Counter
		if p[1] == "counter" then
			if table.find({"size","temperature","velocity","distance"},p[2]) then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					local increment = tonumber(string.format(p[4],"."))
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
				mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.concat(mode.universe.data.classes,"\n",function(k,v)
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
					return out and string.format("%s<a href='event:item.class.%s'>%s</a>",mode.universe.tab,k,v) or string.format("%s<N2>%s</N2>",mode.universe.tab,v)
				end),n)
				return
			end
			-- Type
			if p[2] == "type" then
				if mode.universe.info[n].settings.class > 0 then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.concat(mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[mode.universe.info[n].settings.class])],"\n",function(k,v)
						local out = true
						if mode.universe.info[n].settings.class == 2 then
							local orbit = mode.universe.orbit[2] + 1
							if v[5] ~= 0 and not math.isNegative(v[5],orbit > math.abs(v[5]),orbit <= v[5]) then
								out = false
							end
						end
						return out and string.format("%s<a href='event:item.type.%s'>%s</a>",mode.universe.tab,k,v[1]) or string.format("%s<N2>%s</N2>",mode.universe.tab,v[1])
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
					mode.universe.uicounter(p[2],mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][3],n)
				elseif p[2] == "color" then
					mode.universe.uipaletteMono(mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2],n)
				elseif p[2] == "temperature" then
					mode.universe.uicounter(p[2],"-200:1000",n,100) -- Unknown, yet.
				elseif p[2] == "velocity" then
					mode.universe.uicounter(p[2],"-8:8",n,2,.1) -- Unknown, yet.
				elseif p[2] == "distance" then
					mode.universe.uicounter(p[2],"0:250",n,20) -- Unknown, yet.
				elseif p[2] == "moon" then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation("menu.satellite")) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.concat(mode.universe.cosmos,"\n",function(k,v)
						return v.class == 2 and string.format("%s<a href='event:item.satellite.%s'>%s</a>",mode.universe.tab,k,v.name) or ""
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
				
				mode.universe.info[n].settings.palette[2] = mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2]
				
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
			if table.find({"size","temperature","velocity","distance"},p[2]) then
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
				if mode.universe.info[n].settings.size[1] == -math.huge then
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
				
				local concatenedName = table.concat(mode.universe.info[n].settings.name)
				
				if not create then
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation("fail"),table.concat(fails,", ",function(k,v)
						return system.getTranslation("menu." .. v)
					end)),n)
				end
				
				if mode.universe.stuff[concatenedName] then
					create = false
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation("nameExist"),concatenedName),n)
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
					
					local type = mode.universe.data.objects[string.lower(mode.universe.translations.en.buttons.classes[this.class])][this.type][1]
					tfm.exec.chatMessage("<S>" .. string.format(system.getTranslation("newObject." .. this.class),type,(this.satelliteOf and mode.universe.cosmos[this.satelliteOf].name or "")) .. "\n\t" .. string.format(system.getTranslation("checkProfile"),this.name))

					mode.universe.eventTextAreaCallback(i,n,"main.reset.not")
					mode.universe.eventTextAreaCallback(i,n,"main.exit")
				end
				return
			end
			-- Destroy
			if p[2] == "destroy" then
				if p[3] then
					p[3] = tonumber(p[3])
					ui.addPopup(p[3],1,"<p align='center'><font color='#2ECF73'>" .. string.format(system.getTranslation("destroyConfirm"),mode.universe.cosmos[p[3]].className,mode.universe.cosmos[p[3]].name),n,200,150,400,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation("buttons.main.destroy")) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation("exit") .. "</a><p align='left'>\n\n<S>" .. table.concat(mode.universe.cosmos,"",function(k,v)
						return v.display and string.format("%s%s <a href='event:main.destroy.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name) or ""
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
						
						tfm.exec.chatMessage("<R>" .. system.getTranslation("systemRecreated"),n)
					else
						if mode.universe.cosmos[p[3]].class == 3 then
							if mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf].display then
								mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:destroy()
							else
								tfm.exec.chatMessage("<R>" .. system.getTranslation("planetRecreated"),n)
							end
							
							mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:create()
						else
							mode.universe.cosmos[p[3]]:create()
							
							if mode.universe.cosmos[p[3]].class == 2 then
								if #mode.universe.cosmos[p[3]].moons > 0 then
									tfm.exec.chatMessage("<R>" .. system.getTranslation("moonRecreated"),n)
								end
							end
						end
					end
					mode.universe.uicloseSplash(n,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation("buttons.main.recreate")) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation("exit") .. "</a><p align='left'>\n\n<S>" .. table.concat(mode.universe.cosmos,"",function(k,v)
						return v.display and "" or string.format("%s%s <a href='event:main.recreate.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name)
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
		local p = string.split(c,"[^%s]+")
		
		if p[1] == "profile" then
			if p[2] then
				p[2] = string.lower(p[2])
				for k,v in next,mode.universe.cosmos do
					if string.lower(v.name) == p[2] then
						mode.universe.eventTextAreaCallback(nil,n,"profile.open." .. v.className .. "." .. k)
						break
					end
				end
			else
				mode.universe.eventKeyboard(n,string.byte("P"))
			end
			return
		end
		
		if system.roomAdmins[n] then
			if p[1] == "name" then
				if p[2] then
					mode.universe.eventPopupAnswer(0,n,table.concat(p," ",nil,2))
				else
					ui.addPopup(0,2,"<p align='center'><font color='#CF50DB'>" .. system.getTranslation("sysName.choose"),n,200,150,400,true)
				end
				return
			end
		end
	end,
	-- PopupAnswer
	eventPopupAnswer = function(i,n,a)
		if i == 0 then
			if a ~= "" then
				mode.universe.systemName = string.sub(a,1,20)
				tfm.exec.chatMessage("<font color='#CF50DB'>" .. string.format(system.getTranslation("sysName.new"),mode.universe.systemName))
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
						tfm.exec.chatMessage("<R>" .. system.getTranslation("moonDestroyed"),n)
					end
				else
					tfm.exec.chatMessage("<R>" .. system.getTranslation("cantDestroy"),n)
				end
			end
			mode.universe.uicloseSplash(n,true)
		end
	end,
	-- NewGame
	eventNewGame = function()
		mode.universe.canInsertBackground = true
		
		mode.universe.setBackground()
	
		-- Solar System
		if system.roomNumber == 801 or not string.find(tfm.get.room.name,"@") then
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
					velocity = -.5,
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
					color = 0x183241,
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
				mode.universe.object.new(object,system[i])
			end
			
			--[[
			for i = 1,#mode.universe.cosmos do
				if mode.universe.cosmos[i].class ~= 3 then
					mode.universe.cosmos[i]:create()
				end
			end
			]]
			
			mode.universe.cosmos[1]:create() -- Sun
			mode.universe.cosmos[2]:create() -- Mercury
			mode.universe.cosmos[3]:create() -- Venus
			mode.universe.cosmos[4]:create() -- Earth
			mode.universe.cosmos[6]:create() -- Mars
			mode.universe.cosmos[9]:create() -- Jupiter
			mode.universe.cosmos[14]:create() -- Saturn
			mode.universe.cosmos[17]:create() -- Uranus
			mode.universe.cosmos[18]:create() -- Neptune
			mode.universe.cosmos[19]:create() -- Pluto			
		end
	end,
	-- Loop
	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			for k,v in next,system.players(true) do
				tfm.exec.killPlayer(v)
			end
		end
		
		if _G.currentTime % 80 == 0 then
			if mode.universe.ufoId > -1 then
				tfm.exec.removeImage(mode.universe.ufoId)
			end

			mode.universe.ufoId = tfm.exec.addImage(table.random(mode.universe.images.ufos) .. ".png","!65",math.random(200,7800),math.random(200,7800))
		end
	end
}