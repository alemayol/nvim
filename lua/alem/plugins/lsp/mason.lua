return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")
		-- Import mason tool installer
		local mason_ti = require("mason-tool-installer")

		--Enable and configure mason
		mason.setup({
			opts = {
				registries = {
					"github:mason-org/mason-registry",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"rust_analyzer",
				"ts_ls",
				"tailwindcss",
				"cssls",
				"gopls",
				"clangd",
				"emmet_ls",
				"pyright",
			},
			--automatic_installation = true,
		})

		-- Mason tool installer (for linters and formatters)
		mason_ti.setup({
			ensure_installed = {
				"stylua",
				"prettierd",
				"isort",
				"ruff",
				"clang-format",
				"eslint_d",
				"pylint",
			},
		})
	end,
}
