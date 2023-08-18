script_name("ainscar")
script_author("Akionka and mcbright")

require "lib.moonloader"

local sampev = require "lib.samp.events"
local encoding = require 'encoding'
encoding.default = 'cp1251'
u8 = encoding.UTF8


function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
end

function sampev.onServerMessage(color, text)
	lua_thread.create(function()
		if(u8:encode(text):find("Ваш транспорт доставлен.")) then wait(500) sampSendChat("/inscar") end
	end)
end	

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if (u8:encode(text):find("Ваш транспорт доставлен.")) then
		lua_thread.create(function()
			wait(500)
			sampSendChat("/inscar")
		end)
	end
end