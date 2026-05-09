-- Project-wide find/replace with regex preview. The "missing from nvim" feature.
return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
	keys = {
		{
			"<leader>sr",
			function()
				require("spectre").open()
			end,
			desc = "Spectre: replace in repo",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Spectre: replace word",
		},
		{
			"<leader>sf",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "Spectre: replace in file",
		},
		{
			"<leader>sR",
			function()
				require("spectre").open_visual()
			end,
			mode = "v",
			desc = "Spectre: replace selection",
		},
	},
}
