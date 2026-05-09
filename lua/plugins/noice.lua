-- Modern UI for cmdline, messages, and LSP popups.
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			progress = { enabled = true },
			hover = { enabled = true, silent = true },
			signature = { enabled = true },
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
			inc_rename = true,
		},
		routes = {
			-- silence the chatty "X lines, Y bytes written" message
			{ filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
		},
	},
	keys = {
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice: last message",
		},
		{
			"<leader>nm",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice: history",
		},
		{
			"<leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Noice: dismiss all",
		},
	},
}
