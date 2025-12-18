return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local mason_lspconfig = require("mason-lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(env)
				-- Buffer local mappings
				-- :help vim.lsp.* for documentation
				local opts = { buffer = env.buf, silent = true }

				-- Set keymaps
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definitions, references

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Show lsp definitions

				opts.desc = "Show LSP implementation"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Show lsp implementations

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Show type definitions

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "leader<co>", vim.lsp.buf.code_action, opts) -- See available code actions

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Smart rename

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Show diagnostics for buffer

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostics for line

				opts.desc = "Go to previous diagnostics"
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagnostics

				opts.desc = "Go to next diagnostics"
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts) -- Jump to previous diagnostics

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- Restart lsp if necessary
			end,
		})

		-- Enabling autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["gopls"] = function()
				-- Golang server
				lspconfig["gopls"].setup({
					capabilities = capabilities,
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
				})
			end,
			["emmet_ls"] = function()
				-- Emmet language server (html)
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
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
				})
			end,
			["lua_ls"] = function()
				-- Configure lua server
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- Make the server recognize the vim global variable
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["qmlls"] = function()
				-- Configure Qt lsp
				lspconfig["qmlls"].setup({
					capabilities = capabilities,
				})
			end,
			["clangd"] = function()
				-- Configure c and c++ lsp
				lspconfig["clangd"].setup({
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--compile-commands="
							.. lspconfig.util.path.join(vim.fn.getcwd(), "/build/compile_commands.json"),
					},
				})
			end,
		})
	end,
}
