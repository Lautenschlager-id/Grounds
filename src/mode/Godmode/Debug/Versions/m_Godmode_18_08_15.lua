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
		ui.addTextArea(1,"<p align='center'><font size='16'><B><V>"..p.."</V></B></font></p><p align='left'><font size='12'>\n<N>" .. string.format(system.getTranslation().profile,mode.godmode.info[p].title,"<V>"..mode.godmode.info[p].roundSha,"<J>"..mode.godmode.info[p].cheeseMice,"<R>"..mode.godmode.info[p].deathMice,"<V>"..mode.godmode.info[p].deathSha),n,290,115,220,160,1,1,1,true)
	end,
	-- InfoMenu
	updateMenu = function()
		ui.setShamanName(table.concat(mode.godmode.getShaman()," - <PS>") .. "   <G>|   <N>Status : <J>" .. mode.godmode.savedMice .. " <BL>/ <R>" ..  mode.godmode.deadMice)
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
				tfm.exec.chatMessage("<CH>" .. string.format(system.getTranslation().xp,mode.godmode.savedMice,mode.godmode.deadMice),v)
				
				
				for i = #mode.godmode.titles,1,-1 do
					if mode.godmode.info[v].cheeseMice >= mode.godmode.titles[i] then
						if mode.godmode.info[v].title ~= mode.godmode.title[i] then
							mode.godmode.info[v].title = mode.godmode.title[i]
							tfm.exec.chatMessage("<J>" .. string.format(system.getTranslation().unlock,v,mode.godmode.title[i]))
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
			if table.find({66,67,74,78,86},k) then -- B;C;V;N;J
				mode.godmode.info[n].usedNails = mode.godmode.info[n].usedNails + 1
				if mode.godmode.info[n].usedNails > 4 then
					tfm.exec.killPlayer(n)
					tfm.exec.chatMessage("<R>" .. system.getTranslation().fail .. " " .. system.getTranslation().kill,n)
				else
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation().nail,5 - mode.godmode.info[n].usedNails),n)
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
		local p = string.split(c,"[^%s]+",string.lower)
		if p[1] == "info" then
			tfm.exec.chatMessage("<J>" .. system.getTranslation().info,n)
		elseif p[1] == "p" then
			if p[2] then
				p[2] = string.nick(p[2])
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
		local p = string.split(c,"[^%.]+")
		if p[1] == "profile" then
			if p[2] == "close" then
				for i = 0,1 do
					ui.removeTextArea(i,n)
				end
			end
		end
	end,
}