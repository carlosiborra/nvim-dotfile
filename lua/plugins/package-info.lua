-- Show installed/latest versions inline in package.json. Useful for spotting
-- Expo / React Native deps that drift from the SDK target.
return {
	"vuki656/package-info.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	-- Restrict to package.json only — `ft = "json"` would trigger on tsconfig,
	-- eslintrc, app.json, etc. and uselessly try to parse them as npm manifests.
	event = {
		{ event = "BufRead", pattern = "package.json" },
		{ event = "BufNewFile", pattern = "package.json" },
	},
	config = function()
		require("package-info").setup({
			highlights = {
				up_to_date = { fg = "#3C4048" },
				outdated = { fg = "#d19a66" },
			},
			icons = { enable = true, style = { up_to_date = "│ ", outdated = "│ " } },
			autostart = true,
			hide_up_to_date = false,
			hide_unstable_versions = false,
			package_manager = "npm",
		})
	end,
	keys = {
		{
			"<leader>pt",
			function()
				require("package-info").toggle()
			end,
			desc = "Pkg: toggle versions",
		},
		{
			"<leader>pu",
			function()
				require("package-info").update()
			end,
			desc = "Pkg: update under cursor",
		},
		{
			"<leader>pd",
			function()
				require("package-info").delete()
			end,
			desc = "Pkg: delete under cursor",
		},
		{
			"<leader>pi",
			function()
				require("package-info").install()
			end,
			desc = "Pkg: install new",
		},
		{
			"<leader>pc",
			function()
				require("package-info").change_version()
			end,
			desc = "Pkg: change version",
		},
	},
}
