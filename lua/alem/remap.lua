vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ep", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cl", vim.cmd.close)
vim.keymap.set("n", "<leader>lz", vim.cmd.Lazy)
vim.keymap.set("n", "<S-w>", vim.cmd.w)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)

-- Move highlighted text and auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Append next line to current and add space
vim.keymap.set("n", "J", "mzJ`z")

-- Move half page jumping keeping cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search match in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Greatest remap ever (at least thats what harpoon man thinks)
vim.keymap.set("x", "<leader>p", '"_dP')

-- Next greatest remap ever asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
-- Replace the word that you are on with new input
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Give current file execute permission
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
