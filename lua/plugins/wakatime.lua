return {
	"wakatime/vim-wakatime",
	cond = function()
		return #vim.api.nvim_list_uis() > 0
	end,
	event = "VeryLazy",
}
