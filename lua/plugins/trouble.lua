return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
        {
            "<leader>E",
            "<cmd>Trouble diagnostics toggle <cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
