-- Modern statusline with: mode, branch+diff, diagnostics, lsp, copilot, search count,
-- macro recording, file info, position. Auto-themes with the colorscheme.
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
	event = "VeryLazy",
	config = function()
		-- Search count component
		local function search_count()
			if vim.v.hlsearch == 0 then
				return ""
			end
			local ok, search = pcall(vim.fn.searchcount, { recompute = 1, maxcount = 999 })
			if not ok or next(search) == nil then
				return ""
			end
			return string.format("  %d/%d", search.current, search.total)
		end

		-- Macro recording indicator
		local function macro_recording()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end
			return "recording @" .. reg
		end

		-- Active LSP servers
		local function lsp_clients()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return ""
			end
			local names = {}
			for _, c in ipairs(clients) do
				table.insert(names, c.name)
			end
			return "  " .. table.concat(names, " ")
		end

		-- Filepath relative to project, with smart truncation
		local function filepath()
			local path = vim.fn.expand("%:~:.")
			if path == "" then
				return "[No Name]"
			end
			if #path > 60 then
				path = vim.fn.pathshorten(path, 3)
			end
			return path
		end

		-- Each section is its own chip — rounded caps on both sides — separated
		-- by transparent space. Section separators are blanked so neighbours don't
		-- visually touch.
		local cap = function(c)
			return { left = "", right = "" }
		end

		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" }, -- no auto bridge between sections
				component_separators = "",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
				refresh = { statusline = 100 },
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "", separator = cap(), padding = { left = 1, right = 1 } },
				},
				lualine_b = {
					{ "branch", icon = "", separator = { left = "" } },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						separator = { right = "" },
					},
				},
				lualine_c = {
					{ filepath, color = { gui = "italic" }, separator = cap() },
					{ macro_recording, color = { fg = "#f7768e", gui = "bold" }, separator = cap() },
					{ search_count, separator = cap() },
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						separator = { left = "" },
					},
					{ "copilot", show_colors = true },
					{ lsp_clients, color = { fg = "#7aa2f7" } },
					{ "filetype", separator = { right = "" } },
				},
				lualine_y = {
					{ "progress", separator = cap(), padding = { left = 1, right = 1 } },
				},
				lualine_z = {
					{ "location", icon = "", separator = cap(), padding = { left = 1, right = 1 } },
				},
			},
			extensions = {
				"lazy",
				"mason",
				"neo-tree",
				"trouble",
				"quickfix",
				"fzf",
				"nvim-dap-ui",
				"aerial",
			},
		})
	end,
}
