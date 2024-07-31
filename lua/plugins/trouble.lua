return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
        {
            "<leader>E",
            "<cmd> lua require('trouble').toggle()<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
