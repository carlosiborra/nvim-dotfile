-- Sticky function/class header at the top of the screen — the IDE classic.
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    enable = true,
    max_lines = 3,
    multiline_threshold = 2,
    trim_scope = "outer",
    mode = "cursor",
  },
  keys = {
    { "<leader>uc", function() require("treesitter-context").toggle() end, desc = "Toggle sticky context" },
    {
      "[x",
      function() require("treesitter-context").go_to_context(vim.v.count1) end,
      desc = "Jump to outer context",
    },
  },
}
