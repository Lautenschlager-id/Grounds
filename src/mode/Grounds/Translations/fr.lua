		fr = {
			grounds = {
				[0] = {"Bois","?","?"},
				[1] = {"Glace","Augmente votre vitesse en appuyant sur Espace","Augmente la vitesse de <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lave","Vous téléporte au sol avec le dernier indice Z","?"},
				[4] = {"Chocolat","?","?"},
				[5] = {"Terre","?","?"},
				[6] = {"Herbe","?","?"},
				[7] = {"Sable","Crée une tempête de sable","Diminue la tempête de <BL>%s%%</BL>"},
				[8] = {"Nuage","Vous donne la possibilité de voler en appuyant sur Espace","Augmente le vol de <BL>%s%%</BL>"},
				[9] = {"Eau","Vous noie","Vous noie <BL>%s%%</BL> plus lentement"},
				[10] = {"Pierre","Crée un bloc de pierre en appuyant sur Espace","Augmente la taille du bloc de <BL>%s%%</BL>"},
				[11] = {"Neige","Tire des boules de neige en appuyant sur Espace","Augmente la vitesse de la boule de neige de <BL>%s%%</BL>"},
				[12] = {"Rectangle","Chaque couleur a sa propre fonction","?",{
					["C90909"] = "Te tue",
					["18C92B"] = "Ressuscite tous les ennemis",
				}},
				[13] = {"Cercle","Chaque couleur a sa propre fonction","?"},
				[14] = {"Invisible","?","?"},
				[15] = {"Toile d'araignée","Vous téléporte au point de spawn","?"},
			},
			
			welcome = "Bienvenue à #%s! Pouvez vous être la souris la plus rapide grâce aux effets des sols? Essayez!\n<PS>Appuyez sur H pour plus d'informations!",
			developer = "Développé par %s",

			shop = {
				coin = "Pièces",
				power = "Force du sol",
				upgrade = "Améliorer",
				price = "Coût d'amélioration",
				close = "Fermer",
			},
			bought = "Vous venez de dépenser %s pièces pour le sol %s!",
			cantbuy = "Vous n'avez pas assez de pièces pour acheter cette amélioration! :(",
			
			profile = "Leaderboard : %s\n\n<N>Parties : %s\n<N>Podiums : %s\n\n<N>Morts : %s\n\n<N>Shop Pièces : %s",
			
			gotcoin = "Vous venez de recevoir %s pièces! :D",
			countstats = {
				mice = "Au moins 5 souris sont nécessaires pour que les statistiques comptent",
				tribe = "Les statistiques ne comptent pas en maison de tribu"
			},
			zombie = "Vous êtes maintenant un zombie!",
			
			powersenabled = "Les pouvoirs des sols ont été activés! Bonne chance!",
	
			language = "Langage actuel : <J>%s",
			
			password = {
				on = "Nouveau mot de passe : %s",
				off = "Mot de passe désactivé!"
			},
			
			commands = {
				shop = "magasin",
				profile = "profil",
				help = "aide",
				langue = "langue",
				leaderboard = "leaderboard",
				info = "info",
				pw = "password",
			},
			
			menu = {
				[1] = {"%s","\tVotre but dans ce minijeu est de collecter le fromage aussi vite que possible, en utilisant les effets des différents sols."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Effets du sol","Clique sur le nom du salon pour en lire plus.\n\n%s"},
				[4] = {"Commandes",{
					[1] = {"\t<J>» Joueur</J>\n",{
						[1] = "<VP>!%s</VP> <PS>playerName</PS> <R>ou</R> <VP>Touche P</VP> - Ouvre le profil !",
						[2] = "<VP>!%s</VP> <R>ou</R> <VP>Touche O</VP> - Ouvre le magasin !",
						[3] = "<VP>!%s</VP> - Change la langue !\n",
					}},
					[2] = {"\t<J>» Autres</J>\n",{
						[1] = "<VP>!%s</VP> <R>ou</R> <VP>Touche H</VP> - Ouvre le menu d'aide !",
						[2] = "<VP>!%s</VP> - Ouvre le leaderboard!",
						[3] = "<VP>!%s</VP> - Ouvre l'aide en fonction du sol sur lequel vous vous trouvez!",
						[4] = "<VP>!%s</VP> - Affiche les informations de la carte si elle est dans la rotation!"
					}},
					[3] = {"\n\t<J>» Place admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>mot de passe</PS> - Ajoute ou supprime un mot de passe dans la chambre.",
					}},
				}},
				[5] = {"Cartes","<J>Cartes : %s\n\n\tAccédez à %s et envoyez votre carte. N'oubliez pas de lire toutes les règles avant!"},
				[6] = {"Merci à","<R>%s <G>- <N>Développeur\n%s <G>- <N>Traducteurs\n%s <G>- <N>Evaluateurs de maps"},
			},
		},
