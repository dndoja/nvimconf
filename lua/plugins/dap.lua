return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
        dap.adapters.dart = {
            type = "executable",
            command = "flutter",
            console = "externalTerminal",
            args = { "debug_adapter" }
        }

        dap.set_exception_breakpoints({})
        dap.defaults.fallback.exception_breakpoints = {}
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
        vim.fn.sign_define('DapBreakpoint', { text = '🔴' })
        vim.fn.sign_define('DapLogPoint', {
            text = '',
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint',
        })
        vim.fn.sign_define('DapStopped',
            { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

        vim.keymap.set("n", "<leader>DU", "<cmd>lua require('dapui').toggle()<CR>")
        vim.keymap.set("n", "<leader>L", "<cmd>lua require('dap').repl.toggle({width=90}, 'bo vs')<CR>")
        vim.keymap.set("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
        vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
        vim.keymap.set("n", "<F8>", "<cmd>lua require('dap').step_over()<CR>")
        vim.keymap.set("n", "<F9>", "<cmd>lua require('dap').step_back()<CR>")
        vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_into()<CR>")

        -- dap.listeners.before.attach.dapui_config = function()
        --     dapui.open()
        -- end
        -- dap.listeners.before.launch.dapui_config = function()
        --     dapui.open()
        -- end
        -- dap.listeners.before.event_terminated.dapui_config = function()
        --     dapui.close()
        -- end
        -- dap.listeners.before.event_exited.dapui_config = function()
        --     dapui.close()
        -- end
    end
}
