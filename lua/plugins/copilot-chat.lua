-- In-buffer chat with Claude Sonnet 4 / GPT / Gemini routed through your Copilot auth.
return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		"zbirenbaum/copilot.lua",
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken",
	cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatModels", "CopilotChatPrompts" },
	opts = {
		model = "claude-sonnet-4", -- :CopilotChatModels to switch (gpt-4.1, gemini-2.5-pro, ...)
		temperature = 0.1,
		auto_insert_mode = true,
		highlight_headers = false, -- works better with render-markdown
		separator = "---",
		error_header = "> [!ERROR] ",
		window = { layout = "vertical", width = 0.4 },
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Chat: toggle" },
		{ "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "Chat: pick model" },
		{ "<leader>cp", "<cmd>CopilotChatPrompts<cr>", desc = "Chat: prompts" },
		{ "<leader>cd", "<cmd>CopilotChatCommit<cr>", desc = "Chat: generate commit msg" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Chat: explain selection" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Chat: fix selection" },
		{ "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "Chat: generate tests" },
		{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = "v", desc = "Chat: review selection" },
		{ "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "Chat: optimize" },
		{ "<leader>cD", "<cmd>CopilotChatDocs<cr>", mode = "v", desc = "Chat: write docs" },
	},
}
