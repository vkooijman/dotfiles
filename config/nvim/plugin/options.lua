local o = vim.opt
local c = vim.cmd

-- UI/UX configuration
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 10
o.termguicolors = true
o.mouse = "a"
c.colorscheme "catppuccin"

-- Indentation configuration
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true
o.wrap = false

-- Undo configuration
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- Search configuration
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

-- Folding configuration recommended by nvim-ufo
o.foldcolumn = '1'
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Splitting configuration
o.splitright = true
o.splitbelow = true

-- System clipboard access
o.clipboard = "unnamed,unnamedplus"
