-- Color the cursor-line number based on the current mode.
-- Subtle but very modern. Inherits colors from your active theme.
return {
  "mawkler/modicator.nvim",
  dependencies = "catppuccin/nvim",
  event = "VeryLazy",
  init = function()
    -- requirements per modicator
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {
    show_warnings   = false,
    highlights      = { defaults = { bold = true } },
    integration     = {
      lualine = { enabled = true, mode_section = "a" },
    },
  },
}
