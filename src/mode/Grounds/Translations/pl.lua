		pl = {
			grounds = {
				[0] = {"Drewno","?","?"},
				[1] = {"Lód","Zwiększa twoją szybkość, gdy klikasz spację","Zwiększa prędkość w <BL>%s%%</BL>"},
				[2] = {"Trampolina","?","?"},
				[3] = {"Lawa","Przenosi ciebie do ostatniego indexu Z","?"},
				[4] = {"Czekolada","?","?"},
				[5] = {"Ziemia","?","?"},
				[6] = {"Trawa","?","?"},
				[7] = {"Piasek","Tworzy burzę piaskową","Zmniejsza storm w <BL>%s%%</BL>"},
				[8] = {"Chmura","Pozwala tobie latać, gdy klikasz spację","Zwiększa latanie w <BL>%s%%</BL>"},
				[9] = {"Woda","Topi ciebie","Topi <BL>%s%%</BL> wolniej"},
				[10] = {"Kamień","Powoduje, że możesz stworzyć blok kamienia, wciskając spację","Zwiększa wielkość bloku w <BL>%s%%</BL>"},
				[11] = {"Śnieg","Powoduje, że możesz strzelić śnieżką, wciskając spację","Zwiększa prędkość śnieżki w <BL>%s%%</BL>"},
				[12] = {"Trójkąt","Każdy kolor ma swoją funkcję","?",{
					["C90909"] = "Zabija ciebie",
					["18C92B"] = "Ożywia wszystkich przeciwników",
					["555D77"] = "Ponowne spawnowanie Checkpointów",
				}},
				[13] = {"Koło","Każdy kolor ma swoją funkcję","?"},
				[14] = {"Niewidzialność","?","?"},
				[15] = {"Pajęcza sieć","Przenosi ciebie do miejsca spawnu","?"},
			},
			categories = {
				[1] = "Często długie mapy, w większości przypadków, gracze muszą przejść takie same przeszkody.",
				[2] = "Zwyczajnie długie mapy z lawami i pajęczynami, czasami używana woda aby zasymulować latanie.",
				[3] = "Trudniejsze mapy, które wymagają większej ilości zdolności, aby zostały ukończone.",
				[4] = "Mapy, które jako główną mapę mają wodę, w której myszki się topią.",
				[5] = "Mapy bazowane głównie na teleportacji z lawy.",
				[6] = "Mapy, które wymagają nowej zdolności, z mechanizmem albo czymś co powoduje, że musisz myśleć zanim coś zrobisz.",
				[7] = "Mapy bazowane na szybkości i zwinności, budowane najczęsciej z gruntów lodu.",
				[8] = "Mapy bazowane na technikach/mechanikach śnieżnych kulek.",
				[9] = "Mapy z zupełnie inną rozgrywką niż inne kategorie, również znaduje się w <I>mapach vanilliowych</I>.",
				[10] = "Mapy (w większości) zdolne do przejścia samemu, ale szybciej się ją przechodzi gdy gracze pracują wspólnie.",
				[11] = "Mapy z wampirami.",
				[12] = "Chatki plemienne bez rozgrywki, są miejscem tylko dla noobków.",
			},
			
			welcome = "Witaj w #%s! Możesz zostać najszybszą myszką, używając moce gruntów? Spróbuj!\n<PS>Wciśnij H, aby otrzymać więcej informacji!",
			developer = "Stworzone przez %s",
			
			shop = {
				coin = "Kredyty",
				power = "Moc gruntu",
				upgrade = "Ulepsz",
				price = "Cena ulepszenia",
				close = "Zamknij",
			},
			bought = "Wydałeś %s monet na %s!",
			cantbuy = "Nie masz wystarczającej ilości monet, żeby zakupić to ulepszenie! :(",
			
			profile = "Ranking : %s\n\n<N>Rund : %s\n<N>Podia : %s\n\n<N>Zgony : %s\n\n<N>Monety : %s",

			gotcoin = "Masz %s monet! :D",
			zombie = "Zostałeś/-aś zombie!",
			countstats = {
				mice = "Przynajmniej 5 myszek jest potrzebnych aby statystyki były naliczane",
				tribe = "Statystyki nie są naliczane w chatkach plemiennych"
			},

			powersenabled = "Moce gruntów są włączone! Powodzenia!",
			tribehouse = "To jest miejsce chatki plemiennej. Bez statystyk, bez rozgrywki. Ciesz się ze swoimi znajomymi.",

			language = "Bieżący język : <J>%s",
			
			password = {
				on = "Nowe hasło : %s",
				off = "Hasło wyłączone!"
			},
			
			commands = {
				shop = "sklep",
				profile = "profil",
				help = "pomoc",
				langue = "język",
				leaderboard = "ranking",
				info = "informacje",
				pw = "hasło",
			},
			
			menu = {
				[1] = {"%s","\tTwoim zadaniem w tej minigrze jest zbieranie serka najszybciej jak potrafisz, wykorzystując moce gruntów."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Moce gruntu","Kliknij w nazwę gruntu, żeby uzyskać więcej informacji.\n\n%s"},
				[4] = {"Komendy",{
					[1] = {"\t<J>» Użytkowe</J>\n",{
						[1] = "<VP>!%s</VP> <PS>nazwaGracza</PS> <R>albo</R> <VP>Klawisz P</VP> - Otwiera profil!",
						[2] = "<VP>!%s</VP> <R>albo</R> <VP>Klawisz O</VP> - Otwiera Sklep!",
						[3] = "<VP>!%s</VP> - Zmienia język!",
					}},
					[2] = {"\t<J>» Inne</J>\n",{
						[1] = "<VP>!%s</VP> <R>albo</R> <VP>Klawisz H</VP> - Otwiera pomoc!",
						[2] = "<VP>!%s</VP> - Otwiera ranking!",
						[3] = "<VP>!%s</VP> - Otwiera pomoc zależnie, na którym gruncie jesteś!",
						[4] = "<VP>!%s</VP> - Pokazuje informacje o mapie jeżeli jest w rotacji!",
					}},
					[3] = {"\n\t<J>» Pokój z adminem</J>\n",{
						[1] = "<VP>!%s</VP> <PS>hasło</PS> - Dodaje lub usuwa hasło w pokoju.",
					}},
				}},
				[5] = {"Mapy","<J>Mapy : %s\n\n\tStwórz %s i prześlij swoją mapę. Nie zapomnij, aby najpierw przeczytać zasady!"},
				[6] = {"Podziękowania","<R>%s <G>- <N>Twórca\n%s <G>- <N>Tłumacze\n%s <G>- <N>Testerzy map"},
			},
			max = "15a2df4de75",
			
			rooms = {
				bootcamp = "Jesteś bootcamperem? Jeżeli tak, wejdź do pokoju #grounds0bootcamp gdzie są TYLKO mapki z bootcampu!",
				racing = "Kochasz biegać? Możesz zagrać we wszystkie wyścigowe mapki na #ground0racing!"
			},
		},