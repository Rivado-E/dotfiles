return {
	"Rivado-E/vivid",
	name = "vivid",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("my_vivid")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#252525" })
		-- vim.cmd([[highlight CursorLine guibg=#252525 guifg=NONE]])
	end,
}
