vim.g.mapleader = " "      -- Space as leader
vim.g.maplocalleader = "\\" -- backslash as local leader (sidekick chat uses this)

-- Basic settings
vim.opt.number = true             -- show line numbers
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = false              -- no line wrap
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250          -- snappier CursorHold + LSP signs
vim.opt.timeoutlen = 400          -- faster which-key popup
vim.opt.signcolumn = "yes"

-- IDE-grade quality of life
vim.opt.scrolloff = 8             -- keep cursor 8 lines from edges
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true         -- new horizontal splits go below
vim.opt.splitright = true         -- new vertical splits go right
vim.opt.splitkeep = "screen"      -- avoid jumpy splits
vim.opt.confirm = true            -- ask to save instead of failing
vim.opt.undofile = true           -- persistent undo across sessions
vim.opt.list = true               -- show invisible whitespace
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- foldopen/foldclose are owned by nvim-ufo's foldtext, no need to set them here
vim.opt.fillchars = { eob = " ", fold = " " }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 12            -- shorter completion popup
vim.opt.laststatus = 3            -- single global statusline
vim.opt.inccommand = "split"      -- live preview of :s/foo/bar
vim.opt.smoothscroll = true

-- Folding (handed to nvim-ufo)
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Diagnostics: cleaner inline display
vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "●", source = "if_many" },
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
})
