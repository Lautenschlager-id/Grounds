	meta = {
		add = {
			__add = function(listOne,listTwo) -- Link two tables in one
				local out = {}
				for k,v in next,{listOne,listTwo} do
					for i,j in next,v do
						out[(type(i) == "string" and i or #out+1)] = j
					end
				end
				
				return setmetatable(out,getmetatable(listOne))
			end
		},
	},
