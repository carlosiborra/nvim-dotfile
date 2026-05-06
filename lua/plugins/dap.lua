-- JS/TS debugger via vscode-js-debug. Works with Expo / React Native / Node.
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = {
        {
          "microsoft/vscode-js-debug",
          version = "1.x",
          build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
        },
      },
    },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("nvim-dap-virtual-text").setup({})
    dapui.setup({})

    dap.listeners.before.attach.dapui_config           = function() dapui.open() end
    dap.listeners.before.launch.dapui_config           = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config     = function() dapui.close() end

    require("dap-vscode-js").setup({
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })

    for _, lang in ipairs({ "typescript", "typescriptreact", "javascript", "javascriptreact" }) do
      dap.configurations[lang] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Metro / Expo",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch Chrome (web)",
          url = "http://localhost:8081",
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
        },
      }
    end

    -- Breakpoint icons
    vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapStopped",             { text = "", texthl = "DiagnosticInfo" })
  end,
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "DAP: cond breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,          desc = "DAP: continue" },
    { "<leader>di", function() require("dap").step_into() end,         desc = "DAP: step into" },
    { "<leader>do", function() require("dap").step_over() end,         desc = "DAP: step over" },
    { "<leader>dO", function() require("dap").step_out() end,          desc = "DAP: step out" },
    { "<leader>dt", function() require("dap").terminate() end,         desc = "DAP: terminate" },
    { "<leader>du", function() require("dapui").toggle() end,          desc = "DAP: toggle UI" },
    { "<leader>dr", function() require("dap").repl.open() end,         desc = "DAP: REPL" },
    { "<leader>dl", function() require("dap").run_last() end,          desc = "DAP: run last" },
  },
}
