hs.loadSpoon("EmmyLua")
local apps = require("apps")
local key = require("key")

hs.hotkey.bind(key.hyperShift, "r", hs.reload)
hs.hotkey.bind({ "cmd", "alt" }, "l", hs.caffeinate.lockScreen)

apps.bindApps(key.hyper, {
	E = "Finder",
	B = "Firefox",
	A = "Claude",
	D = "Discord",
	S = "Music",
	T = "Messages",
	Return = "Ghostty",
	["1"] = "1Password",
	[","] = "System Settings",
})

apps.bindApps(key.hyperShift, {
	Return = "Herdr",
})
