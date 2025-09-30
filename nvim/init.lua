vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 2
vim.opt.winborder = "rounded"
-- vim.opt.cursorline = true
vim.opt.guicursor = {
	"n-c:block", -- Normal and Command-line = block
	"i:block",  -- Insert = block
	"v:block",  -- Visual = underscore
	-- "v:hor",      -- Visual = underscore
}

-- require("custom.grep")
require("custom.fisherman")

local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>v', ':e $MYVIMRC<CR>')
map('n', '<leader>z', ':e ~/.config/zsh/.zshrc<CR>')
map('n', '<leader>s', ':e #<CR>')
map('n', '<leader>S', ':sf #<CR>')
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>c', '1z=')
vim.keymap.set("n", "mm", "m", { desc = "Set mark" })
vim.keymap.set("n", "mj", "`", { desc = "Jump to mark" })


vim.pack.add({
	{ src = "https://github.com/SmiteshP/nvim-navic" },
	-- { src = "https://github.com/ellisonleao/gruvbox.nvim" },
	-- { src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/utilyre/barbecue.nvim" },
	{ src = "https://github.com/crispgm/nvim-tabline" },
	{ src = "https://github.com/rivado-e/vivid" },
	{ src = "https://github.com/rivado-e/chroma" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/rose-pine/neovim" },
	-- { src = "https://github.com/xiyaowong/transparent.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

require "mason".setup()
require "mini.pick".setup()
require "oil".setup()

map('n', '<leader>sf', ":Pick files<CR>")
map('n', '<leader><leader>', ":Pick buffers<CR>")
map('n', '<leader>sg', ":Pick grep_live<CR>")
-- map('n', '<leader>h', ":Pick help<CR>")

vim.lsp.enable({ "lua_ls", "ocamllsp", "clangd", "rust-analyzer", "zls", "asm_lsp" })
-- map('i', '<C-Space>', "<C-x><C-o>")


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)
		end
	end,
})

-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set('n', '<leader>fe', ":Oil<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "H", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-w>i", vim.lsp.buf.hover)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<Up>", ":resize -2<CR>")
vim.keymap.set("n", "<Down>", ":resize +2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>tt", ":tabnew <CR>", { desc = "new tab" })
vim.keymap.set("n", "<leader>td", ":tabclose <CR>", { desc = "close tab" })
vim.keymap.set("n", "J", ":tabprevious <CR>", { desc = "prev tab" })
vim.keymap.set("n", "K", ":tabnext <CR>", { desc = "next tab" })
vim.keymap.set("v", "yy", '"+y')
vim.keymap.set("n", "<leader>de", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics (global)" })



-- vim.cmd("set completeopt+=noselect")
require('nvim-treesitter.configs').setup({ highlight = { enable = true, }, })
require('tabline').setup({})
require("barbecue").setup()
require("oil").setup({
	columns = {
		-- "icon",
		"permissions",
		"size",
	},
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { vertical = true }, },
		["<C-h>"] = { "actions.select", opts = { horizontal = true }, },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
	},
})


-- colors
-- require "my_vivid".setup({ transparent = true })
require("rose-pine").setup({
	styles = {
		italic       = false,
		transparency = true,
	},
})


-- vim.cmd("colorscheme rose-pine")
vim.cmd.colorscheme("chroma")
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e2e2e" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#262626" })
-- vim.highlight.priorities.semantic_tokens = 90
vim.diagnostic.enable(false)

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

require("luasnip").setup({ enable_autosnippets = true })
map("i", "<C-e>", function() ls.expand_or_jump(1) end, { silent = true })
map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
map({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })
ls.add_snippets("cpp", {
	s("cp", { t(vim.fn.readfile("/Users/rivaldoe/Null/chantier/comp/templates/templ.cpp"))
	}),
})

local lspconfig = require("lspconfig")

lspconfig.sourcekit.setup({
	cmd = { "sourcekit-lsp", },
	filetypes = { "swift" },
	root_dir = lspconfig.util.root_pattern("Package.swift", ".xcodeproj", ".xcworkspace", ".git"),
})

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
		},
	},
})
