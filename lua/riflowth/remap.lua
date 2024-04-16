-- Set leader key (<leader>)
vim.g.mapleader = ' '

-- Bring back Ex mode
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Quickfix
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

-- Highlight (Combination of 'hlsearch = true')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- LSP related
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
