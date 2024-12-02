return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Python LSP
    lspconfig.pyright.setup({ capabilities = capabilities })
    
    -- TypeScript/JavaScript LSP
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        print("TypeScript LSP attached to buffer " .. bufnr)
      end,
    })
    
    -- Add other language servers as needed
  end,
}
