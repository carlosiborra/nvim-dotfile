return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode             = "buffers",
      diagnostics      = "nvim_lsp",
      separator_style  = "thin",
      always_show_bufferline = true,
      show_close_icon  = false,
      show_buffer_close_icons = false,
      diagnostics_indicator = function(_, _, diag)
        return (diag.error and " " or "") .. (diag.warning and " " or "")
      end,
      offsets = {
        { filetype = "NvimTree", text = " Files", separator = true, text_align = "left" },
      },
    },
  },
  keys = {
    { "[b", "<cmd>BufferLineCyclePrev<cr>",      desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>",      desc = "Next buffer" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned" },
  },
}
