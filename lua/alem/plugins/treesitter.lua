vim.api.nvim_create_autocmd({ "Filetype" }, {
	callback = function(event)
		local ok, tsitter_config = pcall(require, "nvim_treesitter")

		-- No nvim treesitter was found, will happen once on fresh install
		if not ok then
			return
		end

		local ftype = vim.bo[event.buf].ft
		local lang = vim.treesitter.language.get_lang(ftype)

		tsitter_config.install({ lang }):await(function(err)
			if err then
				vim.notify("Treesitter install error for ft: " .. ftype .. " err: " .. err)
				return
			end

			pcall(vim.treesitter.start, event.buf)
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end)
	end,
})

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	dependecies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		--local configs = require("nvim-treesitter")

		local ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"heex",
			"javascript",
			"html",
			"css",
			"typescript",
			"go",
			"json",
			"java",
			"c",
			"cpp",
			"sql",
			"markdown",
			"bash",
			"dockerfile",
			"gitignore",
			"vim",
			"vimdoc",
		}

		local ok, tsitter_config = pcall(require, "nvim_treesitter")

		-- No nvim treesitter was found, will happen once on fresh install
		if not ok then
			return
		end

		tsitter_config.install(ensure_installed)

		-- Master branch config
		--[[configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"heex",
				"javascript",
				"html",
				"css",
				"typescript",
				"go",
				"json",
				"java",
				"c",
				"cpp",
				"sql",
				"markdown",
				"bash",
				"dockerfile",
				"gitignore",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})]]
	end,
}
