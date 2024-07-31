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
                exception_breakpoints = {},
                register_configurations = function(_)
                    require("dap").configurations.dart = {}
                    require("dap.ext.vscode").load_launchjs()
                end,
                run_via_dap = true,
            },
            dev_log = {
                enabled = false,
                open_cmd = "tabedit",
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
    end
}
