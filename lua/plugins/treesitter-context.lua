-- Sticky function/class header at the top of the screen — the IDE classic.
--
-- TEMPORARILY DISABLED on nvim 0.12.1: the plugin's `root_tree:parse(range, cb)`
-- call path crashes with "attempt to call method 'range' (nil value)" deep in
-- core langtree.lua. Likely fixed in nvim 0.12.2 or later — re-enable after
-- `brew upgrade neovim`.
return {
	"nvim-treesitter/nvim-treesitter-context",
	enabled = false,
	version = false,
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		enable = true,
		max_lines = 3,
		multiline_threshold = 2,
		trim_scope = "outer",
		mode = "cursor",
	},
	keys = {
		{
			"<leader>uc",
			function()
				require("treesitter-context").toggle()
			end,
			desc = "Toggle sticky context",
		},
		{
			"[x",
			function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end,
			desc = "Jump to outer context",
		},
	},
}
