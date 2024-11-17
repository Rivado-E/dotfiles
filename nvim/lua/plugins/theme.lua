return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
        require("themery").setup({
            -- add the conf
            themes = { "myvivid" }, -- Your list of installed colorschemes.ig here
        })
    end,
}
