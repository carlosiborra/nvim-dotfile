return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {
			height = 0.85,
			width = 0.85,
			row = 0.5,
			col = 0.5,
			border = "rounded",
			preview = {
				layout = "flex",
				vertical = "down:45%",
				horizontal = "right:55%",
			},
		},
		files = {
			hidden = true,
			no_ignore = false,
			follow = false,
		},
		grep = {
			rg_glob = true,
			glob_separator = "%s%-%-",
		},
		oldfiles = {
			cwd_only = false,
			include_current_session = false,
		},
		buffers = {
			sort_lastused = true,
			show_unloaded = true,
		},
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select()
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fF",
			function()
				require("fzf-lua").git_files()
			end,
			desc = "Find git files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Grep word",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Recent files",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Help",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Document diagnostics",
		},
		{
			"<leader>fD",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "Workspace diagnostics",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "Document symbols",
		},
		{
			"<leader>fS",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "Workspace symbols",
		},
		{
			"<leader>fp",
			function()
				require("fzf-lua").global()
			end,
			desc = "Global picker",
		},
		{
			"<leader>fT",
			function()
				require("fzf-lua").grep({ search = "TODO|FIX|FIXME|HACK|WARN|PERF|NOTE" })
			end,
			desc = "TODOs",
		},
	},
}
