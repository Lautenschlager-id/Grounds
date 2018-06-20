		de = {
			grounds = {
				[0] = {"Holz","?","?"},
				[1] = {"Eis","Beschleunigt dich indem du die Leertaste drückst","Erhoht die geschwindigkeit in <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lava","Teleportiert dich zum letzen Z Index Boden","?"},
				[4] = {"Schokolade","?","?"},
				[5] = {"Erde","?","?"},
				[6] = {"Gras","?","?"},
				[7] = {"Sand","Kreiert einen Sandsturm","Verringert die sturm in <BL>%s%%</BL>"},
				[8] = {"Wolke","Du kannst fliegen indem du die Leertaste drückst","Erhoht die fliege in <BL>%s%%</BL>"},
				[9] = {"Wasser","Ertränkt dich","Ertrinkt dich <BL>%s%%</BL> langsamer"},
				[10] = {"Stein","Erschaffe einen Stein indem du die Leertaste drückst","Erhoht die blockgrosse in <BL>%s%%</BL>"},
				[11] = {"Schnee","Wirf Schneebälle indem du die Leertaste drückst","Erhoht die schneeball geschwindigkeit in <BL>%s%%</BL>"},
				[12] = {"Rechteck","Jede Farbe hat seine eigene Funktion","?",{
					["C90909"] = "Tötet du",
					["18C92B"] = "Aufleben alle Feinde",
					["555D77"] = "Respawning Checkpoint", -- *
				}},
				[13] = {"Kreis","Jede Farbe hat seine eigene Funktion","?"},
				[14] = {"Unsichtbar","?","?"},
				[15] = {"Spinnweben","Teleportiert dich zum Startpunkt","?"},
			},
			
			welcome = "Willkommen zu #%s! Kannst du die schnellste Maus mit den Bodeneffekten sein? Versuch es!\n<PS>Drück H für mehr informationen!",
			developer = "Entwickelt von %s",
			
			shop = {
				coin = "Munzen",
				power = "Bodenleistung",
				upgrade = "Aktualisierung",
				price = "Upgrade Preis",
				close = "Schliessen",
			},
			bought = "Du hast %s Münzen für den Boden %s ausgegeben!",
			cantbuy = "Du hast nicht genügend Münzen um dieses Upgrade zu kaufen! :(",
			
			profile = "Bestenliste : %s\n\n<N>Runden: %s\n<N>Podiums: %s\n\n<N>Tode : %s\n\n<N>Shop Münzen: %s",
			
			gotcoin = "Du hast soeben %s Münzen erhalten! :D",
			zombie = "Du bist nun ein Zombie!",
			countstats = {
				mice = "Es müssen mindestens 5 Mäuse im Raum sein damit die Stats zählen",
				tribe = "Stats zählen in Stammeshäusern nicht"
			},
			
			powersenabled = "Der Effekt des Bodens wurde aktiviert! Viel Glück!",
			
			language = "Aktuelle Sprache : <J>%s",
			
			password = {
				on = "Neu passwort: : %s",
				off = "Passwort deaktiviert!"
			},
			
			commands = {
				shop = "shop",
				profile = "profil",
				help = "hilfe",
				langue = "sprache",
				leaderboard = "bestenliste",
				info = "info",
				pw = "passwort",
			},
			
			menu = {
				[1] = {"%s","\tDein Ziel in diesem Minigame ist es den Käse so schnell wie möglich zu sammeln, indem du die verschiedenen Effekte der Böden ausnutzt."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Bodeneffekte","Klicken in den bodens namen um mehr zu lesen.\n\n%s"},
				[4] = {"Kommandos",{
					[1] = {"\t<J>» Benutzer</J>\n",{
						[1] = "<VP>!%s</VP> <PS>Spielername</PS> <R>oder</R> <VP>Taste P</VP> - Öffnet das Profil!",
						[2] = "<VP>!%s</VP> <R>oder</R> <VP>Taste O</VP> - Öffnet den Shop!",
						[3] = "<VP>!%s</VP> - Ändert die Sprache!\n",
					}},
					[2] = {"\t<J>» Anderes</J>\n",{
						[1] = "<VP>!%s</VP> <R>oder</R> <VP>Taste H</VP> - Öffnet das Hilfsmenu!",
						[2] = "<VP>!%s</VP> - Öffnet die Bestenliste!",
						[3] = "<VP>!%s</VP> - Öffnet die hilfe nach dem boden auf dem du bist auf!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!", -- *
					}},
					[3] = {"\n\t<J>» Zimmer admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>passwort</PS> - Hinzufugen oder entfernen eines passwortes im raum!",
					}},
				}},
				[5] = {"Maps","<J>Maps : %s\n\n\tBesuche das Thema %s und reiche deine Map ein. Vergiss nicht zuvor alle Regeln zu lesen!"},
				[6] = {"Danke an ","<R>%s <G>- <N>Entwickler\n%s <G>- <N>Übersetzer\n%s <G>- <N>Landkarte bewerter"},
			},
		},
