return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")

		-- Chip color for the active tab — catppuccin's "mauve" accent.
		-- Bright enough that the rounded `` `` half-moon ends are unmistakable.
		-- Swap to "#89b4fa" (blue), "#a6e3a1" (green), "#f9e2af" (yellow), or
		-- "#313244" (subtle surface0) to taste.
		-- Catppuccin mocha palette tabs:
		--   active   = mantle   (#181825) — the "selected" chip
		--   inactive = crust    (#11111b) — visible but recessed (deeper than mantle)
		--   text     = text     (#cdd6f4) on active, overlay1 (#7f849c) on inactive
		-- Both tabs are full chips so the bar reads as a row of floating tiles
		-- rather than a single highlight on a transparent strip.
		local active_bg = "#181825"
		local active_fg = "#cdd6f4"
		local inactive_bg = "#11111b"
		local inactive_fg = "#7f849c"
		local accent = "#89b4fa" -- blue indicator underline on active

		bufferline.setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.no_italic,
				diagnostics = "nvim_lsp",
				separator_style = { "", "" }, -- rounded half-moons (Nerd Font)
				always_show_bufferline = true,
				show_close_icon = false,
				show_buffer_close_icons = false,
				numbers = "none",
				indicator = { style = "none" }, -- chip background alone marks the active tab
				color_icons = true,
				tab_size = 18,
				-- Force a visible gap between every tab so chips don't touch.
				custom_areas = {
					left = function()
						return { { text = " " } } -- 1-col left padding before first tab
					end,
				},
				diagnostics_indicator = function(_, _, diag)
					return (diag.error and " " or "") .. (diag.warning and " " or "")
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "  Explorer",
						separator = false,
						text_align = "left",
						highlight = "Directory",
					},
				},
			},
			-- Every tab is a chip. Inactive ones use `crust` so they stay recessed
			-- behind the active `mantle` chip; the rounded half-moons take each
			-- chip's own bg as their fg, so the curves blend into the chip edge.
			highlights = {
				fill = { bg = "NONE" }, -- empty bar after the last tab stays transparent
				background = { bg = inactive_bg, fg = inactive_fg },

				buffer_visible = { bg = inactive_bg, fg = inactive_fg },
				buffer_selected = { bg = active_bg, fg = active_fg, bold = true, italic = false },

				separator = { bg = "NONE", fg = inactive_bg },
				separator_visible = { bg = "NONE", fg = inactive_bg },
				separator_selected = { bg = "NONE", fg = active_bg },

				modified = { bg = inactive_bg, fg = "#a6e3a1" },
				modified_visible = { bg = inactive_bg, fg = "#a6e3a1" },
				modified_selected = { bg = active_bg, fg = "#a6e3a1" },

				duplicate = { bg = inactive_bg, fg = inactive_fg, italic = true },
				duplicate_visible = { bg = inactive_bg, fg = inactive_fg, italic = true },
				duplicate_selected = { bg = active_bg, fg = active_fg, italic = true, bold = true },

				diagnostic = { bg = inactive_bg },
				diagnostic_visible = { bg = inactive_bg },
				diagnostic_selected = { bg = active_bg, fg = active_fg, bold = true },

				error = { bg = inactive_bg, fg = "#f38ba8" },
				error_visible = { bg = inactive_bg, fg = "#f38ba8" },
				error_selected = { bg = active_bg, fg = "#f38ba8", bold = true },

				warning = { bg = inactive_bg, fg = "#f9e2af" },
				warning_visible = { bg = inactive_bg, fg = "#f9e2af" },
				warning_selected = { bg = active_bg, fg = "#fab387", bold = true },

				offset_separator = { bg = "NONE" },
				indicator_selected = { fg = accent, bg = active_bg },
			},
		})
	end,
	keys = {
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
		{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned" },
		{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
		{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
		{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
		{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
		{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
	},
}
