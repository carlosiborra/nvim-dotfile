-- Subtle indent guides with current-scope highlight. Big visual upgrade for
-- nested code (JSX, deeply nested objects, Lua tables).
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "▏", -- thinner than the default "│"
			tab_char = "▏",
		},
		scope = {
			enabled = true, -- highlight the indent of the surrounding scope
			show_start = false, -- skip the underlines at top/bottom of the scope
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
				"codecompanion",
			},
		},
	},
}
