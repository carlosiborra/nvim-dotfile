-- Edit your filesystem like a buffer. Complements nvim-tree.
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    default_file_explorer = false, -- nvim-tree stays primary
    delete_to_trash = true,
    view_options = { show_hidden = true },
    keymaps = {
      ["<C-h>"] = false, -- don't shadow split nav
      ["<C-l>"] = false,
      ["g?"]    = "actions.show_help",
      ["<CR>"]  = "actions.select",
      ["-"]     = "actions.parent",
    },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil: parent dir as buffer" },
  },
}
