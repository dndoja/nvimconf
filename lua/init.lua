local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("telescope").load_extension("flutter")

vim.cmd("colorscheme catppuccin-mocha")

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

local colors = require("catppuccin.palettes").get_palette "mocha"
require("scrollbar").setup(
  {
    handle = {
      color = colors.surface0,
    },
    marks = {
      Error = { color = colors.red },
      Warn = { color = colors.yellow },
      Info = { color = colors.sapphire },
      Hint = { color = colors.hint },
      Misc = { color = colors.peach },
    }
  }
)

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
vim.keymap.set("n", "<leader><tab>", function() require("trouble").toggle() end)
vim.keymap.set("n", "<shift><F6>", function() vim.buf.lsp.rename() end)
vim.keymap.set("n", "<leader>l", function() require('telescope.builtin').lsp_document_symbols({ symbols = 'class' }) end)
vim.o.exrc = true
