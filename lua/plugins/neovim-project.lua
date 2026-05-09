-- Project switcher with auto-cd to root + recent-projects picker.
-- Replaces ahmedkhalf/project.nvim (unmaintained, used deprecated
-- vim.lsp.buf_get_clients which fzf-lua then triggered too).
--
-- Sessions are still owned by persisted.nvim — last_session_on_startup is off
-- so neovim-session-manager (a dependency) doesn't fight with persisted.
return {
	"coffebar/neovim-project",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"Shatur/neovim-session-manager", -- required dependency; we keep it idle
	},
	lazy = false,
	priority = 100,
	init = function()
		-- Required so per-project session restore can capture global state.
		vim.opt.sessionoptions:append("globals")
	end,
	opts = {
		-- Glob patterns describing where your projects live.
		-- Each `*` becomes a discovered project on `:NeovimProjectDiscover`.
		projects = {
			"~/Developer/*",
			"~/Developer/*/*", -- two-level (e.g. ~/Developer/work/foo)
			"~/.config/*",
		},
		ignore_projects = {},
		last_session_on_startup = false, -- persisted.nvim handles sessions
		dashboard_mode = false,
		picker = {
			type = "fzf-lua",
			preview = {
				enabled = true,
				git_status = true,
				git_fetch = false,
				show_hidden = true,
			},
		},
	},
	keys = {
		{ "<leader>fP", "<cmd>NeovimProjectDiscover<cr>", desc = "Projects: discover" },
		{ "<leader>sp", "<cmd>NeovimProjectHistory<cr>", desc = "Projects: history" },
	},
}
