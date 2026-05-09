-- Smart commentstring for embedded contexts. Critical for RN/Expo: in TSX files,
-- JSX gets {/* */} while surrounding TS gets //. Plays with Comment.nvim.
return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.skip_ts_context_commentstring_module = true -- avoid deprecation warning
		require("ts_context_commentstring").setup({
			enable_autocmd = false, -- Comment.nvim hooks in via pre_hook
		})
	end,
}
