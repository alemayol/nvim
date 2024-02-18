return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.google_java_format,
			},
		})

		vim.keymap.set("n", "<leader>hf", vim.lsp.buf.format, {})
	end,
}
