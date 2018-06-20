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
