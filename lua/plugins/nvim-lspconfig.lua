return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Capabilities: tells LSP servers what your editor supports.
    -- cmp-nvim-lsp extends this so completion works properly with nvim-cmp.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Python LSP (pyright)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })

    -- TypeScript/JavaScript LSP
    -- NOTE: in lspconfig this server is typically "tsserver".
    -- If you are using "ts_ls" specifically and it works for you, keep "ts_ls".
    -- Otherwise switch to "tsserver".
    vim.lsp.config("tsserver", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        print("TypeScript LSP attached to buffer " .. bufnr)
      end,
    })

    -- Enable the servers
    vim.lsp.enable({ "pyright", "tsserver" })
  end,
}

