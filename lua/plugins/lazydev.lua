-- Faster lua_ls + completion for the nvim Lua API while editing this config.
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "lazy.nvim", words = { "LazyVim" } },
		},
	},
	dependencies = {
		-- adds "lazydev" as a cmp source, listed in nvim-cmp.lua
		{ "Bilal2453/luvit-meta", lazy = true },
	},
}
