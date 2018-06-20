	getID = coroutine.wrap(function(class)
		local id,i = 0
		while true do
			i = ({2,4,3})[class]
			class = coroutine.yield(id)
			id = id + i
		end
	end),
