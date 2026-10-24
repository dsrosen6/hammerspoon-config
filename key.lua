---@alias Modifier "cmd"|"ctrl"|"alt"|"shift"

local M = {}

---@type Modifier[]
M.hyper = { "cmd", "ctrl", "alt" }
---@type Modifier[]
M.hyperShift = { "cmd", "ctrl", "alt", "shift" }

return M
