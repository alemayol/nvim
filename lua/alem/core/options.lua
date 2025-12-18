-- Change tab indenting
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.tabstop = 4 -- 4 spaces for tab
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.autoindent = true -- new line inherits current line indent

-- Enable line numbers, Enable relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Line wrap
vim.opt.wrap = true

-- Backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode position

-- Split windows
vim.opt.splitright = true -- If splitting window vertically, it will go to the right
vim.opt.splitbelow = true -- Same but horizontal, will go below

-- Search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- Enable case-sensitive search when your search has mixed case

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
vim.opt.background = "dark" -- if theme allows it, will go to dark mode


-- Change visible lines as u scroll
vim.opt.scrolloff = 8

-- Fast update time
vim.opt.updatetime = 50

-- Colorcolumnmn... GREAT! (i have no idea what it does... apparently it puts the vertical bar)
--vim.opt.colorcolumn = "80"
vim.opt.colorcolumn = "80"

-- Setting system clipboard
--vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append("unnamedplus")

