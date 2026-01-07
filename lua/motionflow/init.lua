local tracker = require("motionflow.tracker")
local ui = require("motionflow.ui")

local M = {}
M.enabled = false

function M.toggle()
	M.enabled = not M.enabled
	if not M.enabled then
		ui.hide()
	end
end

function M.setup()
	vim.on_key(function(key)
		if not M.enabled then
			return
		end
		tracker.on_key(key)
		ui.show("🧭 " .. tracker.flow())
	end, M)

	vim.api.nvim_create_user_command("MotionFlow", function()
		M.toggle()
	end, {})
end

return M
