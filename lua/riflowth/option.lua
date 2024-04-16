-- Enable mouse
vim.opt.mouse = 'a'

-- Line number with relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Layouting
vim.opt.signcolumn = 'yes'
vim.opt.showmode = false

-- Displaying
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.updatetime = 250

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Recovering
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undo'
