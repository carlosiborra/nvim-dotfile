return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
    vim.cmd('colorscheme catppuccin-mocha')
    end,
}

-- return {
--  'lunarvim/darkplus.nvim',
--  priority = 1000,
--  config = function()
--    vim.cmd('colorscheme darkplus')
--  end,
-- }
