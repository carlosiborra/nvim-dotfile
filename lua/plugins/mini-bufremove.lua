return {
	"nvim-mini/mini.bufremove",
	version = false,
	keys = {
		{
			"<leader>bd",
			function()
				require("mini.bufremove").delete(0, false)
			end,
			desc = "Delete buffer",
		},
		{
			"<leader>bD",
			function()
				local remove = require("mini.bufremove")
				for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
					remove.delete(buf.bufnr, false)
				end
			end,
			desc = "Delete all buffers",
		},
	},
}
