return {
	"tpope/vim-fugitive",
	name = "fugitive",
	config = function()
		--  Launch fugitive
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		-- View diff in file
		vim.keymap.set("n", "<leader>gf", vim.cmd.Gdiffsplit)
	end,
}

