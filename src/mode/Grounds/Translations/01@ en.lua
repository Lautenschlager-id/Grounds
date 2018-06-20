		en = {
			-- Data
			grounds = {
				-- Ground, Description
				[0] = {"Wood","?","?"},
				[1] = {"Ice","Increases your speed by pressing spacebar","Increases the speed in <BL>%s%%</BL>"},
				[2] = {"Trampoline","?","?"},
				[3] = {"Lava","Teleports you to the last Z indexed ground","?"},
				[4] = {"Chocolate","?","?"},
				[5] = {"Earth","?","?"},
				[6] = {"Grass","?","?"},
				[7] = {"Sand","Creates a sand storm","Decreases the storm in <BL>%s%%</BL>"},
				[8] = {"Cloud","Enables you to fly by pressing spacebar","Increases the fly in <BL>%s%%</BL>"},
				[9] = {"Water","Drowns you","Drowns you <BL>%s%%</BL> slower"},
				[10] = {"Stone","Creates a block of stone by pressing spacebar","Increases the block size in <BL>%s%%</BL>"},
				[11] = {"Snow","Shoots snowballs by pressing spacebar","Increases the snowball speed in <BL>%s%%</BL>"},
				[12] = {"Rectangle","Each color has its own function","?",{
					["C90909"] = "Kills you",
					["18C92B"] = "Revives all the enemies",
					["555D77"] = "Respawning Checkpoint",
				}},
				[13] = {"Circle","Each color has its own function","?"},
				[14] = {"Invisible","?","?"},
				[15] = {"Spiderweb","Teleports you to the spawn point","?"},
			},
			categories = {
				[1] = "Often long maps that, in most of the cases, the players must pass the same obstacles more than once.",
				[2] = "Usually long maps with dodgeable spiderwebs or lavas, sometimes using invisible waters to simulate a fly.",
				[3] = "Harder maps that requires multiple skills to be completed.",
				[4] = "Maps that has as main obstacle the water drowning.",
				[5] = "Maps based mainly on lava teleports.",
				[6] = "Maps that requires a new skill, with mechanisms or something that makes you think before act.",
				[7] = "Maps based on speed and agility, built mostly with ice grounds.",
				[8] = "Maps based on snowball mechanisms/techniques.",
				[9] = "Maps with different gameplays that doesn't fit any other category, also locates the <i>vanilla maps</i>.",
				[10] = "Soloable (mostly) maps, but with faster paths when the players work together.",
				[11] = "Maps with vampires.",
				[12] = "Houses without gameplay, only a place for noobs.",
			},

			-- Init
			welcome = "Welcome to #%s! Can you be the fastest mouse using the ground effects? Try it!\n<PS>Press H for more info!",
			developer = "Developed by %s",
			
			-- Shop
			shop = {
				coin = "Coins",
				power = "Ground power",
				upgrade = "Upgrade",
				price = "Upgrade price",
				close = "Close",
			},
			bought = "You just spent %s coins for the ground %s!",
			cantbuy = "You haven't coins enough in order to buy this upgrade! :(",
			
			-- Profile
			profile = "Leaderboard : %s\n\n<N>Rounds : %s\n<N>Podiums : %s\n\n<N>Deaths : %s\n\n<N>Shop Coins : %s",
			
			-- Gameplay
			gotcoin = "You just got %s coins! :D",
			zombie = "Now you are a zombie!",
			countstats = {
				mice = "At least 5 mice are needed to stats count",
				tribe = "Stats do not count in tribe houses"
			},
			
			-- New map
			powersenabled = "The ground powers were enabled! Good luck!",
			tribehouse = "This is a House place. No stats, no gameplay. Enjoy with your friends",
			
			-- Language
			language = "Current language : <J>%s",
			
			-- Settings
			password = {
				on = "New password : %s",
				off = "Password disabled!"
			},
			
			-- Commands
			commands = {
				shop = "shop",
				profile = "profile",
				help = "help",
				langue = "langue",
				leaderboard = "leaderboard",
				info = "info",
				pw = "password",
				mapinfo = "mapinfo",
			},
			
			-- Menu
			menu = {
				[1] = {"%s","\tYour aim in this minigame is to collect the cheese as fast as you can using the effects each gound has to offer."},
				[2] = {"Submodes","%s\n<J>You may also like to play\n%s"},
				[3] = {"Ground effects","Click in the ground's name to read more.\n\n%s"},
				[4] = {"Commands",{
					[1] = {"\t<J>» User</J>\n",{
						[1] = "<VP>!%s</VP> <PS>playerName</PS> <R>or</R> <VP>Key P</VP> - Opens the profile!",
						[2] = "<VP>!%s</VP> <R>or</R> <VP>Key O</VP> - Opens the shop!",
						[3] = "<VP>!%s</VP> - Changes the language!",
					}},
					[2] = {"\n\t<J>» Others</J>\n",{
						[1] = "<VP>!%s</VP> <R>or</R> <VP>Key H</VP> - Opens the help menu!",
						[2] = "<VP>!%s</VP> - Opens the leaderboard!",
						[3] = "<VP>!%s</VP> - Opens the help according to the ground you are on!",
						[4] = "<VP>!%s</VP> - Displays the map info if it is in the rotation!",
					}},
					[3] = {"\n\t<J>» Room admin</J>\n",{
						[1] = "<VP>!%s</VP> <PS>password</PS> - Adds or removes a password in the room!",
					}},
				}},
				[5] = {"Maps","<J>Maps : %s\n\n\tAccess %s and send your map. Do not forget to read all the rules before!"},
				[6] = {"Thanks for","<R>%s <G>- <N>Developer\n%s <G>- <N>Translators\n%s <G>- <N>Map evaluators"},
			},
			max = "15a2df47d2e",
			
			-- Rooms
			rooms = {
				bootcamp = "Are you a bootcamper? If so, play at room #grounds0bootcamp with bootcamp maps ONLY!",
				racing = "Do you love running? You can play all the racing maps at room #grounds0racing!"
			},
		},
