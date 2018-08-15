	displayNames = function()
		if #mode.jokenpo.players == 0 then
			return ""
		else
			return "   <G>|   <N>" .. system.getTranslation().players .. " : " .. table.list(mode.jokenpo.players," <V>- ",function(k,v)
				tfm.exec.setNameColor(v.name,mode.jokenpo.colors[v.id])
				return v.color .. v.name
			end)
		end
	end,