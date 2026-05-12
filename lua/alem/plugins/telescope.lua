return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		--tag = "v0.2.0", -- or                              , tag = '0.1.8' Don't use 0.1.x again,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				-- config = function()
				--	require("telescope").load_extension("fzf")
				--end,
			},
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = {
								actions.move_selection_next,
								type = "action",
								opts = { nowait = true, silent = true },
							}, -- move to next result
							--["<C-q>"] = actions.send_selected_to_qflist + actions.openqflist, -- send selection to quick fix list
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						case_mode = "smart_case",
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			})

			telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fyzzy find file in cwd" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fyzzy find recently opened files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
			vim.keymap.set("n", "<C-g>", builtin.git_files, { desc = "Find tracked git files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "No idea" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
