-- folke/sidekick.nvim — unified hub for Claude Code, Codex, OpenCode, Copilot CLI
-- Plus Copilot LSP "Next Edit Suggestions" (multi-line refactor diffs).
return {
	"folke/sidekick.nvim",
	opts = {
		-- Copilot Next Edit Suggestions (NES) — like inline ghost text but multi-line.
		nes = {
			enabled = true,
			debounce = 100,
			trigger = { events = { "TextChanged", "InsertLeave", "CursorHold", "CursorHoldI" } },
		},
		-- AI CLI integration — auto-detects which of these are on $PATH.
		cli = {
			mux = {
				backend = "tmux", -- if you live in tmux; harmless if you don't
				enabled = false, -- enable later once you're comfortable
			},
			win = {
				layout = "right", -- "left" | "right" | "bottom" | "float"
				split = { width = 80, height = 20 },
			},
			tools = {
				claude = { cmd = { "claude" }, url = "https://docs.anthropic.com/claude/code" },
				codex = { cmd = { "codex" }, url = "https://github.com/openai/codex" },
				opencode = { cmd = { "opencode" }, url = "https://opencode.ai" },
				copilot = { cmd = { "gh", "copilot" }, url = "https://github.com/cli/cli" },
			},
		},
	},
	keys = {
		-- Apply Copilot NES suggestion (or fallback to Tab) — IDE-tier killer feature
		{
			"<Tab>",
			function()
				if not require("sidekick").nes_jump_or_apply() then
					return "<Tab>"
				end
			end,
			expr = true,
			desc = "Apply Copilot next-edit suggestion",
		},

		-- AI hub
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick: toggle last",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").focus()
			end,
			desc = "Sidekick: focus",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			desc = "Sidekick: prompt picker",
		},
		{
			"<leader>aP",
			function()
				require("sidekick.cli").select()
			end,
			desc = "Sidekick: pick CLI",
		},
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "claude" })
			end,
			desc = "Sidekick: Claude Code",
		},
		{
			"<leader>ax",
			function()
				require("sidekick.cli").toggle({ name = "codex" })
			end,
			desc = "Sidekick: Codex",
		},
		{
			"<leader>ao",
			function()
				require("sidekick.cli").toggle({ name = "opencode" })
			end,
			desc = "Sidekick: OpenCode",
		},
		{
			"<leader>ag",
			function()
				require("sidekick.cli").toggle({ name = "copilot" })
			end,
			desc = "Sidekick: gh copilot",
		},

		-- Send to AI
		{
			"<leader>as",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "n", "v" },
			desc = "Send selection / current node to AI",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = "v",
			desc = "Send visual selection",
		},
		{
			"<leader>aA",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			desc = "Send full file",
		},
	},
}
