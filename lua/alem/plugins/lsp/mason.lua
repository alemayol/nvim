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
				automatic_enable = {
					exclude = {
						--We are going to handle jdtls separately
						"jdtls",
					},
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

		-- Setting up configurations for all LSPs
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local servers_config = {
			-- VimScript
			vimls = {},
			-- Golang server
			gopls = {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			},
			emmet_ls = {
				-- Emmet language server (html)
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
					"angular",
				},
			},
			lua_ls = {
				-- Configure lua server
				filetypes = {
					"lua",
				},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- Make the server recognize the vim global variable
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			qmlls = {
				-- Configure Qt lsp
			},
			clangd = {
				-- Configure c and c++ lsp
				filetypes = {
					"c",
					"cpp",
				},
				cmd = {
					"clangd",
					--		"--compile-commands=" .. lspconfig.util.path.join(vim.fn.getcwd(), "/build/compile_commands.json"),
				},
			},
			jdtls = {
				-- Configure jdtls Java lsp
				settings = {
					java = {},
				},
			},
		}

		-- Enabling autocompletion (assign to every lsp server config)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		for server, cfg in pairs(servers_config) do
			cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
			vim.lsp.config(server, cfg)
			vim.lsp.enable(server)
		end
	end,
}
