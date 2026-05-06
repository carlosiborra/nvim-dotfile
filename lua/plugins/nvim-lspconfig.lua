return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "vtsls",       -- modern TS/JS server (replaces deprecated tsserver)
          "biome",       -- Biome LSP for diagnostics + code actions
          "lua_ls",      -- Lua, for editing this config
          "pyright",     -- Python
          "tailwindcss", -- NativeWind / Tailwind class intel
          "jsonls",
          "yamlls",
        },
      },
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "stylua",            -- Lua formatter
          "biome",             -- already installed via LSP, dual-purpose
          "ruff",              -- Python lint+format
          "js-debug-adapter",  -- DAP for JS/TS/Expo
          "prettierd",         -- markdown/yaml fallback
        },
      },
    },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end
      map("gd", vim.lsp.buf.definition,           "Go to definition")
      map("gD", vim.lsp.buf.declaration,          "Go to declaration")
      map("gr", vim.lsp.buf.references,           "References")
      map("gi", vim.lsp.buf.implementation,       "Implementation")
      map("gy", vim.lsp.buf.type_definition,      "Type definition")
      map("K",  vim.lsp.buf.hover,                "Hover docs")
      map("<C-k>", vim.lsp.buf.signature_help,    "Signature help")
      map("<leader>rn", vim.lsp.buf.rename,       "Rename symbol")
      map("<leader>ca", vim.lsp.buf.code_action,  "Code action")
      map("[d", vim.diagnostic.goto_prev,         "Prev diagnostic")
      map("]d", vim.diagnostic.goto_next,         "Next diagnostic")
      map("<leader>le", vim.diagnostic.open_float, "Line diagnostics")
    end

    local servers = { "vtsls", "biome", "lua_ls", "pyright", "tailwindcss", "jsonls", "yamlls" }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities, on_attach = on_attach })
    end

    -- vtsls: better defaults for TS/JS/RN projects
    vim.lsp.config("vtsls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "literals" },
            variableTypes  = { enabled = false },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes  = { enabled = true },
          },
          updateImportsOnFileMove = { enabled = "always" },
          suggest = { completeFunctionCalls = true },
        },
        javascript = {
          inlayHints = {
            parameterNames = { enabled = "literals" },
            functionLikeReturnTypes = { enabled = true },
          },
        },
      },
    })

    -- lua_ls: lazydev.nvim wires the rest, just enable inlay hints
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          hint = { enable = true },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.enable(servers)
  end,
}
