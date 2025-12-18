return {
	"mbbill/undotree",
	name = "undotree",
	config = function()
		-- Undotree, see list of changes in a file
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Open undotree
	end,
}
