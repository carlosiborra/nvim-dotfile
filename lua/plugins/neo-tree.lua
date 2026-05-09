return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		close_if_last_window = false,
		enable_git_status = true,
		enable_diagnostics = true,
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
		popup_border_style = "rounded",
		window = {
			position = "right",
			width = 35,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = { ".DS_Store" },
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			use_libuv_file_watcher = true,
		},
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree filesystem reveal right toggle<cr>", desc = "Toggle explorer" },
		{ "<leader>be", "<cmd>Neotree buffers reveal right toggle<cr>", desc = "Buffer explorer" },
		{ "<leader>ge", "<cmd>Neotree git_status float<cr>", desc = "Git explorer" },
	},
}
