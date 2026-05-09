-- Multiple modern themes — pick at runtime with :colorscheme <name>.
-- Catppuccin is the default (eager, priority 1000). Alternates are lazy-loaded:
-- lazy.nvim auto-loads them when `:colorscheme <name>` is invoked.
return {
	-- DEFAULT — Catppuccin Mocha
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			flavour = "mocha",
			-- Set to false if your terminal isn't transparent — colors still work
			-- but buffer area gets the catppuccin bg instead of showing through.
			transparent_background = true,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				keywords = { "italic" },
				functions = { "bold" },
				types = { "bold" },
				operators = {},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				neotree = true,
				treesitter = true,
				notify = true,
				fzf = true,
				which_key = true,
				mason = true,
				markdown = true,
				noice = true,
				flash = true,
				harpoon = true,
				rainbow_delimiters = true,
				render_markdown = true,
				diffview = true,
				copilot_vim = true,
				dap = { enabled = true, enable_ui = true },
				native_lsp = {
					enabled = true,
					virtual_text = { errors = { "italic" }, hints = { "italic" } },
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
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
	{ "folke/tokyonight.nvim", lazy = true, opts = { style = "moon", transparent = false } },

	-- ALTERNATE — Kanagawa (ink-and-paint vibe). :colorscheme kanagawa-{wave,dragon,lotus}
	{ "rebelot/kanagawa.nvim", lazy = true, opts = { theme = "wave" } },

	-- ALTERNATE — Rose Pine (muted palette). :colorscheme rose-pine-{main,moon,dawn}
	{ "rose-pine/neovim", name = "rose-pine", lazy = true, opts = { variant = "moon" } },
}
