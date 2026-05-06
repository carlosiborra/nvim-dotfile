-- Live preview rename. Noice's `inc_rename` preset uses this under the hood.
return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  opts = {},
  keys = {
    {
      "<leader>rN",
      function() return ":IncRename " .. vim.fn.expand("<cword>") end,
      expr = true,
      desc = "Rename (live preview)",
    },
  },
}
