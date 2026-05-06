-- Slash-command inline edits + chat — pairs nicely with Copilot-routed Claude Sonnet 4.
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  opts = {
    strategies = {
      chat   = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      cmd    = { adapter = "copilot" },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = { model = { default = "claude-sonnet-4" } },
        })
      end,
    },
    display = {
      action_palette = { width = 95, height = 12, prompt = "Companion ❯ " },
      diff = { provider = "default" },
    },
  },
  keys = {
    { "<leader>nn", "<cmd>CodeCompanionActions<cr>",      mode = { "n", "v" }, desc = "Companion: actions" },
    { "<leader>ni", "<cmd>CodeCompanion<cr>",             mode = { "n", "v" }, desc = "Companion: inline edit" },
    { "<leader>nc", "<cmd>CodeCompanionChat Toggle<cr>",  desc = "Companion: chat" },
    { "<leader>na", "<cmd>CodeCompanionChat Add<cr>",     mode = "v", desc = "Companion: add to chat" },
  },
}
