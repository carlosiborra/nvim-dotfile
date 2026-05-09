-- CodeCompanion: in-editor chat + inline edits, routed through your Copilot subscription.
-- Modernized for v18+ ('interactions' API). Pairs with sidekick (CLI hub) and
-- copilot.lua (ghost text); covers slash-command prompts, persistent chat history,
-- and fzf-lua action palette.
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zbirenbaum/copilot.lua",
		"ravitemer/codecompanion-history.nvim", -- persistent chat sessions
		"MeanderingProgrammer/render-markdown.nvim", -- pretty chat rendering
		"ibhagwan/fzf-lua", -- action-palette picker
	},
	cmd = {
		"CodeCompanion",
		"CodeCompanionChat",
		"CodeCompanionActions",
		"CodeCompanionCmd",
		"CodeCompanionHistory",
		"CodeCompanionSummaries",
	},
	opts = {
		interactions = {
			chat = {
				adapter = { name = "copilot", model = "claude-sonnet-4" },
				roles = { llm = "  Companion", user = "  You" },
				keymaps = {
					send = { modes = { n = "<CR>", i = "<C-s>" } },
					close = { modes = { n = "<C-c>", i = "<C-c>" } },
					stop = { modes = { n = "q" } },
					regenerate = { modes = { n = "gR" } },
					clear = { modes = { n = "gx" } },
					codeblock = { modes = { n = "gc" } },
					yank_code = { modes = { n = "gy" } },
					change_adapter = { modes = { n = "ga" } },
				},
			},
			inline = {
				adapter = { name = "copilot", model = "claude-sonnet-4" },
				keymaps = {
					accept_change = { modes = { n = "ga" }, description = "Accept" },
					reject_change = { modes = { n = "gr" }, description = "Reject" },
				},
			},
			cmd = {
				adapter = { name = "copilot", model = "claude-haiku-4.5" }, -- fast for one-shot cmdline gen
			},
		},

		display = {
			action_palette = {
				width = 95,
				height = 12,
				prompt = "Companion ❯ ",
				provider = "fzf_lua",
				opts = {
					show_preset_actions = true,
					show_preset_prompts = true,
					title = "CodeCompanion",
				},
			},
			chat = {
				show_settings = false,
				show_token_count = true,
				start_in_insert_mode = false,
				window = {
					layout = "vertical",
					position = "right",
					width = 0.4,
					height = 0.85,
					border = "rounded",
					opts = {
						breakindent = true,
						linebreak = true,
						wrap = true,
					},
				},
			},
			diff = {
				enabled = true,
				close_chat_at = 240,
				layout = "vertical",
				provider = "default",
			},
		},

		extensions = {
			history = {
				enabled = true,
				opts = {
					keymap = "gh", -- in chat: open history browser
					save_chat_keymap = "sc", -- in chat: manual save
					auto_save = true,
					auto_generate_title = true,
					expiration_days = 30,
					picker = "fzf-lua",
					continue_last_chat = false,
					delete_on_clearing_chat = false,
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
					summary = {
						create_summary_keymap = "gcs",
						browse_summaries_keymap = "gbs",
					},
				},
			},
		},

		-- Reusable prompts. Access via the action palette (<leader>nn) or
		-- from cmdline as :CodeCompanion /<short_name>.
		prompt_library = {
			["Explain"] = {
				interaction = "chat",
				description = "Explain selected code",
				opts = { modes = { "v" }, short_name = "explain", auto_submit = true, is_slash_cmd = true },
				prompts = {
					{
						role = "system",
						content = "You are a senior engineer. Explain code clearly: purpose, control flow, edge cases, and any gotchas. Be concise — no fluff.",
					},
					{ role = "user", content = "Explain this:\n\n```#{filetype}\n#{selection}\n```" },
				},
			},
			["Tests"] = {
				interaction = "inline",
				description = "Generate unit tests for the selection",
				opts = {
					modes = { "v" },
					short_name = "tests",
					placement = "new",
					auto_submit = true,
					is_slash_cmd = true,
				},
				prompts = {
					{
						role = "system",
						content = "Write thorough unit tests using the project's existing test framework and conventions. Cover edge cases and failure modes. Output ONLY runnable test code.",
					},
					{ role = "user", content = "Tests for:\n\n```#{filetype}\n#{selection}\n```" },
				},
			},
			["Review"] = {
				interaction = "chat",
				description = "Code review the selection",
				opts = { modes = { "v" }, short_name = "review", auto_submit = true, is_slash_cmd = true },
				prompts = {
					{
						role = "system",
						content = "Review like a staff engineer. Flag bugs, security issues, perf problems, readability. Use severity tags (CRITICAL/HIGH/MEDIUM/LOW). Be specific. Skip nits unless asked.",
					},
					{ role = "user", content = "Review:\n\n```#{filetype}\n#{selection}\n```" },
				},
			},
			["Fix"] = {
				interaction = "inline",
				description = "Fix bugs in the selection (in-place)",
				opts = {
					modes = { "v" },
					short_name = "fix",
					placement = "replace",
					auto_submit = true,
					is_slash_cmd = true,
				},
				prompts = {
					{
						role = "system",
						content = "Fix bugs while preserving intent and the surrounding code style. Output ONLY the corrected code, no commentary, no markdown fences.",
					},
					{ role = "user", content = "#{selection}" },
				},
			},
			["Optimize"] = {
				interaction = "inline",
				description = "Refactor selection for clarity & performance",
				opts = {
					modes = { "v" },
					short_name = "optimize",
					placement = "replace",
					auto_submit = true,
					is_slash_cmd = true,
				},
				prompts = {
					{
						role = "system",
						content = "Refactor for clarity and performance. Preserve public API and observable behavior. Output ONLY the refactored code, no commentary.",
					},
					{ role = "user", content = "#{selection}" },
				},
			},
			["Docs"] = {
				interaction = "inline",
				description = "Add docstrings/comments matching file style",
				opts = {
					modes = { "v" },
					short_name = "docs",
					placement = "replace",
					auto_submit = true,
					is_slash_cmd = true,
				},
				prompts = {
					{
						role = "system",
						content = "Add concise docstrings/comments to public APIs only. Match the existing style in the file. Skip obvious code.",
					},
					{ role = "user", content = "#{selection}" },
				},
			},
			["Commit"] = {
				interaction = "chat",
				description = "Generate a Conventional Commit from staged diff",
				opts = { short_name = "commit", auto_submit = true, is_slash_cmd = true },
				prompts = {
					{
						role = "system",
						content = "You write Conventional Commit messages. Format: 'type(scope): subject' on the first line (≤72 chars), optional concise body explaining WHY. Types: feat, fix, perf, refactor, docs, test, chore, ci, build. No mention of yourself or the AI.",
					},
					{
						role = "user",
						content = function()
							local diff = vim.fn.system("git diff --staged")
							if vim.v.shell_error ~= 0 or diff == "" then
								return "There are no staged changes. Stage some first with `git add`."
							end
							return "Write a commit for this staged diff:\n\n```diff\n" .. diff .. "\n```"
						end,
					},
				},
			},
		},

		opts = {
			send_code = true,
			log_level = "ERROR",
			language = "English",
		},
	},

	keys = {
		-- Primary entry: action palette (fuzzy-pick anything)
		{ "<leader>nn", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Companion: actions" },

		-- Chat
		{ "<leader>nc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Companion: chat toggle" },
		{ "<leader>nN", "<cmd>CodeCompanionChat<cr>", desc = "Companion: new chat" },
		{ "<leader>na", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Companion: add to chat" },
		{ "<leader>nh", "<cmd>CodeCompanionHistory<cr>", desc = "Companion: chat history" },

		-- Inline edits / cmd
		{ "<leader>ni", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Companion: inline edit" },
		{ "<leader>nC", "<cmd>CodeCompanionCmd<cr>", desc = "Companion: cmdline gen" },

		-- Quick-fire prompt-library shortcuts (visual)
		{ "<leader>ne", "<cmd>CodeCompanion /explain<cr>", mode = "v", desc = "Companion: explain" },
		{ "<leader>nt", "<cmd>CodeCompanion /tests<cr>", mode = "v", desc = "Companion: tests" },
		{ "<leader>nr", "<cmd>CodeCompanion /review<cr>", mode = "v", desc = "Companion: review" },
		{ "<leader>nf", "<cmd>CodeCompanion /fix<cr>", mode = "v", desc = "Companion: fix" },
		{ "<leader>no", "<cmd>CodeCompanion /optimize<cr>", mode = "v", desc = "Companion: optimize" },
		{ "<leader>nD", "<cmd>CodeCompanion /docs<cr>", mode = "v", desc = "Companion: add docs" },
		{ "<leader>ng", "<cmd>CodeCompanion /commit<cr>", desc = "Companion: commit msg" },
	},
}
