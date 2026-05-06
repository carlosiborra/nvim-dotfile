-- PR/branch review inside nvim. Pairs with lazygit for the full git workflow.
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>",         desc = "Diffview: open" },
    { "<leader>gV", "<cmd>DiffviewClose<cr>",        desc = "Diffview: close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: file history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",  desc = "Diffview: branch history" },
  },
  opts = { enhanced_diff_hl = true, view = { merge_tool = { layout = "diff3_mixed" } } },
}
