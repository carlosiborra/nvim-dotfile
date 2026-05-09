-- Hunk indicators, stage/reset hunks from buffer, blame.
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		current_line_blame = false, -- toggle with <leader>hb
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local map = function(lhs, rhs, desc, mode)
				vim.keymap.set(mode or "n", lhs, rhs, { buffer = bufnr, desc = desc })
			end
			map("<leader>hs", gs.stage_hunk, "Stage hunk")
			map("<leader>hr", gs.reset_hunk, "Reset hunk")
			map("<leader>hp", gs.preview_hunk, "Preview hunk")
			map("<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("<leader>hB", gs.toggle_current_line_blame, "Blame: toggle inline")
			map("<leader>hS", gs.stage_buffer, "Stage buffer")
			map("<leader>hR", gs.reset_buffer, "Reset buffer")
			map("<leader>hd", gs.diffthis, "Diff this")
			map("]c", function()
				gs.nav_hunk("next")
			end, "Next hunk")
			map("[c", function()
				gs.nav_hunk("prev")
			end, "Prev hunk")
			map("ih", "<cmd>Gitsigns select_hunk<cr>", "Select hunk", { "o", "x" })
		end,
	},
}
