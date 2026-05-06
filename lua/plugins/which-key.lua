return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 300,
    plugins = {
      marks     = true,
      registers = true,
      spelling  = { enabled = true, suggestions = 20 },
    },
    spec = {
      { "<leader>a", group = "AI: Sidekick (Claude/Codex/OpenCode/Copilot CLI)" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Chat (CopilotChat)" },
      { "<leader>d", group = "Debug (DAP)" },
      { "<leader>f", group = "Find / Files" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunks (Git)" },
      { "<leader>l", group = "LSP / Lint" },
      { "<leader>n", group = "Companion / Noice" },
      { "<leader>s", group = "Sessions" },
      { "<leader>t", group = "Tailwind / Terminal" },
      { "<leader>u", group = "UI toggles" },
      { "<leader>x", group = "Trouble / Diagnostics" },
    },
  },
}
