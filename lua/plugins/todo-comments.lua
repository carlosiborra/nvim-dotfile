-- Highlight TODO/FIXME/HACK/NOTE/WARN/PERF, search across project, jump.
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { signs = true },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev todo" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>",       desc = "TODO list (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "TODO/FIX (Trouble)" },
    { "<leader>fT", "<cmd>TodoTelescope<cr>",     desc = "TODO (Telescope)" },
  },
}
