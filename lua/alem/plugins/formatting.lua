return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "ruff" },
				cpp = { "clang-format" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				javascriptangular = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				typecriptangular = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>hf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file (or range of text in visual mode)" })
	end,
}
