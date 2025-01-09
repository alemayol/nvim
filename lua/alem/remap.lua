vim.g.mapleader = " "                            -- leader key

vim.keymap.set("n", "<leader>ep", vim.cmd.Ex)    -- go to file explorer
vim.keymap.set("n", "<leader>cl", vim.cmd.close) -- close window
vim.keymap.set("n", "<leader>lz", vim.cmd.Lazy)  -- launch lazy
vim.keymap.set("n", "<S-w>", vim.cmd.w)          -- save file
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)    -- save file and quit
vim.keymap.set("n", "<leader>ud", vim.cmd.u)     -- undo last change

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

-- Greatest remap ever (at least that's what harpoon man thinks)
vim.keymap.set("x", "<leader>p", '"_dP')

-- Next greatest remap ever asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
-- Replace the word that you are on with new input, globaly
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Give current file execute permission
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Show diagnostics line, i have a small screen
-- so it was overflowing the screen and i couldn't read it
vim.keymap.set("n", "<leader>et", vim.diagnostic.open_float)
