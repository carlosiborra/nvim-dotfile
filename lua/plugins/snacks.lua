-- folke/snacks.nvim — picker, dashboard, indent guides, scroll, notifier, terminal, etc.
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile      = { enabled = true },
    dashboard    = { enabled = true },
    indent       = { enabled = true },
    input        = { enabled = true },
    notifier     = { enabled = true, timeout = 3000, style = "compact" },
    quickfile    = { enabled = true },
    scope        = { enabled = true },
    scroll       = { enabled = true },
    statuscolumn = { enabled = true },
    words        = { enabled = true },
    picker       = { enabled = true },
    terminal     = { enabled = true },
    bufdelete    = { enabled = true },
    rename       = { enabled = true },
    gitbrowse    = { enabled = true },
    lazygit      = { enabled = true },
    zen          = { enabled = true },
  },
  keys = {
    -- Notifications
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
    { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss notifications" },

    -- Zen / git
    { "<leader>z",  function() Snacks.zen() end,           desc = "Zen mode" },
    { "<leader>gB", function() Snacks.gitbrowse() end,     desc = "Open in browser (git)" },
    { "<leader>gG", function() Snacks.lazygit() end,       desc = "Lazygit (snacks)" },

    -- Buffer delete that keeps window layout
    { "<leader>bd", function() Snacks.bufdelete() end,     desc = "Delete buffer" },
    { "<leader>bD", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
  },
}
