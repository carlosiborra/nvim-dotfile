-- VS Code-style multi-cursor.
--   <C-n>           = Cmd+D        (select word, then next occurrence)
--   <M-Up>/<M-Down> = Cmd+Alt+↑/↓  (add cursor above/below)
--   <C-LeftMouse>   = Cmd+click    (add cursor at click)
--   <leader>vA      = Cmd+Shift+L  (select all occurrences)
--   q / Q           = skip / remove current cursor
return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		-- Start from a clean slate so VM defaults can't collide with our maps.
		vim.g.VM_default_mappings = 0
		vim.g.VM_maps = {
			["Find Under"] = "<C-n>",
			["Find Subword Under"] = "<C-n>",
			["Add Cursor Down"] = "<M-Down>",
			["Add Cursor Up"] = "<M-Up>",
			["Mouse Cursor"] = "<C-LeftMouse>",
			["Mouse Word"] = "<M-LeftMouse>",
			["Skip Region"] = "q",
			["Remove Region"] = "Q",
			["Switch Mode"] = "<Tab>",
			["Select All"] = "<leader>vA",
			["Visual All"] = "<leader>vA",
			["Visual Add"] = "<leader>va",
			["Visual Find"] = "<leader>vf",
			["Visual Cursors"] = "<leader>vc",
			["Visual Regex"] = "<leader>v/",
		}
		vim.g.VM_show_warnings = 0
		vim.g.VM_silent_exit = 1
	end,
	keys = {
		{ "<C-n>", mode = { "n", "x" }, desc = "VM: select word / next" },
		{ "<M-Down>", mode = { "n", "x" }, desc = "VM: add cursor below" },
		{ "<M-Up>", mode = { "n", "x" }, desc = "VM: add cursor above" },
		{ "<leader>v", mode = { "n", "x" }, desc = "Multi-cursor" },
	},
}
