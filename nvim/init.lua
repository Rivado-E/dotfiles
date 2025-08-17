vim.cmd([[set mouse=]])
vim.opt.winborder = "rounded"
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

vim.pack.add({
	{ src = "https://github.com/rivado-e/vivid" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/xiyaowong/transparent.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
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
map('n', '<leader>h', ":Pick help<CR>")

vim.lsp.enable({ "lua_ls", "ocamllsp" })
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


vim.keymap.set('n', '<leader>fe', ":Oil<CR>")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "H", vim.lsp.buf.hover)
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
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>tt", ":tabnew <CR>", { desc = "new tab" })
vim.keymap.set("n", "<leader>td", ":tabclose <CR>", { desc = "close tab" })
vim.keymap.set("n", "J", ":tabprevious <CR>", { desc = "prev tab" })
vim.keymap.set("n", "K", ":tabnext <CR>", { desc = "next tab" })
vim.keymap.set("v", "yy", '"+y')


-- vim.cmd("set completeopt+=noselect")
-- require('nvim-treesitter.configs').setup({ highlight = { enable = true, }, })

-- colors
-- require "my_vivid".setup({ transparent = true })
require("rose-pine").setup({
	styles = {
		italic       = false,
		transparency = true,
	},
})

vim.cmd("colorscheme rose-pine")
