vim.g.mapleader = " "  -- Substitute leader key '\' to a space

-- Basic settings
vim.opt.number = true          -- Show line numbers
--vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.wrap = false           -- Disable line wrapping
vim.opt.tabstop = 4            -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4         -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart indentation
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.termguicolors = true   -- Enable 24-bit RGB colors
vim.opt.mouse = 'a'            -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.ignorecase = true      -- Ignore case when searching
vim.opt.smartcase = true       -- Override ignorecase if search contains capitals
vim.opt.updatetime = 300       -- Faster completion
vim.opt.signcolumn = 'yes'     -- Always show the signcolumn


