	uileaderboard = function(n)
		if os.time() > mode.grounds.leaderboard.update or not n then
			mode.grounds.leaderboard = {update = os.time() + 180e3,data = {}}
			
			local players = {}
			for k,v in next,mode.grounds.info do
				if string.sub(k,1,1) ~= "*" then
					players[#players + 1] = {k,math.floor((v.stats.rounds - v.stats.deaths)/10) * (v.stats.podiums + 1)}
				end
			end
			table.sort(players,function(p1,p2) return p1[2] > p2[2] end)

			for k,v in next,players do
				mode.grounds.info[v[1]].ranking = k
				if k < 11 then
					table.insert(mode.grounds.leaderboard.data,"<J>"..k..". " .. (({"<BV>","<PS>","<CE>"})[k] or "<V>") .. "<a href='event:profile.open."..v[1].."'>".. v[1] .. "</a> <BL>- <VP>" .. v[2] .. "G")
				end
			end
			if #mode.grounds.leaderboard.data == 0 then
				mode.grounds.leaderboard.update = 0
			end
		end

		if n then
			mode.grounds.info[n].leaderboardAccessing = true
			local id,y = 25,100
			ui.addTextArea(23,"<p align='center'><B><R><a href='event:ranking.close'>X",n,603,35,20,20,1,1,1,true)
			ui.addTextArea(24,"<p align='center'><font size='45'>" .. string.nick(mode.grounds.cmds.leaderboard),n,200,35,400,350,0x073247,1,1,true)

			local foo = function(name)
				return "'><a:active>"..name.."</a:active></a>"
			end
			for i = 1,10 do
				local v = mode.grounds.leaderboard.data[i] or ""
				local color = id % 2 == 0 and 0x123e54 or 0x042636
				if string.find(v,n) then
					v = string.gsub(v,"'>(.-)</a>",foo)
				end
				ui.addTextArea(id,v,n,245,y,315,20,color,color,1,true)
				id = id + 1
				y = y + 28
			end

			ui.addTextArea(id,"",n,230,90,10,285,0x073247,0x073247,1,true)
			ui.addTextArea(id + 1,"",n,565,90,10,285,0x073247,0x073247,1,true)
		end
	end,
