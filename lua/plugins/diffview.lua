return {
    'sindrets/diffview.nvim',
    config = function()
        vim.keymap.set('n', '<leader>G', '<cmd>DiffviewOpen<cr>')
    end
}
