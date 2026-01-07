if vim.g.loaded_motionflow then
	return
end
vim.g.loaded_motionflow = true

require("motionflow").setup()
