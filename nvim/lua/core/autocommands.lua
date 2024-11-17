vim.diagnostic.config({ underline = false, update_in_insert = true, virtual_text = false })

-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.filetype.add({
  extension = {
    re = "reason", -- Sets the filetype for .re files to Reason
  },
})

