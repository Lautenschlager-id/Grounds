system.objects = {
	image = {},
	textarea = {}
}
eventOnModeChange = function()
	-- Remove content
	for k in next,system.objects.image do
		tfm.exec.removeImage(k)
	end
	
	for k in next,system.objects.textarea do
		ui.removeTextArea(k,nil)
	end
	
	system.objects = {
		image = {},
		textarea = {}
	}
	
	ui.addPopup(0,0,"",nil,-1500,-1500)
	
	-- Unbind keyboard and mouse, also normalize color name and scores
	for k in next,tfm.get.room.playerList do
		for i = 0,255 do
			for v = 0,1 do
				system.bindKeyboard(k,i,v == 0,false)
			end
		end
		
		system.bindMouse(k,false)
		
		tfm.exec.setNameColor(k,-1)
		tfm.exec.setPlayerScore(k,0)
	end
	
	-- Set admin back
	system.roomAdmins = system.setAdmins()
	
	-- Reset settings
	tfm.exec.snow(0)
	for k,v in next,{"AutoScore","WatchCommand","AutoNewGame","AutoShaman","AllShamanSkills","MortCommand","DebugCommand","MinimalistMode","AfkDeath","PhysicalConsumables","AutoTimeLeft"} do
		tfm.exec["disable" .. v](false)
	end
	tfm.exec.setAutoMapFlipMode()
	
	tfm.exec.setRoomMaxPlayers(25)
	tfm.exec.setRoomPassword("")	
end
