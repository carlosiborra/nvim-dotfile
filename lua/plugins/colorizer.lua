-- Inline hex / rgb / hsl color preview.
return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			RRGGBBAA = true,
			AARRGGBB = true,
			names = false, -- skip "blue", "red" — they're false positives in code
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "background",
			tailwind = false,
			sass = { enable = false },
		},
	},
	keys = {
		{ "<leader>uC", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
	},
}
