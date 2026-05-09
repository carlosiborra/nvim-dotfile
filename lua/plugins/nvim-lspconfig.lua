return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"vtsls",
					"biome",
					"lua_ls",
					"pyright",
					"jsonls",
					"yamlls",
				},
				-- We drive vim.lsp.config / vim.lsp.enable ourselves below.
				-- Without this, mason-lspconfig auto-enables every server through
				-- the legacy lspconfig framework, causing double on_attach.
				automatic_enable = false,
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"stylua",
					"biome",
					"ruff",
					"js-debug-adapter",
					"prettierd",
				},
			},
		},
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local function map(lhs, rhs, desc, mode)
				vim.keymap.set(mode or "n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end
			map("gd", vim.lsp.buf.definition, "Go to definition")
			map("gD", vim.lsp.buf.declaration, "Go to declaration")
			map("gr", vim.lsp.buf.references, "References")
			map("gi", vim.lsp.buf.implementation, "Implementation")
			map("gy", vim.lsp.buf.type_definition, "Type definition")
			map("K", vim.lsp.buf.hover, "Hover docs")
			-- Insert-mode signature help so it doesn't shadow window-up `<C-k>` in normal mode.
			map("<C-k>", vim.lsp.buf.signature_help, "Signature help", "i")
			map("<leader>rN", vim.lsp.buf.rename, "Rename symbol")
			map("<leader>la", vim.lsp.buf.code_action, "Code action")
			map("[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, "Prev diagnostic")
			map("]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, "Next diagnostic")
			map("<leader>le", vim.diagnostic.open_float, "Line diagnostics")
		end

		-- Defaults applied to every server.
		vim.lsp.config("*", { capabilities = capabilities, on_attach = on_attach })

		-- Per-server overrides (merged on top of the "*" defaults).
		vim.lsp.config("vtsls", {
			settings = {
				typescript = {
					inlayHints = {
						parameterNames = { enabled = "literals" },
						variableTypes = { enabled = false },
						propertyDeclarationTypes = { enabled = true },
						functionLikeReturnTypes = { enabled = true },
					},
					updateImportsOnFileMove = { enabled = "always" },
					suggest = { completeFunctionCalls = true },
				},
				javascript = {
					inlayHints = {
						parameterNames = { enabled = "literals" },
						functionLikeReturnTypes = { enabled = true },
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					hint = { enable = true },
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.enable({ "vtsls", "biome", "lua_ls", "pyright", "jsonls", "yamlls" })
	end,
}
