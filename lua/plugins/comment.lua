return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  keys = { "<C-_>", "<C-M-_>", { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      toggler = {
        line  = "<C-_>",   -- Ctrl + /
        block = "<C-M-_>", -- Ctrl + Alt + /
      },
      opleader = {
        line  = "<C-_>",
        block = "<C-M-_>",
      },
      mappings = {
        basic = true,
        extra = false,
      },
    })
  end,
}
