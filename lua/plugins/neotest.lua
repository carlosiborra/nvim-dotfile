-- Run Jest tests inline with gutter signs and floating output. Targets the
-- mobile project's `npm test` workflow but works for any Jest setup.
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest", -- jest adapter (works with jest-expo preset)
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npx jest --watch=false",
          env = { CI = true },
          cwd = function() return vim.fn.getcwd() end,
        }),
      },
      output  = { open_on_run = true },
      summary = { animated = false },
    })
  end,
  keys = {
    { "<leader>Tt", function() require("neotest").run.run() end,                     desc = "Test: nearest" },
    { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Test: file" },
    { "<leader>TF", function() require("neotest").run.run({ suite = true }) end,     desc = "Test: full suite" },
    { "<leader>Td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Test: debug nearest" },
    { "<leader>Ts", function() require("neotest").summary.toggle() end,              desc = "Test: summary" },
    { "<leader>To", function() require("neotest").output_panel.toggle() end,         desc = "Test: output panel" },
    { "<leader>Tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Test: watch file" },
    { "]T",         function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
    { "[T",         function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Prev failed test" },
  },
}
