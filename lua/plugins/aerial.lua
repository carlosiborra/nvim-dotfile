-- Symbol outline panel — like VS Code's Outline view. Treesitter-backed.
return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    layout = { default_direction = "right", min_width = 28, max_width = { 40, 0.2 } },
    attach_mode = "global",  -- one outline per project, not per buffer
    show_guides = true,
    filter_kind = false,     -- show everything
    autojump = true,
    highlight_on_jump = 250,
  },
  keys = {
    { "<leader>uo", "<cmd>AerialToggle!<cr>",     desc = "Outline (Aerial)" },
    { "<leader>uO", "<cmd>AerialNavToggle<cr>",   desc = "Outline nav (floating)" },
    { "[s",         "<cmd>AerialPrev<cr>",        desc = "Prev symbol" },
    { "]s",         "<cmd>AerialNext<cr>",        desc = "Next symbol" },
  },
}
