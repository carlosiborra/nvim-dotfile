-- VS Code-style breadcrumbs in the winbar: file > class > function.
-- Click any segment to navigate, or fuzzy-pick.
return {
	"Bekaboo/dropbar.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- Make sure winbar has space (single global statusline already set elsewhere)
		require("dropbar").setup({
			bar = {
				enable = function(buf, win)
					local ft = vim.bo[buf].filetype
					local skip = {
						"fzf",
						"neo-tree",
						"alpha",
						"lazy",
						"mason",
						"trouble",
						"DressingInput",
						"dapui_scopes",
						"dapui_breakpoints",
						"dapui_stacks",
						"dapui_watches",
						"dapui_console",
						"aerial",
						"noice",
						"codecompanion",
						"spectre_panel",
					}
					for _, s in ipairs(skip) do
						if ft == s then
							return false
						end
					end
					return vim.api.nvim_buf_get_name(buf) ~= "" and not vim.api.nvim_win_get_config(win).zindex
				end,
			},
		})
	end,
	keys = {
		{
			"<leader>bb",
			function()
				require("dropbar.api").pick()
			end,
			desc = "Breadcrumbs: pick segment",
		},
	},
}
