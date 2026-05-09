-- Real refactor operators: extract function, extract variable, inline.
-- Goes beyond LSP code actions for actions LSPs typically don't expose.
return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>re",
			function()
				require("refactoring").refactor("Extract Function")
			end,
			mode = "x",
			desc = "Extract function",
		},
		{
			"<leader>rf",
			function()
				require("refactoring").refactor("Extract Function To File")
			end,
			mode = "x",
			desc = "Extract function → file",
		},
		{
			"<leader>rv",
			function()
				require("refactoring").refactor("Extract Variable")
			end,
			mode = "x",
			desc = "Extract variable",
		},
		{
			"<leader>rI",
			function()
				require("refactoring").refactor("Inline Function")
			end,
			desc = "Inline function",
		},
		{
			"<leader>ri",
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			mode = { "n", "x" },
			desc = "Inline variable",
		},
		{
			"<leader>rb",
			function()
				require("refactoring").refactor("Extract Block")
			end,
			desc = "Extract block",
		},
		{
			"<leader>rB",
			function()
				require("refactoring").refactor("Extract Block To File")
			end,
			desc = "Extract block → file",
		},
		{
			"<leader>rs",
			function()
				require("refactoring").select_refactor()
			end,
			mode = { "n", "x" },
			desc = "Refactor menu",
		},
	},
	opts = {},
}
