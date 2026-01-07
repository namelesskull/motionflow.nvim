local tracker = require("motionflow.tracker")
local ui = require("motionflow.ui")

local M = {
	enabled = false,
}

local ns = vim.api.nvim_create_namespace("motionflow")

function M.toggle()
	M.enabled = not M.enabled
	if not M.enabled then
		ui.hide()
	end
end

function M.setup()
	vim.api.nvim_create_user_command("MotionFlow", function()
		M.toggle()
	end, {})

	vim.on_key(function(key)
		if not M.enabled then
			return
		end
		tracker.on_key(key)
		ui.show("🧭 " .. tracker.flow())
	end, ns)
end

return M
