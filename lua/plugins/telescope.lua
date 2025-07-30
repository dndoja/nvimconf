return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        initial_mode = "normal",
      },
      pickers = {
        find_files = {
          initial_mode = "insert",
        },
        live_grep = {
          initial_mode = "insert",
        }
      }
    }
  end
}
