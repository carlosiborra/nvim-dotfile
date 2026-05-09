-- Colored matching brackets/braces. Nested JSX, hooks, generic types become readable.
return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local rd = require("rainbow-delimiters")
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rd.strategy["global"],
				vim = rd.strategy["local"], -- per-buffer in vimscript
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
				tsx = "rainbow-tags",
				jsx = "rainbow-tags",
			},
		}
	end,
}
