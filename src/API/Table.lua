table.find = function(list,value,index,f)
	for k,v in next,list do
		local i = (type(v) == "table" and index) and v[index] or v
		if (not f and i or f(i)) == value then
			return true, k
		end
	end
	return false, 0
end
table.turnTable = function(x)
	return (type(x)=="table" and x or {x})
end
table.random = function(t)
	return (type(t) == "table" and t[math.random(#t)] or math.random())
end
table.shuffle = function(t)
	local randomized = {}
	for v = 1,#t do
		table.insert(randomized,math.random(#randomized),t[v])
	end
	return randomized
end
table.merge = function(this,src)
	for k,v in next,src do
		if this[k] then
			if type(v) == "table" then
				this[k] = table.turnTable(this[k])
				table.merge(this[k],v)
			else
				this[k] = this[k] or v
			end
		else
			this[k] = v
		end
	end
end
table.copy = function(list)
	local out = {}
	for k,v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end
