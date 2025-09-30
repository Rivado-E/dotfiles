vim.opt.grepprg = "rg --vimgrep --hidden --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

global grap = function()
	vim.cmd("silent! grep! " .. vim.fn.input("RG> "))
	vim.cmd("copen")
end

global lgrap = function()
	vim.cmd("silent! lgrep! " .. vim.fn.input("RG (loc)> "))
	vim.cmd("copen")
end

vim.keymap.set("n", "]q", "<cmd>cnext<CR>")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>")
vim.keymap.set("n", "]l", "<cmd>lprev<CR>")
vim.keymap.set("n", "[l", "<cmd>lnext<CR>")

