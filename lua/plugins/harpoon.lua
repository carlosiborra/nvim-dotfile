-- Pin 4 files for instant alt-tab between them. Hugely productive on big repos.
-- Prefix moved to <leader>m ("marks") so <leader>h stays free for git Hunks.
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end,
	keys = {
		{
			"<leader>mm",
			function()
				local h = require("harpoon")
				h.ui:toggle_quick_menu(h:list())
			end,
			desc = "Harpoon: menu",
		},
		{
			"<leader>ma",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: pin file",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon: 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon: 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon: 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon: 4",
		},
	},
}
