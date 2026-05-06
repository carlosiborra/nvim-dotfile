-- Multiple modern themes — pick at runtime with :colorscheme <name>.
-- Catppuccin stays the default (matches the prior config), others are eager-loaded
-- so you can swap without :Lazy load.
return {
  -- DEFAULT — Catppuccin Mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp                = true,
        gitsigns           = true,
        nvimtree           = true,
        treesitter         = true,
        notify             = true,
        telescope          = { enabled = true },
        which_key          = true,
        mason              = true,
        markdown           = true,
        noice              = true,
        snacks             = { enabled = true, indent_scope_color = "lavender" },
        flash              = true,
        harpoon            = true,
        rainbow_delimiters = true,
        render_markdown    = true,
        diffview           = true,
        copilot_vim        = true,
        dap                = { enabled = true, enable_ui = true },
        native_lsp         = {
          enabled = true,
          virtual_text = { errors = { "italic" }, hints = { "italic" } },
          underlines = {
            errors      = { "underline" },
            hints       = { "underline" },
            warnings    = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },

  -- ALTERNATE — Tokyonight (folke). :colorscheme tokyonight-{moon,storm,night,day}
  { "folke/tokyonight.nvim", priority = 900, lazy = false, opts = { style = "moon", transparent = false } },

  -- ALTERNATE — Kanagawa (ink-and-paint vibe). :colorscheme kanagawa-{wave,dragon,lotus}
  { "rebelot/kanagawa.nvim", priority = 900, lazy = false, opts = { theme = "wave" } },

  -- ALTERNATE — Rose Pine (muted palette). :colorscheme rose-pine-{main,moon,dawn}
  { "rose-pine/neovim", name = "rose-pine", priority = 900, lazy = false, opts = { variant = "moon" } },
}
