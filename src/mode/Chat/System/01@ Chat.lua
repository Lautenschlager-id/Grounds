	chat = function(n,message,update)
		if not update then
			ui.addPopup(0,2,"",n,107,325,565,true)
		end
		ui.addTextArea(0,"",n,108,73,564,253,0x212E35,0x212E35,1,true)
		ui.addTextArea(1,message,n,110,75,560,250,0x324650,0x324650,1,true)
		ui.addTextArea(2,"<p align='center'><B><V>" .. mode.chat.chatTitle,n,108,53,564,20,0x212E35,0x212E35,1,true)
		ui.addTextArea(3,"<p align='right'><B><R><a href='event:close'>X",n,110,54,560,20,1,1,0,true)
	end,