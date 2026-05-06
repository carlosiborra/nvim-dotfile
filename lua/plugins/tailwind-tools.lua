-- Tailwind / NativeWind class previews + class sorter + concealer.
return {
  "luckasRanarison/tailwind-tools.nvim",
  ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    document_color   = { enabled = true, kind = "inline", inline_symbol = "󰝤 " },
    conceal          = { enabled = false },
    custom_filetypes = { "javascriptreact", "typescriptreact" },
  },
  keys = {
    { "<leader>tT", "<cmd>TailwindConcealToggle<cr>",  desc = "Tailwind: toggle conceal" },
    { "<leader>tc", "<cmd>TailwindColorToggle<cr>",    desc = "Tailwind: toggle colors" },
    { "<leader>ts", "<cmd>TailwindSort<cr>",           desc = "Tailwind: sort classes" },
  },
}
