-- Split / join long lines using treesitter. Big QoL for JSX prop lists and fn args.
-- Examples: <leader>jt on `function(a, b, c)` → split each arg onto its own line.
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  opts = { use_default_keymaps = false, max_join_length = 150 },
  keys = {
    { "<leader>jt", "<cmd>TSJToggle<cr>", desc = "Toggle split/join" },
    { "<leader>js", "<cmd>TSJSplit<cr>",  desc = "Split node" },
    { "<leader>jj", "<cmd>TSJJoin<cr>",   desc = "Join node" },
  },
}
