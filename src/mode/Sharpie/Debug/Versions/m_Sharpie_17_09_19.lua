mode.sharpie = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to #sharpie! Fly pressing space.",

			-- Warning
			nothacker = "The mice flying are NOT hackers!",

			-- Sample words
			won = "won",
			
			-- Messages
			first = {
				"yay 2 in a row",
				"super pro",
				"oml are you playing alone or what",
				"wooow 4 in a row!",
				"getting hard? good luck pro!",
				"you noob just unlocked the title lightning",
				"woah speedmaster",
				"formula 1",
				"time traveler you sir",
				"queen of the win",
				"as pro as the developer",
				"ILLUMINATI!",
				"are you a real hacker?",
				"I hope you dont loose the chance of seeing the last message",
				"THIS IS A SHIT MESSAGE BECAUSE YOU DIDNT DESERVE IT",
			},
			hardMode = "The hard mode is activated in this round!",
		},
		br = {
			welcome = "Bem-vindo ao #sharpie! Voe apertando espaço.",

			nothacker = "Os ratos voando NÃO são hackers!",

			won = "venceu",

			first = {
				"yay 2 seguidas",
				"super pro",
				"omg você tá jogando sozinho ou o que",
				"etaaa 4 seguidas!",
				"ficando difícil? boa sorte mito!",
				"vc noob acaba de desbloquear o título relâmpago",
				"vuash mestre da corrida",
				"relâmpago marquinhos",
				"viajante do tempo vc senhor",
				"rainha da vitória",
				"tão pro quanto o criador do jogo",
				"ILLUMINATI!",
				"éres um hacker de verdade?",
				"Espero que você não perca a chance de ler a última mensagem",
				"ESSA É UMA MENSAGEM DE MERDA PQ VC N MERECEU ISSO",
			},
			hardMode = "O modo difícil foi ativado nessa partida!",
		},
	},
	langue = "en",
	languageIsSet = false,
	--[[ Settings ]]--
	flyPower = -50,
	firstRow = {"",0}, -- Player, amount
	podium = 0,
	totalPlayers = 0,
	hardmode = false,
	modeImages = {"15cbdb3c427","15cbdb479ca","15cbdb4a1ca","15cbdb4cae5"},
	mapInfo = {800,400},
	--[[ UI ]]--
	uiborder = function(t,x,y)
		local colors = {
			{"#F7F918","#EC4848"},
			{"#4CE7F7","#2C9F5B"},
			{"#4BD9CD","#2A64E9"},
			{"#D4F31A","#8C8fA4"},
		}
		local color = table.random(colors)

		ui.addTextArea(0,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y-1,900,25,1,1,0,true)
		ui.addTextArea(1,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y+1,900,25,1,1,0,true)
		ui.addTextArea(2,"<font color='" .. color[2] .. "'><B>"..t,nil,x+1,y,900,25,1,1,0,true)
		ui.addTextArea(3,"<font color='" .. color[2] .. "'><B>"..t,nil,x-1,y,900,25,1,1,0,true)
		ui.addTextArea(4,"<font color='" .. color[1] .. "'><B>"..t,nil,x,y,900,25,1,1,0,true)
	end,
	--[[ Init ]]--
	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame"} do
			tfm.exec["disable"..f]()
		end
		
		tfm.exec.newGame()
	end,
	--[[ Events ]]--
	-- NewGame
	eventNewGame = function()
		mode.sharpie.podium = 0
		
		local currentXml = tfm.get.room.xmlMapInfo
		currentXml = currentXml and currentXml.xml or ""
		
		mode.sharpie.mapInfo = {800,400}
		mode.sharpie.flyPower = -50
		
		xml.attribFunc(currentXml or "",{
			[1] = {
				attribute = "G",
				func = function(value)
					value = string.split(value,"[^,]+")
					value = tonumber(value[2]) or 0
					mode.sharpie.flyPower = value < 0 and 50 or -50
				end
			},
			[2] = {
				attribute = "L",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[1] = value
					end
				end
			},
			[3] = {
				attribute = "H",
				func = function(value)
					value = tonumber(value)
					if value then
						mode.sharpie.mapInfo[2] = value
					end
				end
			},
			[4] = {
				attribute = "P",
				func = function()
					table.foreach(tfm.get.room.playerList,tfm.exec.killPlayer)
					tfm.exec.setGameTime(5,false)
				end
			},
		})
		
		mode.sharpie.hardmode = math.random(10) == 6
		if mode.sharpie.hardmode then
			tfm.exec.chatMessage("<CH>" .. system.getTranslation("hardMode"))
		end
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		tfm.exec.chatMessage("<CE>" .. system.getTranslation("welcome"),n)

		system.bindKeyboard(n,32,true,true)
		
		ui.banner("15d60d8e5b8",130,100,n)
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				tfm.exec.movePlayer(n,0,0,true,0,mode.sharpie.flyPower,true)
				tfm.exec.displayParticle(3,x,y)
			end
		end
	end,
	-- PlayerWon
	eventPlayerWon = function(n)
		mode.sharpie.podium = mode.sharpie.podium + 1
		if mode.sharpie.podium == 1 then
			if mode.sharpie.firstRow[1] == n then
				mode.sharpie.firstRow[2] = mode.sharpie.firstRow[2] + 1
				
				if mode.sharpie.totalPlayers > 3 then
					local msg = system.getTranslation("first")
					tfm.exec.chatMessage("<G># <ROSE>" .. (msg[mode.sharpie.firstRow[2] - 1] or table.random({msg[2],msg[3],msg[6],msg[13],msg[15]})),n)
				end
			else
				mode.sharpie.firstRow = {n,1}
			end

			tfm.exec.setPlayerScore(n,(mode.sharpie.firstRow[2]+1) * 5,true)

			tfm.exec.chatMessage(string.format("<J>%s %s! %s",n,system.getTranslation("won"),mode.sharpie.firstRow[2] > 1 and "("..mode.sharpie.firstRow[2]..")" or ""))
		else
			tfm.exec.setPlayerScore(n,5,true)
		end
	end,
	-- Loop
	eventLoop = function()
		if _G.currentTime % 5 == 0 then
			local alive,total = system.players()
			mode.sharpie.totalPlayers = total
			
			-- Warning
			mode.sharpie.uiborder(system.getTranslation("nothacker"),10,382)
		end
		
		if _G.leftTime <= 1 or system.players() < 1 then
			tfm.exec.newGame()
		end

		if mode.sharpie.hardmode and _G.currentTime > 1 and _G.currentTime % 7 == 0 then
			system.newTimer(function()
				local x,y = math.random(0,mode.sharpie.mapInfo[1]),math.random(0,mode.sharpie.mapInfo[2])
				local id = tfm.exec.addImage(table.random(mode.sharpie.modeImages) .. ".png","&0",x - 56,y - 51) -- 112x103 img
				system.newTimer(function()
					tfm.exec.removeImage(id)

					tfm.exec.displayParticle(24,x,y)
					tfm.exec.explosion(x,y,50,100)
				end,1250,false)
			end,1000,false)
		end
	end,
}