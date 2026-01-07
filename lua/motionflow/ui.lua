local M = {}

M.buf = nil
M.win = nil

function M.show(text)
	if M.win and vim.api.nvim_win_is_valid(M.win) then
		vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, { text })
		return
	end

	M.buf = vim.api.nvim_create_buf(false, true)
	M.win = vim.api.nvim_open_win(M.buf, false, {
		relative = "editor",
		row = 1,
		col = vim.o.columns - 45,
		width = 42,
		height = 1,
		style = "minimal",
		border = "rounded",
	})

	vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, { text })
end

function M.hide()
	if M.win and vim.api.nvim_win_is_valid(M.win) then
		vim.api.nvim_win_close(M.win, true)
	end
	M.win = nil
end

return M
