	eventPopupAnswer = function(i,n,a)
		if #string.gsub(a," ","") > 0 then
			mode.chat.newMessage(a,n)
			mode.chat.displayChat(n,true)
		else
			mode.chat.displayChat(n)
		end
	end,