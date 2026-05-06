return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true, -- don't fight nvim-cmp
        debounce = 75,
        keymap = {
          accept      = "<M-l>",  -- Alt-l accepts ghost text
          accept_word = "<M-w>",
          accept_line = "<M-j>",
          next        = "<M-]>",
          prev        = "<M-[>",
          dismiss     = "<C-]>",
        },
      },
      filetypes = {
        markdown  = true,
        gitcommit = true,
        yaml      = true,
        help      = false,
        gitrebase = false,
        ["."]     = false,
        ["*"]     = true,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    config = function() require("copilot_cmp").setup() end,
  },
}
