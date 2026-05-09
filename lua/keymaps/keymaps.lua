local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Navigate splits using Ctrl + h/l/j/k
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Buffer navigation
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)

-- Window resizing
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear search highlight
map("n", "<leader>/", ":nohlsearch<CR>", opts)

-- Better paste (don't yank on paste)
map("v", "p", '"_dP', opts)
