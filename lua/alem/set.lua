-- Change tab indenting
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Enable line numbers, Enable relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- No line wrap
vim.opt.wrap = true

-- Disable swap file and backup, Allow long running undos to undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- Disable highlight search, Enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- I like good colors
vim.opt.termguicolors = true

-- Change visible lines as u scroll
vim.opt.scrolloff = 8

-- Fast update time
vim.opt.updatetime = 50

-- Colorcolumnmn... GREAT! (i have no idea what it does... apparently it puts the vertical bar)
--vim.opt.colorcolumn = "80"
vim.opt.colorcolumn = "80"

-- Setting system clipboard
vim.opt.clipboard = "unnamedplus"
