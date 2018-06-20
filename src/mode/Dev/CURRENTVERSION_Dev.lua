mode.dev = {
	-- Translations
	translations = {
		en = {
			-- Init
			welcome = "Welcome to the enviroment #dev. Here you can test images, objects, timers and chat messages. Type !help to check the commands or report bugs to Bolodefchoco.",
		
			-- Sets
			maxPlayers = "%s has limited the room to %s players",
			removePassword = "%s just removed the password",
			addPassword = "%s just set the password as %s",
			timerCreated = "Timer \"%s\" created successfully",
			timerDestroyed = "Timer \"%s\" destroyed successfully",
			imageDestroyed = "Image \"%s\" removed successfully",
			imageTargetInvalid = "Image \"%s\": Target invalid!",
			throwDisabled = "Throwing objects was disabled!",
			throwCreated = "Throwing system created!",
			characterDisabled = "Characters disabled!",
			characterCreated = "Character system created!",
			loadMap = "%s just loaded the map %s",
			
			-- Help
			commands = {
				"set players [amount] ~> Defines a limit amount of mice in the room",
				"set password [password] ~> Defines/Removes a password in the room",
				"set background [background image] [x] [y] ~> Defines a background in the map",
				"set background remove ~> Removes the background in the map",
				"timer ~> Displays all the timers running",
				"timer [name] break ~> Destroyes the specified timer",
				"timer [name] [(boolean)loop / (int)total executions] [time, in seconds, for each execution] [(function's name)callback] [*optional*parameters (#Int,@String,!Boolean,?var)] ~> Creates a timer",
				"img ~> Displays all the images being displayed in the moment",
				"img [name] remove ~> Removes the specified image",
				"img [name] [image] [target (#ObjectName in case of #)] [x] [y] [*optional*player] ~> Adds an image",
				"object ~> Displays all the objects in the map",
				"object [name] remove ~> Removes the specified object",
				"object [name] [id] [x] [y] [angle] [(boolean:int)\"true:1\" <seconds for despawning] [x speed] [y speed] [(boolean)ghost] ~> Creates an object",
				"throw remove ~> Disables the throwing system",
				"throw [player (* > all)] [object type] [x speed] [y speed] [(boolean)ghost] [*optional*(string/table>use {x,y,z})left images] [*optional*(string/table>use {x,y,z})right images(- > same value of the last argument)] ~> Enables the throwing system by pressing space and shooting an object [*optional*linked to an image]",
				"character disable ~> Disables the character system",
				"character [player (* > all)] [depth ($/%)] [left image] [right image(- > same value of the last argument)] [xAxis] [yAxis] ~> Creates the character system",
				"display [message] [player (* > all)] ~> Displays a chat message",
				"disable [disableable official function] [(boolean)disable] ~> Disables/Enables the specified setting (Shaman, New Game, ...)",
				"xml [@Map] ~> Loads the map as XML. You can also insert the XML parameter img=\"img.png,x,y,0/1 (foreground)\" to add images automatically",
				"np [@Map] ~> Loads a map",
				"execute [function] [arguments (#Int,@String,!Boolean,?var)] ~> Executes the specified function"
			},
		},
		br = {
			welcome = "Bem-vindo ao ambiente #dev. Aqui você poderá testar imagens, objectos, timers e mensagens no chat, Digite !help para checar os comandos ou reporte bugs para Bolodefchoco.",
		
			maxPlayers = "%s limitou a sala a %s jogadores",
			removePassword = "%s acabou de remover a senha",
			addPassword = "%s acabou de definir a senha para %s",
			timerCreated = "Timer \"%s\" criado com sucesso",
			timerDestroyed = "Timer \"%s\" destruido com sucesso",
			imageDestroyed = "Imagem \"%s\" removida com sucesso",
			imageTargetInvalid = "Imagem \"%s\": Target inválido!",
			throwDisabled = "Sistema de tiro desativado!",
			throwCreated = "Sistema de tiro criado!",
			loadMap = "%s acabou de carregar o mapa %s",
			
			commands = {
				"set players [quantidade] ~> Define um limite de jogadores na sala",
				"set password [senha] ~> Define/Remove a senha da sala",
				"set background [imagem de fundo] [x] [y] ~> Define uma imagem de fundo no mapa",
				"set background remove ~> Remove a imagem de fundo do mapa",
				"timer ~> Mostra todos os timers rodando",
				"timer [nome] break ~> Destrói um timer especificado",
				"timer [nome] [(boolean)loop / (int)execuções totais] [tempo, em segundos, para cada execução] [(nome da função)callback] [*opcional*parâmetros (#Número,@Texto,!Boolean,?Variável)] ~> Cria um timer",
				"img ~> Exibe todas as imagens que estão sendo exibidas no momento",
				"img [nome] remove ~> Remove a imagem especificada",
				"img [nome] [imagem] [target (#NomeDoObjeto no caso de #)] [x] [y] [*opcional*jogador] ~> Adiciona uma imagem",
				"object ~> Mostra todos os objetos no mapa",
				"object [nome] remove ~> Remove um objeto especificado",
				"object [nome] [id] [x] [y] [angle] [(boolean:int)\"true:1\" <segundos para despawn] [velocidade x] [velocidade y] [(boolean)transparente] ~> Cria um objeto",
				"throw remove ~> Desativa o sistema de lançamento",
				"throw [jogador (* > todos)] [tipo do objeto] [velocidade x] [velocidade y] [(boolean)transparente] [*opcional*(string/table>use {x,y,z})imagens da esquerda] [*opcional*(string/table>use {x,y,z})imagens da direita(- > mesmo valor do último argumento)] ~> Ativa o sistema de lançamento ao apertar espaço e atirar um objeto [*opcional*ligado à uma imagem]",
				"character disable ~> Desativa o sistema de personagens",
				"character [jogador (* > todos)] [camada ($/%)] [imagem da esquerda] [imagem da direita(- > mesmo valor do último argumento)] [x] [y] ~> Cria o sistema de personagens",
				"display [mensagem] [jogador (* > todos)] ~> Mostra uma mensagem no chat",
				"disable [função oficial desativável] [(boolean)desativar] ~> Desativa/Ativa a opção especificada (Shaman, New Game, ...)",
				"xml [@Mapa] ~> Carrega o mapa como XML. Você pode também inserir o parâmetro XML img=\"img.png,x,y,0/1 (primeiro plano)\" para adicionar imagens automaticamente.",
				"np [@Mapa] ~> Carrega um mapa",
				"execute [(nome da função)callback] [argumentos (#Número,@Texto,!Boolean,?Variável)] ~> Executa a função especificada",
			},
		},
	},
	langue = "",
	--[[ Data ]]--
	info = {},
	--[[ Settings ]]--
	-- image
	currentBackground = {},
	images = {},
	mapImages = {},
	mouseImages = {false},
	-- newGame
	runXml = false,
	-- object
	objects = {},
	toDespawn = {},
	-- throw
	throw = {false},
	-- timer
	timers = {},
	--[[ Get ]]--
	getWithType = function(a)
		local values = string.split(a or "","[^,]+")
		
		local out = {}
		
		for k,v in next,values do
			local icon,value = string.match(v,"([@?#!])(.*)")
			if icon and value then	
				if icon == "#" then
					out[#out + 1] = tonumber(value)
				elseif icon == "@" then
					out[#out + 1] = string.trim(tostring(value))
				elseif icon == "!" then
					out[#out + 1] = value == "true"
				elseif icon == "?" then
					out[#out + 1] = system.loadTable(value)
				end
			end
		end
		
		return out
	end,
	--[[ Init ]]--
	reset = function()
		mode.dev.currentBackground = {}
		mode.dev.images = {}
		mode.dev.timers = {}
		mode.dev.objects = {}
	end,
	init = function()
		-- Init
		tfm.exec.disableAutoShaman()
		disableChatCommand("set","timer","object","img","throw","display","disable","execute","np","xml","help")
		
		-- Auto Admin
		system.roomAdmins["Mescouleur#0000"] = true
		
		-- Start
		tfm.exec.newGame()
	end,
	--[[ Events ]]--
	-- ChatCommand
	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+")
		
		if p[1] == "help" then
			tfm.exec.chatMessage(table.concat(system.getTranslation().commands,"\n\n",function(k,v)
				return "<ROSE>• <CE>" .. string.gsub(v,"<","&lt;")
			end),n)
			return
		end
		
		if system.roomAdmins[n] then

			if p[1] == "set" then
				if p[2] == "players" then --set players INT
					p[3] = math.setLim(tonumber(p[3]) or 25,1,50)
					tfm.exec.setRoomMaxPlayers(p[3])
					tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().maxPlayers,n,p[3]))
				elseif p[2] == "password" then --set password PASSWORD
					if p[3] then
						p[3] = table.concat(p," ",nil,3)
					
						tfm.exec.setRoomPassword(p[3])
					
						tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().addPassword,n,string.rep("*",#p[3])))
					else
						tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().removePassword,n))
					end
				elseif p[2] == "background" and p[3] then --set background img x y
					if p[3] == "remove" then
						if #mode.dev.currentBackground > 0 then
							tfm.exec.removeImage(mode.dev.currentBackground[4])
							mode.dev.currentBackground = {}
						end
					else
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
						mode.dev.currentBackground = {p[3] .. ".png",tonumber(p[4]) or 0,tonumber(p[5]) or 0}
						mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
					end
				end
				return
			end
			
			if p[1] == "timer" then --timer NAME LOOP TIME FUNC PARAM
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.timers,"\n",tostring),n)
				elseif p[3] == "break" then
					if mode.dev.timers[p[2]] then
						system.removeTimer(mode.dev.timers[p[2]])
						mode.dev.timers[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().timerDestroyed,p[2]),n)
					end
				else
					if #mode.dev.timers < 39 then
						if mode.dev.timers[p[2]] then
							mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " break")
						end
						
						if p[5] then 
							local loop,counter = true
							
							if p[3] == "true" then
								counter = -1
							elseif p[3] == "false" then
								counter = 1
							else
								counter = tonumber(p[3]) or 5
							end
							
							local time = math.setLim(tonumber(p[4]) or 1,1,50) * 1000
							local f = system.loadTable(p[5])
							f = type(f) == "function" and f or tfm.exec.chatMessage

							local args = mode.dev.getWithType(table.concat(p," ",function(k,v)
								return (table.find({"#","@","!","?"},string.sub(v,1,1)) and "," or "") .. v
							end,6))
							
							local this
							this = system.newTimer(function()
								f(table.unpack(args))
								
								counter = counter - 1
								if counter == 0 then
									system.removeTimer(this)
									mode.dev.timers[p[2]] = nil
								end
							end,time,loop)
							
							mode.dev.timers[p[2]] = this
							
							tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().timerCreated,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "img" then --img NAME IMG TARG X Y PLAYER
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.images,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.images[p[2]] then
						tfm.exec.removeImage(mode.dev.images[p[2]])
						mode.dev.images[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().imageDestroyed,p[2]),n)
					end
				else
					if mode.dev.images[p[2]]then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
					
					if p[4] then
						local target = table.find({"#","$","%","?","_","!","&"},string.sub(p[4],1,1))
						
						if target then
							p[5],p[6] = p[5] or 0,p[6] or 0
						
							local object = string.sub(p[4],1,1) == "#" and "#" .. (mode.dev.objects[string.sub(p[4],2)] or tfm.exec.addShamanObject(1,p[5],p[6])) or p[4]
							mode.dev.images[p[2]] = tfm.exec.addImage(p[3] .. ".png",object,p[5],p[6],p[7])
						else
							tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().imageTargetInvalid,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "object" then --object NAME ID X Y BOOLEAN_DESPAWN:TIME_TO_DESPAWN ANGLE XS YS GHOST
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.objects,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.objects[p[2]] then
						tfm.exec.removeObject(mode.dev.objects[p[2]])
						mode.dev.objects[p[2]] = nil
					end
				else
					if mode.dev.objects[p[2]] then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
				
					mode.dev.objects[p[2]] = tfm.exec.addShamanObject(tonumber(p[3]) or 1,tonumber(p[4]) or 0,tonumber(p[5]) or 0,tonumber(p[7]),tonumber(p[8]),tonumber(p[9]),p[10] == "true")
					if p[6] and string.find(p[6],"true") then
						mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {mode.dev.objects[p[2]],os.time() + (tonumber(string.match(p[6],":(%d+)")) or 5) * 1000,p[2]}
					end
				end
				return
			end
			
			if p[1] == "throw" and p[2] then --throw WHO ID XS YS BOOLEAN_GHOST {IMG,IMG} {IMG,IMG}
				if p[2] == "remove" then
					mode.dev.throw = {false}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwDisabled,n)
					
					for k,v in next,mode.dev.info do
						system.bindKeyboard(k,32,true,false)
					end
				else
					mode.dev.throw = {false}
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							system.bindKeyboard(k,32,true,true)
						end
					else
						system.bindKeyboard(p[2],32,true,true)
					end
					mode.dev.throw[2] = p[2] -- Who
					
					mode.dev.throw[3] = tonumber(p[3]) or 17 -- Object type
					
					local create = true
					if p[7] then
						if not p[8] or p[8] == "-" then
							p[8] = rawget(p,7)
						end	
						if string.find(p[7],"{") or string.find(p[8],"{") then
							if string.find(p[7],"{") and string.find(p[8],"{") then
								mode.dev.throw[7] = string.split(string.sub(p[7],2,-2),"[^,]+") -- Left images
								mode.dev.throw[8] = string.split(string.sub(p[8],2,-2),"[^,]+") -- Right images
							else
								create = false
							end
						else
							mode.dev.throw[7] = {p[7]}
							mode.dev.throw[8] = {p[8]}
						end
					end
					
					if create then
						mode.dev.throw[4] = tonumber(p[4]) or 0 -- X speed
						mode.dev.throw[5] = tonumber(p[5]) or 0 -- Y speed
						mode.dev.throw[6] = p[6] == "true" -- Ghost
						
						mode.dev.throw[1] = true
						tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwCreated,n)
					else
						mode.dev.throw = {false}
					end
				end
				return
			end

			if p[1] == "character" and p[4] then --character WHO DEPTH IMG IMG X Y
				if p[2] == "disable" then
					mode.dev.mouseImages = {false}
					
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterDisabled,n)
					
					for k,v in next,mode.dev.info do
						for i = 0,2,2 do
							system.bindKeyboard(k,i,true,false)
						end
						
						if v.mouseImage > -1 then
							tfm.exec.removeImage(v.mouseImage)
							v.mouseImage = -1
						end
					end
				else
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							for i = 0,2,2 do
								system.bindKeyboard(k,i,true,true)
							end
						end
					else
						for i = 0,2,2 do
							system.bindKeyboard(p[2],i,true,true)
						end
					end

					p[3] = table.find({"$","%"},p[3]) and p[3] or "%"
					
					if not p[5] or p[5] == "-" then
						p[5] = rawget(p,4)
					end
					
					mode.dev.mouseImages = {true,p[2],p[3],p[4],p[5],tonumber(p[6]) or 0,tonumber(p[7]) or 0}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterCreated,n)
				end
				return
			end
			
			if p[1] == "display" and p[2] then
				tfm.exec.chatMessage("<CE>[" .. n .. "#DEV-DISPLAY] <N>" .. string.gsub(table.concat(p," ",nil,2),"<","&lt;"))
				return
			end
		
			if p[1] == "disable" and p[2] then --disable AUTONEWGAME TRUE
				for k,v in next,tfm.exec do
					if string.lower(k) == p[1]..p[2] then
						local status = p[3] == "true"
						tfm.exec.chatMessage("<CE>" .. k .. " : " .. tostring(status))
						v(status)
						break
					end
				end
				return
			end
			
			if p[1] == "xml" and p[2] and _G.currentTime > 10 then
				mode.dev.runXml = true
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().loadMap,n,p[2]) .. " (XML)")
				return
			end
		
			if p[1] == "np" and p[2] and _G.currentTime > 10 then
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().loadMap,n,p[2]))
				return
			end
		
			if p[1] == "execute" and p[2] then --execute tfm.exec.giveCheese NAME
				local f = system.loadTable(p[2])
				if type(f) == "function" then
					local args = mode.dev.getWithType(table.concat(p," ",function(k,v)
						return (table.find({"#","@","!","?"},string.sub(v,1,1)) and "," or "") .. v
					end,3))
				
					f(table.unpack(args))
				end
				return
			end
		end
	end,
	-- NewGame
	eventNewGame = function()
		mode.dev.objects = {}
		
		if mode.dev.runXml then
			system.newTimer(function()
				tfm.exec.newGame(tfm.get.room.xmlMapInfo.xml or "")
			end,7000,false)
			ui.addTextArea(0,"",nil,-1500,-1500,3000,3000,0x6A7495,0x6A7495,1,true)
		else
			ui.removeTextArea(0,nil)
			for k,v in next,mode.dev.mapImages do
				tfm.exec.removeImage(v)
			end
			
			mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
			
			if tfm.get.room.xmlMapInfo.xml then
				xml.attribFunc(tfm.get.room.xmlMapInfo.xml,{
				
					[1] = {
						attribute = "img",
						func = function(value)
							for k,v in next,string.split(value,"[^;]+") do
								local info = string.split(v,"[^,]+") -- "img.png,x or 0,y or 0,0/1 (foreground)"
								info[4] = math.setLim(tonumber(info[4]) or 0,0,1)
								
								mode.dev.mapImages[#mode.dev.mapImages + 1] = tfm.exec.addImage(info[1] .. ".png",(({"?","!"})[info[4] + 1]) .. k,tonumber(info[2]) or 5,tonumber(info[3]) or 30)	
							end
						end
					}
				})
			end
		end
		mode.dev.runXml = false
	end,
	-- NewPlayer
	eventNewPlayer = function(n)
		mode.dev.info[n] = {
			timer = 0,
			mouseImage = -1,
		}

		tfm.exec.chatMessage("<CE>" .. system.getTranslation().welcome,n)
	
		if mode.dev.throw[1] then
			if mode.dev.throw[2] == n or mode.dev.throw[2] == "*" then
				system.bindKeyboard(n,32,true,true)
			end
		end
		
		if mode.dev.mouseImages[1] then
			if mode.dev.throw[2] == n or mode.dev.throw[2] == "*" then
				for i = 0,2,2 do
					system.bindKeyboard(n,i,true,true)
				end
			end
		end
	end,
	-- Keyboard
	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				if mode.dev.throw[1] and os.time() > mode.dev.info[n].timer then
					mode.dev.info[n].timer = os.time() + 500
			
					x = x + (tfm.get.room.playerList[n].isFacingRight and 30 or -30)
					y = y - 15
					
					local xs,ys = mode.dev.throw[4],mode.dev.throw[5]
					
					local angle = 0			
					if mode.dev.throw[3] == 17 then
						angle = tfm.get.room.playerList[n].isFacingRight and 90 or -90
					else
						xs = (tfm.get.room.playerList[n].isFacingRight and xs or -xs)
						ys = (tfm.get.room.playerList[n].isFacingRight and ys or -ys)
					end
					
					local object = tfm.exec.addShamanObject(mode.dev.throw[3],x,y,angle,xs,ys,mode.dev.throw[6])
					
					if mode.dev.throw[8] then
						local imageId = math.random(#mode.dev.throw[7])
						tfm.exec.addImage(mode.dev.throw[(tfm.get.room.playerList[n].isFacingRight and 8 or 7)][imageId] .. ".png","#" .. object,-5,-8)
					end
					
					mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {object,os.time() + 5000}
				end
				return
			end
			
			if k == 0 or k == 2 then
				if mode.dev.mouseImages[1] then
					if mode.dev.info[n].mouseImage > -1 then
						tfm.exec.removeImage(mode.dev.info[n].mouseImage)
					end
					
					mode.dev.info[n].mouseImage = tfm.exec.addImage(({[0]=mode.dev.mouseImages[4],[2]=mode.dev.mouseImages[5]})[k] .. ".png",mode.dev.mouseImages[3] .. n,mode.dev.mouseImages[6],mode.dev.mouseImages[7])
				end
				return
			end
		end
	end,
	-- Loop
	eventLoop = function()
		for k,v in next,{table.unpack(mode.dev.toDespawn)} do
			if os.time() > v[2] then
				tfm.exec.removeObject(v[1])
				mode.dev.objects[v[1]] = nil
				table.remove(mode.dev.toDespawn,k)
			end
		end

		if system.miscAttrib == 1 then
			table.foreach(tfm.get.room.playerList,tfm.exec.respawnPlayer)
		end
	end,
}