	concat = function(k,v)
		if type(v) == "table" then
			return table.concat(v,"\n",function(i,j) return mode.grounds.concat(i,j) end)
		else
			return v
		end
	end,
	listener = function(t,st,from)
		from = (from and from.."." or "")
		for k,v in next,t do
			if type(v) == "table" then
				mode.grounds.listener(v,st,from .. tostring(k))
			else
				st[#st + 1] = from .. k
			end
		end
		return st
	end,