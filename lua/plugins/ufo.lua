-- Modern, language-aware folding (treesitter + LSP-aware) with fancy fold text.
return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- Custom fold text: " function foo()  󰁂 23 lines "
		local function fold_virt_text_handler(virt_text, lnum, end_lnum, width, truncate)
			local new_virt_text = {}
			local suffix = (" 󰁂 %d "):format(end_lnum - lnum)
			local suf_width = vim.fn.strdisplaywidth(suffix)
			local target_width = width - suf_width
			local cur_width = 0
			for _, chunk in ipairs(virt_text) do
				local chunk_text = chunk[1]
				local chunk_width = vim.fn.strdisplaywidth(chunk_text)
				if target_width > cur_width + chunk_width then
					table.insert(new_virt_text, chunk)
				else
					chunk_text = truncate(chunk_text, target_width - cur_width)
					table.insert(new_virt_text, { chunk_text, chunk[2] })
					chunk_width = vim.fn.strdisplaywidth(chunk_text)
					if cur_width + chunk_width < target_width then
						suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
					end
					break
				end
				cur_width = cur_width + chunk_width
			end
			table.insert(new_virt_text, { suffix, "MoreMsg" })
			return new_virt_text
		end

		require("ufo").setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
			fold_virt_text_handler = fold_virt_text_handler,
			preview = {
				win_config = { border = "rounded" },
			},
		})

		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
	end,
}
