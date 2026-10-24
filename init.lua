hs.loadSpoon("EmmyLua")
local apps = require("apps")
local key = require("key")
local hyper, hyperShift = key.hyper, key.hyperShift

hs.hotkey.bind(hyperShift, "r", hs.reload)

apps.bindApps(hyper, {
	E = "Finder",
	B = "Firefox",
	A = "Claude",
	Return = "Ghostty",
})
