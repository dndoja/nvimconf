return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('oil').setup({
            float = {
                max_width = 40,
                border = "rounded",
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
                override = function(conf)
                    conf.relative = 'win'
                    conf.col = vim.api.nvim_win_get_width(0) - 1
                    return conf
                end,
            },
        })
        vim.keymap.set("n", "<leader>d", "<CMD> lua require('oil').toggle_float() <CR>",
            { desc = "Open parent directory" })
    end,
}
