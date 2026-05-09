return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	-- Skip the dashboard when nvim was opened with a file argument or piped stdin.
	cond = function()
		return vim.fn.argc(-1) == 0 and vim.fn.line2byte(1) == -1
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                         ",
			[[  _   ___     ___ __  __ ]],
			[[ | \ | \ \   / / |_ \/ _|]],
			[[ |  \| |\ \ / /| | | |  ]],
			[[ | |\  | \ V / | | | |  ]],
			[[ |_| \_|  \_/  |_| |_|  ]],
			"                         ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "Find file", ":FzfLua files<CR>"),
			dashboard.button("g", "Live grep", ":FzfLua live_grep<CR>"),
			dashboard.button("r", "Recent files", ":FzfLua oldfiles<CR>"),
			dashboard.button("e", "Explorer", ":Neotree filesystem reveal right<CR>"),
			dashboard.button("l", "Lazy", ":Lazy<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>"),
		}

		require("alpha").setup(dashboard.config)
	end,
}
