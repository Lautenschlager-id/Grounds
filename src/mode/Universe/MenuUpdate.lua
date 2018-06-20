	infoBar =  function()
		local out = {
			{"<font color='#CF50DB'>%s",mode.universe.systemName},
			{system.getTranslation().buttons.classes[1] .. " : <V>%s",mode.universe.orbit[1]},
			{system.getTranslation().buttons.classes[2] .. " : <V>%s",mode.universe.orbit[2]},
			{system.getTranslation().buttons.classes[3] .. " : <V>%s",mode.universe.orbit[3]},
			{system.getTranslation().profile.exTime .. " : <V>%s",(_G.currentTime / 25)},
		}
		
		return table.concat(out,"   <G>|   <N>",function(k,v)
			return string.format(v[1],v[2])
		end) .. "<"
	end,
