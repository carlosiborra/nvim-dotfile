-- Auto-shutdown idle LSPs after a grace period. Reclaims memory on long sessions.
return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		aggressive_mode = false,
		grace_period = 60 * 15, -- 15 min idle → shut down LSP
		wakeup_delay = 3000, -- ms before re-attach when buffer focused again
		notifications = false,
		excluded_filetypes = {},
		excluded_lsp_clients = { "copilot" },
	},
}
