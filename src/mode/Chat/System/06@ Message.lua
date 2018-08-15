	newMessage = function(message,n)
		mode.chat.messageId = mode.chat.messageId + 1
		table.insert(mode.chat.data,{mode.chat.messageId,n,string.gsub(string.gsub(message,"@%((.*)%)",function(text) return text end),"{.-:(.-)}",function(text) return text end)})
	
		if mode.chat.getTextLength(message) > 50 then
			message = string.sub(message,1,47) .. "..."
		end
		message = string.gsub(message,"<","&lt;") -- < to <
		message = string.gsub(message,"https?","") -- https to ""
		message = string.gsub(message,"://","") -- :// to ""
		message = string.gsub(message,"@%((.*)%)",function(text) -- @(link:text)
			return string.format("<a href='event:display.%s'>%s</a>",mode.chat.messageId,text)
		end)
		
		if #message > 0 then
			if string.sub(message,1,1) == "/" then
				mode.chat.eventChatCommand(n,string.sub(message,2))
			else
				message = string.gsub(message,"{(.-):(.-)}",function(color,text) -- {colorTag:Text}
					color = string.upper(color)
					if table.find({"BV","R","BL","J","N","N2","PT","CE","CEP","CS","S","PS","G","V","VP","VI","ROSE","CH","T"},color) then
						return string.format("<%s>%s</%s>",color,text,color)
					else
						return text
					end
				end)
				
				local nick = n:gsub("#0000", ""):gsub("#", " #")
				table.insert(mode.chat.displayData,1,string.format("<V>[%s] <N>%s\n",nick,message))
			end
		end
	end,