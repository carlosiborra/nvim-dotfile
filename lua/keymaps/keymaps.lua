local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Navigate splits using Ctrl + h/l/j/k
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
