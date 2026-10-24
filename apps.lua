---@class Apps
local M = {}

---@param w hs.window
---@return boolean
local function isCyclable(w) return w:isStandard() and not w:isMinimized() end

--- Launch/focus app; if already focused, cycle its windows
---@param appName string App name as shown in the menu bar
function M.launchOrCycle(appName)
	local app = hs.application.get(appName)
	local wins = app and hs.fnutils.filter(app:allWindows(), isCyclable) or {}

	-- not running or no real windows: launch / reopen
	if not app or #wins == 0 then
		hs.application.launchOrFocus(appName)
		return
	end

	-- running but not frontmost: focus its most recently used real window
	if not app:isFrontmost() then
		local front = hs.fnutils.find(hs.window.orderedWindows(), function(w)
			local a = w:application()
			return a ~= nil and a:pid() == app:pid() and isCyclable(w)
		end)
		local target = front or wins[1]
		target:focus()
		return
	end

	table.sort(wins, function(a, b) return a:id() < b:id() end)

	local focused = app:focusedWindow()
	local idx = 0
	for i, w in ipairs(wins) do
		if focused and w:id() == focused:id() then
			idx = i
			break
		end
	end
	wins[idx % #wins + 1]:focus()
end

--- Bind each key in `binds` to launchOrCycle its app, using `mods`
---@param mods Modifier[] Modifier keys, e.g. {"cmd", "ctrl", "alt" for hyper}
---@param binds table<string, string> Key -> app name, e.g. { B = "Firefox" }
function M.bindApps(mods, binds)
	for key, name in pairs(binds) do
		hs.hotkey.bind(mods, key, function() M.launchOrCycle(name) end)
	end
end

return M
