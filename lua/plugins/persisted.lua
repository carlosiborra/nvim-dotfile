return {
	"olimorris/persisted.nvim",
	event = "VimEnter",
	opts = {
		use_git_branch = true,
		autosave = true,
		autoload = true,
	},
	keys = {
		{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Session save" },
		{ "<leader>sl", "<cmd>SessionLoad<cr>", desc = "Session load" },
	},
}
