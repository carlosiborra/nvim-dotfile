-- Basic settings
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = false -- no line wrap
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
-- Highlight only the line number, not the whole line. Looks much cleaner
-- under a transparent background where a full-line stripe is jarring.
vim.opt.cursorlineopt = "number"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250 -- snappier CursorHold + LSP signs
vim.opt.timeoutlen = 400 -- faster which-key popup
vim.opt.signcolumn = "yes:1" -- 1-wide sign column (saves a column vs the default "yes" / 2)
vim.opt.numberwidth = 3 -- minimum width before line-number column expands

-- IDE-grade quality of life
vim.opt.scrolloff = 8 -- keep cursor 8 lines from edges
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true -- new horizontal splits go below
vim.opt.splitright = true -- new vertical splits go right
vim.opt.splitkeep = "screen" -- avoid jumpy splits
vim.opt.confirm = true -- ask to save instead of failing
vim.opt.undofile = true -- persistent undo across sessions
vim.opt.list = true -- show invisible whitespace
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Cleaner split joints, blank end-of-buffer, and a soft diagonal for diff fill.
vim.opt.fillchars = {
	eob = " ",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	horiz = "─",
	horizup = "┴",
	horizdown = "┬",
	vert = "│",
	vertleft = "┤",
	vertright = "├",
	verthoriz = "┼",
}
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 12 -- shorter completion popup
vim.opt.pumblend = 8 -- subtle transparency on completion popup
vim.opt.winblend = 0 -- floating windows opaque by default; plugins can override
vim.opt.laststatus = 3 -- single global statusline
-- Single blank winbar adds a one-row gap between the tabline (bufferline) and
-- the first line of the buffer — gives the tabs room to "float" rather than
-- sitting glued to the code.
vim.opt.winbar = " "
vim.opt.inccommand = "split" -- live preview of :s/foo/bar
vim.opt.smoothscroll = true -- per-screen-line scrolling on wrapped lines

-- 0.11+: default border for every floating window (LSP hover, signature, lazy, mason, ...).
-- A single line that pulls dozens of plugins into a consistent rounded look.
if vim.fn.has("nvim-0.11") == 1 then
	vim.o.winborder = "rounded"
end

-- Folding (handed to nvim-ufo). foldcolumn=0 keeps the gutter slim;
-- UFO renders fold indicators inline via the foldtext handler instead.
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Diagnostics: cleaner inline display.
-- virtual_text is OFF here because tiny-inline-diagnostic.nvim renders its own.
vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})
