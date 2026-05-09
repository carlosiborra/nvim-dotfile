-- Pretty markdown for both .md files AND CodeCompanion chat buffers.
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "codecompanion" },
	opts = {
		file_types = { "markdown", "codecompanion" },
		code = { sign = false, width = "block", right_pad = 1 },
		heading = { sign = false, icons = {} },
	},
}
