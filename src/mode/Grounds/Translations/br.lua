		br = {
			grounds = {
				[0] = {"Madeira","?","?"},
				[1] = {"Gelo","Aumenta sua velocidade ao pressionar a barra de espaço","Aumenta a velocidade em <BL>%s%%</BL>"},
				[2] = {"Trampolim","?","?"},
				[3] = {"Lava","Teletransporta-o para o piso de Z anterior","?"},
				[4] = {"Chocolate","?","?"},
				[5] = {"Terra","?","?"},
				[6] = {"Grama","?","?"},
				[7] = {"Areia","Cria uma tempestade de areia","Diminui a tempestade em <BL>%s%%</BL>"},
				[8] = {"Nuvem","Permite o voo ao pressionar a barra de espaço","Aumenta o voo em <BL>%s%%</BL>"},
				[9] = {"Água","Afoga-o","Afoga-o <BL>%s%%</BL> mais devagar"},
				[10] = {"Pedra","Cria um bloco de pedra ao pressionar a barra de espaço","Aumenta o tamanho do bloco em <BL>%s%%</BL>"},
				[11] = {"Neve","Atira bolas de neve ao pressionar a barra de espaço","Aumenta a velocidade da bola de neve em <BL>%s%%</BL>"},
				[12] = {"Retângulo","Cada cor tem sua própria função","?",{
					["C90909"] = "Mata-o",
					["18C92B"] = "Revive todos os inimigos",
					["555D77"] = "Checkpoint para reviver",
				}},
				[13] = {"Círculo","Cada cor tem sua própria função","?","?"},
				[14] = {"Invisível","?","?"},
				[15] = {"Teia de aranha","Teletransporta-o para o ponto de spawn","?"},
			},
			categories = {
				[1] = "Geralmente mapas longos que, na maioria dos casos, os jogadores devem passar pelo mesmo obstáculo mais de uma vez.",
				[2] = "Geralmente mapas grandes com teias de aranha ou lavas desviáveis, às vezes usando águas invisíveis para simular voo.",
				[3] = "Mapas mais difíceis que requem múltiplas habilidades para serem completados.",
				[4] = "Mapas que tem como obstáculo principal o afogamento na água.",
				[5] = "Mapas baseados principalmente em teleportes de lava.",
				[6] = "Mapas que requerem novas habilidades, com mecanismos ou algo que o faça pensar antes de agir.",
				[7] = "Mapas baseados em velocidade e agilidade, construídos em sua maioria por pisos de gelo.",
				[8] = "Mapas baseados em mecanismos/técnicas com bolas de neve.",
				[9] = "Mapas com gameplays diferentes que não se encaixam em nenhuma outra categoria, também dá espaço aos <i>mapas vanilla</i>.",
				[10] = "Mapas em que você pode completar sozinho (em maioria), mas com caminhos mais rápidos quando há trabalho em equipe entre os jogadores.",
				[11] = "Mapas com vampiros.",
				[12] = "Casas sem jogabilidade, apenas um lugar para noobs.",
			},
			
			welcome = "Bem-vindo ao #%s! Você pode ser o rato mais rápido usando os efeitos dos pisos? Prove!\n<PS>Pressione H para mais informações!",
			developer = "Desenvolvido por %s",
			
			shop = {
				coin = "Moedas",
				power = "Poder do piso",
				upgrade = "Melhorar",
				price = "Preço de aprimoramento",
				close = "Fechar",
			},
			bought = "Você acaba de gastar %s moedas pelo piso %s!",
			cantbuy = "Você não tem moedas suficientes para comprar esta atualização! :(",
			
			profile = "Rank : %s\n\n<N>Partidas : %s\n<N>Pódios : %s\n\n<N>Mortes : %s\n\n<N>Moedas na loja : %s",
			
			gotcoin = "Você acaba de conseguir %s moedas! :D",
			zombie = "Agora você é um zumbi!",
			countstats = {
				mice = "Ao menos 5 ratos são necessários para as estatísticas serem contabilizadas",
				tribe = "Estatísticas não são contabilizadas em cafofos de tribo"
			},
			
			powersenabled = "Os poderes dos pisos foram ativados! Boa sorte!",
			tribehouse = "Este lugar é uma casa. Sem estatísticas, sem gameplay. Divirta-se com seus amigos",
			
			language = "Idioma atual : <J>%s",
			
			password = {
				on = "Nova senha : %s",
				off = "Senha desativada!"
			},

			commands = {
				shop = "loja",
				profile = "perfil",
				help = "ajuda",
				langue = "idioma",
				leaderboard = "rank",
				info = "info",
				pw = "senha",
			},
			
			menu = {
				[1] = {"%s","\tSeu objetivo neste mini-game é coletar o queijo o mais rápido possível, utilizando os efeitos que cada piso oferecer."},
				[2] = {"Submodos","%s\nVocê também pode gostar de jogar\n%s"},
				[3] = {"Efeitos dos pisos","Clique no nome do piso para ler mais.\n\n%s"},
				[4] = {"Comandos",{
					[1] = {"\t<J>» Usuário</J>\n",{
						[1] = "<VP>!%s</VP> <PS>nomeDoJogador</PS> <R>ou</R> <VP>Tecla P</VP> - Abre o perfil!",
						[2] = "<VP>!%s</VP> <R>ou</R> <VP>Tecla O</VP> - Abre a loja!",
						[3] = "<VP>!%s</VP> - Altera o idioma!",
					}},
					[2] = {"\n\t<J>» Outros</J>\n",{
						[1] = "<VP>!%s</VP> <R>ou</R> <VP>Tecla H</VP> - Abre o menu de ajuda!",
						[2] = "<VP>!%s</VP> - Abre o ranking!",
						[3] = "<VP>!%s</VP> - Abre a ajuda de acordo com o piso que você está pisando!",
						[4] = "<VP>!%s</VP> - Mostra as informações do mapa se estiver na rotação!",
					}},
					[3] = {"\n\t<J>» Administrador da sala</J>\n",{
						[1] = "<VP>!%s</VP> <PS>senha</PS> - Adiciona ou remove uma senha na sala!",
					}},
				}},
				[5] = {"Mapas","<J>Mapas : %s\n\n\tAcesse %s e envie seu mapa. Não se esqueça de ler todas as regras antes!"},
				[6] = {"Agradecimentos","<R>%s <G>- <N>Desenvolvedor\n%s <G>- <N>Tradutores\n%s <G>- <N>Avaliadores de mapa"},
			},
			max = "15a2df3e699",
		
			rooms = {
				bootcamp = "Você é um bootcamper? Se sim, jogue na sala #grounds0bootcamp APENAS com mapas bootcamp!",
				racing = "Você ama correr? Você pode jogar todos os mapas racing na sala #grounds0racing!"
			},
		},