require("core.options")
require("core.keymaps")
require("core.autocommands")

vim.g.have_nerd_font = true
-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	-- require("plugins.autoformating"),
	require("plugins.confom"),
	require("plugins.lspsaga"),
	require("plugins.misc"),
	require("plugins.gisigns"),
	require("plugins.indent-blanklines"),
	require("plugins.lazygit"),
	require("plugins.obsidian"),
})
