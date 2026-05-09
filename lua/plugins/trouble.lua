return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix (Trouble)" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
		{ "<leader>xr", "<cmd>Trouble lsp toggle focus=false<cr>", desc = "LSP References/Definitions (Trouble)" },
		{ "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", desc = "Workspace Diagnostics (Trouble)" },
	},
	opts = {},
}
