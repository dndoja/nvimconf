return {
    "lewis6991/gitsigns.nvim",
    opt = true,
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup()
        vim.keymap.set("n", "gj", gitsigns.next_hunk)
        vim.keymap.set("n", "gk", gitsigns.prev_hunk)
        vim.keymap.set('v', '<leader>ss', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        vim.keymap.set('v', '<leader>sr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        vim.keymap.set("n", "<leader>H", gitsigns.preview_hunk)
        vim.keymap.set("n", "<leader>sa", gitsigns.stage_buffer)
        vim.keymap.set("n", "<leader>sR", gitsigns.reset_buffer)
    end,
}
