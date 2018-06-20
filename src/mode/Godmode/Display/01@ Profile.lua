	profile = function(n,p)
		ui.addTextArea(0,"<p align='center'><B><R><a href='event:profile.close'>X",n,513,115,20,20,1,1,1,true)
		ui.addTextArea(1,"<p align='center'><font size='16'><B><V>"..p.."</V></B></font></p><p align='left'><font size='12'>\n<N>" .. string.format(system.getTranslation().profile,mode.godmode.info[p].title,"<V>"..mode.godmode.info[p].roundSha,"<J>"..mode.godmode.info[p].cheeseMice,"<R>"..mode.godmode.info[p].deathMice,"<V>"..mode.godmode.info[p].deathSha),n,290,115,220,160,1,1,1,true)
	end,