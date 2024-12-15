return {
  'numToStr/Comment.nvim',
  keys = { '<C-_>', '<C-M-_>' },
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<C-_>',       -- Ctrl + /
        block = '<C-M-_>',    -- Ctrl + Alt + /
      },
      opleader = {
        line = '<C-_>',
        block = '<C-M-_>',
      },
      mappings = {
        basic = true,         -- Enable basic mappings
        extra = false,        -- Disable extra mappings if not needed
      },
    })
  end,
}

