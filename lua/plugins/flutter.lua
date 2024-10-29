return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("telescope").load_extension("flutter")

        require('flutter-tools').setup {
            debugger = {
                enabled = false,
                run_via_dap = false,
            },
            dev_log = {
                enabled = true,
                notify_errors = false,
                open_cmd = "bo 90vs",
            },
            lsp = {
                analysisExcludedFolders = {
                    ".dart_tool/**",
                    ".dart_server/**",
                    ".pub/**",
                    "~/dev/lib/flutter/**",
                    "~/.pub-cache/**",
                },
            },
            statusline = {
                device = true,
            },
        }
        vim.keymap.set("n", "<leader>F", "<cmd> Telescope flutter commands<CR>")
        vim.keymap.set("n", "<leader>L", function()
            local winId = vim.fn.bufwinid("__FLUTTER_DEV_LOG__")
            if winId == -1 then
                return
            end

            local width = vim.fn.winwidth(winId)
            local newWidth
            if width > 0 then
                newWidth = 0
            else
                newWidth = 90
            end

            vim.cmd(string.format("vertical %dres %d", winId, newWidth))
        end
        );
    end
}
