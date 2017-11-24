--
local M = {}

M.has_focus = true
M.initilized = false

M.DIMMING_OFF = window.DIMMING_OFF
M.DIMMING_ON = window.DIMMING_ON
M.DIMMING_UNKNOWN = window.DIMMING_UNKNOWN
M.WINDOW_EVENT_FOCUS_GAINED = window.WINDOW_EVENT_FOCUS_GAINED
M.WINDOW_EVENT_FOCUS_LOST = window.WINDOW_EVENT_FOCUS_LOST
M.WINDOW_EVENT_RESIZED = window.WINDOW_EVENT_RESIZED

M.listeners = {}


local function window_listener(self, event, data)
	for key, value in pairs(M.listeners) do
		M.listeners[key](self, event, data)
	end
end

function M.init()
	if M.initilized == false then
		window.set_listener(window_listener)
		M.initilized = true
	end
end

function M.add_listener(func)
	table.insert(M.listeners, func)
end

function M.clear_listeners()
	M.listeners = {}
end

return M