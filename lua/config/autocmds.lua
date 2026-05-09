-- Highlight text on yank (vim.hl on 0.11+, fall back to vim.highlight on older)
local hl = vim.hl or vim.highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Avoid expensive features for large generated/log files.
vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function(args)
		local ok, stats = pcall(vim.uv.fs_stat, args.file)
		if not ok or not stats or stats.size < 2 * 1024 * 1024 then
			return
		end

		vim.b[args.buf].bigfile = true
		vim.opt_local.swapfile = false
		vim.opt_local.undofile = false
		vim.opt_local.foldmethod = "manual"
		vim.opt_local.syntax = "off"
		pcall(vim.cmd, "TSBufDisable highlight")
	end,
	desc = "Disable expensive features for large files",
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		if not vim.bo[args.buf].modifiable or vim.bo[args.buf].buftype ~= "" then
			return
		end

		local view = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(view)
	end,
})

-- Automatically reload the file if it changes outside of Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})
