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
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
                -- This function defines what is considered a "hidden" file
                is_hidden_file = function(name)
                    local m = name:match("^%.")
                    return m ~= nil
                end,
                -- This function defines what will never be shown, even when `show_hidden` is set
                is_always_hidden = function()
                    return false
                end,
            },
        })
        vim.keymap.set("n", "<leader>d", "<CMD> lua require('oil').toggle_float() <CR>",
            { desc = "Open parent directory" })
    end,
}
