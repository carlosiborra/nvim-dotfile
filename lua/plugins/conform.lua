return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        -- async=true: formatting runs without blocking the UI
        -- lsp_fallback=true: if no external formatter is configured/found, try LSP formatting
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n", -- normal mode
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = false,

    format_on_save = function(bufnr)
      -- Disable LSP fallback for filetypes where you don't want LSP formatting
      local disable_lsp_fallback = { c = true, cpp = true }
      return {
        timeout_ms = 2000,
        lsp_fallback = not disable_lsp_fallback[vim.bo[bufnr].filetype],
      }
    end,

    formatters_by_ft = {
      lua = { "stylua" },

      -- Python (uv): prefer ruff formatter (fast). If you prefer black, switch to { "black" }.
      python = { "ruff_format" },

      -- JS/TS/JSON (biome)
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
    },

    -- Explicit formatter commands/args so it works consistently
    formatters = {
      biome = {
        command = "biome",
        args = { "format", "--write", "$FILENAME" },
        stdin = false,
      },
      ruff_format = {
        command = "ruff",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
