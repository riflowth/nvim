require('riflowth.option')
require('riflowth.remap')
require('riflowth.lazyinit')

-- Shorthand
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup('highlight-yank', {})
local lsp_group = augroup('lsp-attach', {})

-- Highlight when yanking
autocmd('TextYankPost', {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Load associated LSP automatically to current buffer
autocmd('LspAttach', {
  group = lsp_group,
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, opts)

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

vim.g.netrw_banner = 0
