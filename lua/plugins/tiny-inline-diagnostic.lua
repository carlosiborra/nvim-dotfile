-- Modern inline diagnostic UI — floats next to the offending line, not at EOL.
-- Disables core virtual_text since they would overlap.
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			transparent_bg = false,
			hi = { mixing_color = "None" },
			options = {
				show_source = true,
				use_icons_from_diagnostic = true,
				multilines = { enabled = true, always_show = false },
			},
		})
		-- virtual_text is already disabled in lua/config/config.lua so tiny-inline owns rendering.
	end,
}
