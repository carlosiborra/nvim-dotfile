-- Run package.json scripts ("expo start", "ios", "lint", "typecheck") without leaving nvim.
-- Auto-detects npm/yarn/pnpm and the script catalog from package.json.
return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerRun", "OverseerToggle", "OverseerInfo",
    "OverseerBuild", "OverseerQuickAction", "OverseerTaskAction",
    "OverseerOpen", "OverseerClose",
  },
  opts = {
    templates = { "builtin", "user.npm" },
    task_list = { direction = "bottom", min_height = 12 },
  },
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>",          desc = "Run task / npm script" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>",       desc = "Toggle task list" },
    { "<leader>oa", "<cmd>OverseerQuickAction<cr>",  desc = "Task action" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>",         desc = "Task info" },
    { "<leader>oc", "<cmd>OverseerClearCache<cr>",   desc = "Clear task cache" },
  },
}
