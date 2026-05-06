-- Modern, language-aware folding (treesitter + LSP-aware).
return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("ufo").setup({
      provider_selector = function(_, _, _) return { "treesitter", "indent" } end,
      preview = {
        win_config = { border = { "", "─", "", "", "", "─", "", "" } },
      },
    })

    vim.keymap.set("n", "zR", require("ufo").openAllFolds,  { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
  end,
}
