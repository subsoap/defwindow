--
local M = {}

M.has_focus = true
M.initilized = false

-- Window width and height values are probably only useful from here on PC/Web and not mobile
-- Really the Window API should include this information
-- It would be better if default render script also put window width and height into window on init
-- some possible future proofing here
M.window_width = window.window_width or tonumber(sys.get_config("display.width", 960))
M.window_height = window.window_height or tonumber(sys.get_config("display.height", 640))


M.DIMMING_OFF = window.DIMMING_OFF
M.DIMMING_ON = window.DIMMING_ON
M.DIMMING_UNKNOWN = window.DIMMING_UNKNOWN
M.WINDOW_EVENT_FOCUS_GAINED = window.WINDOW_EVENT_FOCUS_GAINED
M.WINDOW_EVENT_FOCUS_LOST = window.WINDOW_EVENT_FOCUS_LOST
M.WINDOW_EVENT_RESIZED = window.WINDOW_EVENT_RESIZED

M.listeners = {}


local function window_listener(self, event, data)

	
	if event == window.WINDOW_EVENT_FOCUS_LOST then
		M.has_focus = false
	end

	if event == window.WINDOW_EVENT_FOCUS_GAINED then
		M.has_focus = true
	end
	
	if event == window.WINDOW_EVENT_RESIZED then
		pprint(data)
		M.window_width = data.width
		M.window_height = data.height
	end
	
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

function M.get_dim_mode()
	return window.get_dim_mode()
end

function M.set_dim_on()
	return window.set_dim_mode(window.DIMMING_ON)
end

function M.set_dim_off()
	return window.set_dim_mode(window.DIMMING_OFF)
end

function M.set_dim_mode(mode)
	return window.set_dim_mode(mode)
end

function M.get_window_size()
	return M.window_width, M.window_height
end

return M