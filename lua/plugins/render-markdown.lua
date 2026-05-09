-- Pretty markdown for both .md files AND CopilotChat / CodeCompanion buffers.
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "copilot-chat", "codecompanion" },
	opts = {
		file_types = { "markdown", "copilot-chat", "codecompanion" },
		code = { sign = false, width = "block", right_pad = 1 },
		heading = { sign = false, icons = {} },
	},
}
